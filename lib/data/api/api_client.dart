import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:mytal/data/model/body/admin/admin_patient_body.dart';
import 'package:mytal/data/model/body/change_password_body.dart';
import 'package:mytal/data/model/body/chat_message_body.dart';
import 'package:mytal/data/model/body/chelation_body.dart';
import 'package:mytal/data/model/body/complication_body.dart';
import 'package:mytal/data/model/body/ferritin_body.dart';
import 'package:mytal/data/model/body/height_weight_body.dart';
import 'package:mytal/data/model/body/laboratory_body.dart';
import 'package:mytal/data/model/body/login_body.dart';
import 'package:mytal/data/model/body/mri_body.dart';
import 'package:mytal/data/model/body/patient_detail_body.dart';
import 'package:mytal/data/model/body/register_body.dart';
import 'package:mytal/data/model/body/therapy_complications_body.dart';
import 'package:mytal/data/model/body/transfusion_body.dart';
import 'package:mytal/data/model/response/admin/admin_patient_model.dart';
import 'package:mytal/data/model/response/centre_model.dart';
import 'package:mytal/data/model/response/change_password_model.dart';
import 'package:mytal/data/model/response/chelation_model.dart';
import 'package:mytal/data/model/response/chelation_type_model.dart';
import 'package:mytal/data/model/response/complication_model.dart';
import 'package:mytal/data/model/response/diagnosis_model.dart';
import 'package:mytal/data/model/response/ethnic_model.dart';
import 'package:mytal/data/model/response/ferritin_chart_model.dart';
import 'package:mytal/data/model/response/ferritin_model.dart';
import 'package:mytal/data/model/response/growth_chart_model.dart';
import 'package:mytal/data/model/response/height_weight_chart_model.dart';
import 'package:mytal/data/model/response/height_weight_model.dart';
import 'package:mytal/data/model/response/laboratory_model.dart';
import 'package:mytal/data/model/response/lic_severity_model.dart';
import 'package:mytal/data/model/response/login_model.dart';
import 'package:mytal/data/model/response/mic_severity_model.dart';
import 'package:mytal/data/model/response/mri_model.dart';
import 'package:mytal/data/model/response/patient_detail_model.dart';
import 'package:mytal/data/model/response/register_model.dart';
import 'package:mytal/data/model/response/report/diagnosis_report_model.dart';
import 'package:mytal/data/model/response/report/ethnic_report_model.dart';
import 'package:mytal/data/model/response/report/sex_report_model.dart';
import 'package:mytal/data/model/response/report/thal_code_report_model.dart';
import 'package:mytal/data/model/response/sex_model.dart';
import 'package:mytal/data/model/response/therapy_complications_model.dart';
import 'package:mytal/data/model/response/transfusion_model.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/app_constants.dart';
import 'package:mytal/util/globals.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  String appBaseUrl = "https://internexusprotocol.com/mythal";

  final SharedPreferences sharedPreferences;
  // static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;

  String? token;
  String? tenantId;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.apiToken);
    if (kDebugMode) {
      debugPrint('Token: $token');
    }
    tenantId = sharedPreferences.getString(AppConstants.tenantId);
    if (kDebugMode) {
      debugPrint('TenantId: $tenantId');
    }
    updateHeader(token, tenantId);
  }

  void updateHeader(String? token, String? tenantId) {
    _mainHeaders = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      // AppConstants.zoneId: zoneIDs != null ? jsonEncode(zoneIDs) : '',
      // AppConstants.localizationKey: languageCode ?? AppConstants.languages[0].languageCode!,
      // AppConstants.latitude: latitude != null ? jsonEncode(latitude) : '',
      // AppConstants.longitude: longitude != null ? jsonEncode(longitude) : '',
      // Attach authorizationHeader if has token
      // if (token != null)
      // HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    // Attach authorizationHeader if has token
    if (token != null) {
      _mainHeaders[HttpHeaders.authorizationHeader] = "Bearer $token";
    }

    if (tenantId != null) {
      _mainHeaders[AppConstants.tenantHeader] = tenantId;
    }
  }

  void signOut([WidgetRef? ref]) {
    // TODO: how to get ref when signOut called from API client
    if (ref != null) {
      var prefs = ref.read(prefsProvider.notifier);
      prefs.remove(AppConstants.apiToken);
      prefs.remove(AppConstants.tenantId);
      prefs.remove(AppConstants.profileName);
      prefs.remove(AppConstants.username);
      prefs.remove(AppConstants.privileges);
    } else {
      sharedPreferences.remove(AppConstants.apiToken);
      sharedPreferences.remove(AppConstants.tenantId);
      sharedPreferences.remove(AppConstants.profileName);
      sharedPreferences.remove(AppConstants.username);
      sharedPreferences.remove(AppConstants.privileges);
    }

    token = null;
    tenantId = null;
    updateHeader(token, tenantId);
  }

  void signIn(WidgetRef ref, LoginModel login) {
    token = login.token;
    tenantId = login.tenantId;
    var prefs = ref.read(prefsProvider.notifier);

    prefs.setString(AppConstants.profileName, login.name!);
    prefs.setString(AppConstants.username, login.username!);
    prefs.setString(AppConstants.apiToken, login.token!);
    prefs.setString(AppConstants.tenantId, login.tenantId!);
    prefs.setString(AppConstants.privileges, login.privileges![0]);
    updateHeader(token, tenantId);
  }

  Future<http.Response> getData(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    String finalUri = appBaseUrl + uri;
    if (query != null) {
      finalUri += '?';
      query.forEach((key, value) {
        finalUri += '$key=$value&';
      });
      finalUri = finalUri.substring(0, finalUri.length - 1);
    }

    if (kDebugMode) {
      debugPrint('====> API Call: $finalUri\nHeader: $_mainHeaders');
    }

    http.Response response = await http
        .get(
          Uri.parse(finalUri),
          headers: headers ?? _mainHeaders,
        )
        .timeout(Duration(seconds: timeoutInSeconds));

    debugPrint('====> API RESPONSE ${response.statusCode}: ${response.body}',
        wrapWidth: 1024);

    if (response.statusCode == 401) {
      signOut();
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil('/login', (route) => false);
      throw "Unauthorized";
    }

    return response;
  }

  Future<http.Response> postData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    Object httpBody;
    if (body is List) {
      httpBody = jsonEncode(body.map((e) => e.toJson()).toList());
    } else {
      httpBody = jsonEncode({...body.toJson(), "tenantId": tenantId});
    }

    try {
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Body: ${httpBody.toString()}');
      }
      http.Response response = await http
          .post(
            Uri.parse(appBaseUrl + uri),
            body: httpBody,
            headers: headers ?? _mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      debugPrint('====> API RESPONSE ${response.statusCode}: ${response.body}',
          wrapWidth: 1024);

      if (response.statusCode == 401) {
        signOut();
        navigatorKey.currentState!
            .pushNamedAndRemoveUntil('/login', (route) => false);
        throw "Unauthorized";
      }
      return response;
    } catch (_) {
      rethrow;
      // return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<LoginModel> login(LoginBody loginBody) async {
    http.Response response = await postData(AppConstants.loginUri, loginBody);
    ApiResponse body = ApiResponse.fromJson(
        jsonDecode(response.body), (result) => LoginModel.fromJson(result));
    if (!body.isSuccess) {
      // throw body.errorMessages.join(', ');
      throw body.result.message;
    }
    return body.result;
  }

  Future<RegisterModel> register(RegisterBody registerBody) async {
    http.Response response =
        await postData(AppConstants.registerUri, registerBody);
    ApiResponse body = ApiResponse.fromJson(
        jsonDecode(response.body), (result) => RegisterModel.fromJson(result));
    if (!body.isSuccess) {
      // throw body.errorMessages.join(', ');
      throw body.result.message;
    }
    return body.result;
  }

  Future<ChangePasswordModel> changePassword(
      ChangePasswordBody changePasswordBody) async {
    http.Response response =
        await postData(AppConstants.changePasswordUri, changePasswordBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => ChangePasswordModel.fromJson(result));
    if (body.result.statusCode == 0) {
      throw body.result.message;
    }
    return body.result;
  }

  // body.result is a string
  Future<String> chat(ChatMessageBody chatMessageBody) async {
    http.Response response = await getData(AppConstants.chatUri,
        query: {"question": chatMessageBody.question});
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    return body.result;
  }

  Future<void> deleteHeightWeight(int id) async {
    http.Response response =
        await getData("${AppConstants.deleteHeightWeightUri}/$id");
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> editHeightWeight(EditHeightWeightBody editHeightWeightBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? AppConstants.adminEditHeightWeightUri
        : AppConstants.editHeightWeightUri;
    http.Response response = await postData(uri, editHeightWeightBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> addHeightWeight(AddHeightWeightBody addHeightWeightBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminAddHeightWeightUri}/$patientId'
        : AppConstants.addHeightWeightUri;
    http.Response response = await postData(uri, addHeightWeightBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<HeightWeightResponse> getHeightWeight(int pageNumber,
      [int? patientId]) async {
    String uri = patientId != null
        ? AppConstants.adminHeightWeightUri
        : AppConstants.heightWeightUri;
    http.Response response = await getData(
      uri,
      query: {
        "orderBy": "measuredDate",
        "descending": true,
        "pageSize": 10,
        "pageNumber": pageNumber,
        ...patientId != null ? {"id": patientId} : {},
      },
    );
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => HeightWeightModel.decode(result["items"]));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }

    return HeightWeightResponse(
      metaData: body.metaData,
      heightWeight: body.result,
    );
  }

  Future<void> editPatientDetails(EditPatientDetailBody patientBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminEditPatientUri}/$patientId'
        : AppConstants.editPatientDetailsUri;
    http.Response response = await postData(uri, patientBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  // TODO: Paginated table not implemented. Increased page size
  Future<ChelationResponse> getChelation(int pageNumber,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminChelationUri}/$patientId'
        : AppConstants.chelationUri;
    http.Response response = await getData(
      uri,
      query: {
        "orderBy": "dateStarted",
        "descending": true,
        "pageSize": 50,
        "pageNumber": pageNumber,
      },
    );
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => ChelationModel.decode(result["items"]));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }

    return ChelationResponse(
      metaData: body.metaData,
      chelation: body.result,
    );
  }

  Future<FerritinResponse> getFerritin(int pageNumber, [int? patientId]) async {
    String uri = patientId != null
        ? AppConstants.adminFerritinUri
        : AppConstants.ferritinUri;
    http.Response response = await getData(
      uri,
      query: {
        "orderBy": "measuredDate",
        "descending": true,
        "pageSize": 10,
        "pageNumber": pageNumber,
        ...patientId != null ? {"id": patientId} : {},
      },
    );
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => FerritinModel.decode(result["items"]));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }

    return FerritinResponse(
      metaData: body.metaData,
      ferritin: body.result,
    );
  }

  Future<void> addMri(AddMriBody addMriBody, [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminAddMriUri}/$patientId'
        : AppConstants.addMriUri;
    http.Response response = await postData(uri, addMriBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> editMri(EditMriBody editMriBody, [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminEditMriUri}/$patientId'
        : AppConstants.editMriUri;
    http.Response response = await postData(uri, editMriBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> addChelation(AddChelationBody addChelationBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminAddChelationUri}/$patientId'
        : AppConstants.addChelationUri;
    http.Response response = await postData(uri, addChelationBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> editChelation(EditChelationBody editChelationBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminEditChelationUri}/$patientId'
        : AppConstants.editChelationUri;
    http.Response response = await postData(uri, editChelationBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> deleteChelation(int id) async {
    http.Response response =
        await getData("${AppConstants.deleteChelationUri}/$id");
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> addFerritin(AddFerritinBody addFerritinBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminAddFerritinUri}/$patientId'
        : AppConstants.addFerritinUri;
    http.Response response = await postData(uri, addFerritinBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> editFerritin(EditFerritinBody editFerritinBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? AppConstants.adminEditFerritinUri
        : AppConstants.editFerritinUri;
    http.Response response = await postData(uri, editFerritinBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> deleteFerritin(int id) async {
    http.Response response =
        await getData("${AppConstants.deleteFerritinUri}/$id");
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> editLaboratory(EditLaboratoryBody editLaboratoryBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? AppConstants.adminEditLaboratoryUri
        : AppConstants.editLaboratoryUri;
    http.Response response = await postData(uri, editLaboratoryBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<TransfusionResponse> getTransfusion(int pageNumber,
      [int? patientId]) async {
    String uri = patientId != null
        ? AppConstants.adminTransfusionUri
        : AppConstants.transfusionUri;
    http.Response response = await getData(
      uri,
      query: {
        "orderBy": "measuredDate",
        "descending": true,
        "pageSize": 10,
        "pageNumber": pageNumber,
        ...patientId != null ? {"id": patientId} : {},
      },
    );
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => TransfusionModel.decode(result["items"]));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }

    return TransfusionResponse(
      metaData: body.metaData,
      transfusion: body.result,
    );
  }

  Future<void> addTransfusion(AddTransfusionBody addTransfusionBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminAddTransfusionUri}/$patientId'
        : AppConstants.addTransfusionUri;
    http.Response response = await postData(uri, addTransfusionBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> editTransfusion(EditTransfusionBody editTransfusionBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminEditTransfusionUri}/$patientId'
        : AppConstants.editTransfusionUri;
    http.Response response = await postData(uri, editTransfusionBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> deleteTransfusion(int id) async {
    http.Response response =
        await getData("${AppConstants.deleteTransfusionUri}/$id");
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> editComplication(EditComplicationBody editComplicationBody,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminEditComplicationUri}/$patientId'
        : AppConstants.editComplicationUri;
    http.Response response = await postData(uri, editComplicationBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  Future<void> editTherapyComplications(
      List<EditTherapyComplicationsBody> complications,
      [int? patientId]) async {
    String uri = patientId != null
        ? '${AppConstants.adminEditTherapyComplicationsUri}/$patientId'
        : AppConstants.editTherapyComplicationsUri;
    http.Response response = await postData(uri, complications);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }

  // Admin
  Future<AdminPatientResponse> adminGetPatients(
      int pageNumber, String? searchFilter) async {
    http.Response response =
        await getData(AppConstants.adminPatientListUri, query: {
      "pageSize": 10,
      "pageNumber": pageNumber,
      ...((searchFilter ?? "").isNotEmpty ? {"searchTerm": searchFilter} : {}),
    });
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => AdminPatientModel.decode(result["items"]));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }

    return AdminPatientResponse(
      metaData: body.metaData,
      patients: body.result,
    );
  }

  Future<void> adminAddPatient(AdminPatientBody adminPatientBody) async {
    http.Response response =
        await postData(AppConstants.adminAddPatientUri, adminPatientBody);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body));
    if (!body.isSuccess) {
      throw body.errorMessages.join(', ');
    }
    return body.result;
  }
}

class MetaDataResponse {
  int currentPage;
  int pageSize;
  int totalCount;
  int totalPages;
  bool hasNext;
  bool hasPrevious;
  MetaDataResponse({
    required this.currentPage,
    required this.pageSize,
    required this.totalCount,
    required this.totalPages,
    required this.hasNext,
    required this.hasPrevious,
  });
}

class ApiResponse<T> {
  int statusCode;
  bool isSuccess;
  List<String> errorMessages;
  T result;
  MetaDataResponse? metaData;

  ApiResponse(
      {required this.statusCode,
      required this.isSuccess,
      required this.errorMessages,
      required this.result,
      this.metaData});

  factory ApiResponse.fromJson(Map<String, dynamic> json,
      [Function(Map<String, dynamic>)? create]) {
    var response = ApiResponse<T>(
        statusCode: json["statusCode"],
        isSuccess: json["isSuccess"],
        errorMessages:
            json["errorMessages"].map<String>((e) => e.toString()).toList(),
        result: json["result"] is String
            ? json["result"]
            : create != null
                ? create(json["result"])
                : null,
        metaData: (json["result"] != null &&
                json["result"] is! String &&
                json["result"]["metaData"] != null)
            ? MetaDataResponse(
                currentPage: json["result"]["metaData"]["currentPage"],
                pageSize: json["result"]["metaData"]["pageSize"],
                totalCount: json["result"]["metaData"]["totalCount"],
                totalPages: json["result"]["metaData"]["totalPages"],
                hasNext: json["result"]["metaData"]["hasNext"],
                hasPrevious: json["result"]["metaData"]["hasPrevious"],
              )
            : null);

    return response;
  }

  Map<String, dynamic> toJson() => {
        "statusCode": this.statusCode,
        "isSuccess": this.isSuccess,
        "errorMessages": this.errorMessages,
        "result": this.result,
      };
}

// When "result" json is returned as an array
class ApiResponseList<T> {
  int statusCode;
  bool isSuccess;
  List<String> errorMessages;
  List<dynamic> result;
  ApiResponseList(
      {required this.statusCode,
      required this.isSuccess,
      required this.errorMessages,
      required this.result});

  factory ApiResponseList.fromJson(
      Map<String, dynamic> json, Function(List<dynamic>) create) {
    return ApiResponseList<T>(
      statusCode: json["statusCode"],
      isSuccess: json["isSuccess"],
      errorMessages:
          json["errorMessages"].map<String>((e) => e.toString()).toList(),
      result: create(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": this.statusCode,
        "isSuccess": this.isSuccess,
        "errorMessages": this.errorMessages,
        "result": this.result,
      };
}

// abstract class Serializable {
//   Map<String, dynamic> toJson();
// }
final heightWeightProvider = FutureProvider<HeightWeightResponse>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    final responses = await Future.wait([
      GetIt.I.get<ApiClient>().getData(AppConstants.heightWeightUri, query: {
        "orderBy": "measuredDate",
        "descending": true,
        "pageSize": 10
      }),
      GetIt.I.get<ApiClient>().getData(AppConstants.heightWeightChartUri),
      GetIt.I.get<ApiClient>().getData(AppConstants.growthChartUri),
    ]);

    ApiResponse heightWeightBody = ApiResponse.fromJson(
        jsonDecode(responses[0].body),
        (result) => HeightWeightModel.decode(result["items"]));
    ApiResponseList heightWeightChartBody = ApiResponseList.fromJson(
        jsonDecode(responses[1].body),
        (result) => HeightWeightChartModel.decode(result));

    ApiResponseList growthChartBody = ApiResponseList.fromJson(
        jsonDecode(responses[2].body),
        (result) => GrowthChartModel.decode(result));
    return HeightWeightResponse(
      metaData: heightWeightBody.metaData,
      heightWeight: heightWeightBody.result,
      heightWeightChart:
          heightWeightChartBody.result as List<HeightWeightChartModel>,
      growthChart: growthChartBody.result as List<GrowthChartModel>,
    );
  },
);

// TODO: not used
final heightWeightChartProvider = FutureProvider<List<HeightWeightModel>>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response = await GetIt.I.get<ApiClient>().getData(
        AppConstants.heightWeightUri,
        query: {"orderBy": "measuredDate", "descending": true});
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => HeightWeightModel.decode(result["items"]));
    return body.result;
  },
);

final transfusionProvider = FutureProvider<List<TransfusionModel>>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData(AppConstants.transfusionUri, query: {
      "orderBy": "dateTransfusion",
      "descending": true,
      "pageSize": 10
    });
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => TransfusionModel.decode(result["items"]));
    return body.result;
  },
);

final mriProvider = FutureProvider<MriResponse>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response = await GetIt.I.get<ApiClient>().getData(
      AppConstants.mriUri,
      query: {
        "orderBy": "dateMri",
        "descending": true,
        "pageSize": 50,
      },
    );
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => MriModel.decode(result["items"]));

    return MriResponse(
      metaData: body.metaData,
      mri: body.result,
    );
  },
);

final diagnosisProvider = FutureProvider<DiagnosisModel>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.diagnosisUri);
    ApiResponse body = ApiResponse.fromJson(
        jsonDecode(response.body), (result) => DiagnosisModel.fromJson(result));

    return body.result;
  },
);

final chelationProvider = FutureProvider<ChelationResponse>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response = await GetIt.I.get<ApiClient>().getData(
      AppConstants.chelationUri,
      query: {
        "orderBy": "dateStarted",
        "descending": true,
        "pageSize": 50,
      },
    );
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => ChelationModel.decode(result["items"]));

    return ChelationResponse(
      metaData: body.metaData,
      chelation: body.result,
    );
  },
);

final ferritinProvider = FutureProvider<FerritinResponse>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    final responses = await Future.wait([
      GetIt.I.get<ApiClient>().getData(AppConstants.ferritinUri, query: {
        "orderBy": "dateMeasured",
        "descending": true,
        "pageSize": 10
      }),
      GetIt.I.get<ApiClient>().getData(AppConstants.ferritinChartUri),
    ]);

    ApiResponse ferritinBody = ApiResponse.fromJson(
        jsonDecode(responses[0].body),
        (result) => FerritinModel.decode(result["items"]));
    ApiResponseList ferritinChartBody = ApiResponseList.fromJson(
        jsonDecode(responses[1].body),
        (result) => FerritinChartModel.decode(result));
    return FerritinResponse(
      metaData: ferritinBody.metaData,
      ferritin: ferritinBody.result,
      ferritinChart: ferritinChartBody.result as List<FerritinChartModel>,
    );
  },
);

// final complicationsProvider = FutureProvider<List<ComplicationModel>>(
//   (ref) async {
//     List<ComplicationModel> complications = [];
//     final responses = await Future.wait([
//       GetIt.I.get<ApiClient>().getData(AppConstants.complicationHepBUri),
//       GetIt.I.get<ApiClient>().getData(AppConstants.complicationHepCUri),
//       GetIt.I.get<ApiClient>().getData(AppConstants.complicationHivUri),
//       GetIt.I.get<ApiClient>().getData(AppConstants.complicationOthersUri),
//     ]);

//     for (final response in responses) {
//       ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body), (result) => ComplicationModel.decode(result));
//       complications.addAll(body.result as List<ComplicationModel>);
//     }

//     return complications;
//   },
// );

final complicationHepBProvider = FutureProvider<List<ComplicationModel>>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData(AppConstants.complicationHepBUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ComplicationModel.decode(result));
    return body.result as List<ComplicationModel>;
  },
);

final complicationHepCProvider = FutureProvider<List<ComplicationModel>>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData(AppConstants.complicationHepCUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ComplicationModel.decode(result));
    return body.result as List<ComplicationModel>;
  },
);

final complicationHivProvider = FutureProvider<List<ComplicationModel>>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.complicationHivUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ComplicationModel.decode(result));
    return body.result as List<ComplicationModel>;
  },
);

final complicationOthersProvider = FutureProvider<List<ComplicationModel>>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData(AppConstants.complicationOthersUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ComplicationModel.decode(result));
    return body.result as List<ComplicationModel>;
  },
);

final patientDetailsProvider = FutureProvider<PatientDetailModel>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }

    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.patientDetailsUri);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => PatientDetailModel.fromJson(result));
    return body.result;
  },
);

final laboratoryProvider = FutureProvider<LaboratoryModel>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.laboratoryUri);
    ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
        (result) => LaboratoryModel.fromJson(result));
    return body.result;
  },
);

final therapyComplicationsProvider =
    FutureProvider<List<TherapyComplicationsModel>>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData(AppConstants.therapyComplicationsUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => TherapyComplicationsModel.decode(result));
    return body.result as List<TherapyComplicationsModel>;
  },
);

final allTherapyComplicationsProvider =
    FutureProvider<List<TherapyComplicationsModel>>(
  (ref) async {
    var apiToken = ref
        .watch(prefsProvider.select((prefs) => prefs[AppConstants.apiToken]));
    if (apiToken.isEmpty) {
      throw "Unauthorized";
    }
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData(AppConstants.allTherapyComplicationsUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => TherapyComplicationsModel.decode(result));
    return body.result as List<TherapyComplicationsModel>;
  },
);

final sexListProvider = FutureProvider<List<SexModel>>(
  (ref) async {
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.sexListUri);
    ApiResponseList body = ApiResponseList.fromJson(
        jsonDecode(response.body), (result) => SexModel.decode(result));
    return body.result as List<SexModel>;
  },
);

final licSeverityProvider = FutureProvider<List<LicSeverityModel>>(
  (ref) async {
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.licSeverityList);
    ApiResponseList body = ApiResponseList.fromJson(
        jsonDecode(response.body), (result) => LicSeverityModel.decode(result));
    return body.result as List<LicSeverityModel>;
  },
);

final micSeverityProvider = FutureProvider<List<MicSeverityModel>>(
  (ref) async {
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.micSeverityList);
    ApiResponseList body = ApiResponseList.fromJson(
        jsonDecode(response.body), (result) => MicSeverityModel.decode(result));
    return body.result as List<MicSeverityModel>;
  },
);

final centreListProvider = FutureProvider<List<CentreModel>>(
  (ref) async {
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.centreListUri);
    ApiResponseList body = ApiResponseList.fromJson(
        jsonDecode(response.body), (result) => CentreModel.decode(result));
    return body.result as List<CentreModel>;
  },
);

final ethnicListProvider = FutureProvider<List<EthnicModel>>(
  (ref) async {
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.ethnicListUri);
    ApiResponseList body = ApiResponseList.fromJson(
        jsonDecode(response.body), (result) => EthnicModel.decode(result));
    return body.result as List<EthnicModel>;
  },
);

final chelationTypeListProvider = FutureProvider<List<ChelationTypeModel>>(
  (ref) async {
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData(AppConstants.chelationTypeListUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ChelationTypeModel.decode(result));
    return body.result as List<ChelationTypeModel>;
  },
);

final adminPatientProvider = FutureProvider.autoDispose
    .family<PatientDetailModel, String>((ref, id) async {
  http.Response response = await GetIt.I
      .get<ApiClient>()
      .getData('${AppConstants.adminPatientUri}/$id');
  ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
      (result) => PatientDetailModel.fromJson(result));
  return body.result;
});

final adminHeightWeightProvider =
    FutureProvider.autoDispose.family<HeightWeightResponse, String>(
  (ref, id) async {
    final responses = await Future.wait([
      GetIt.I.get<ApiClient>().getData(AppConstants.adminHeightWeightUri,
          query: {
            "id": id,
            "orderBy": "measuredDate",
            "descending": true,
            "pageSize": 10
          }),
      GetIt.I
          .get<ApiClient>()
          .getData('${AppConstants.adminHeightWeightChartUri}/$id'),
      GetIt.I.get<ApiClient>().getData(AppConstants.growthChartUri),
    ]);

    ApiResponse heightWeightBody = ApiResponse.fromJson(
        jsonDecode(responses[0].body),
        (result) => HeightWeightModel.decode(result["items"]));
    ApiResponseList heightWeightChartBody = ApiResponseList.fromJson(
        jsonDecode(responses[1].body),
        (result) => HeightWeightChartModel.decode(result));
    ApiResponseList growthChartBody = ApiResponseList.fromJson(
        jsonDecode(responses[2].body),
        (result) => GrowthChartModel.decode(result));

    return HeightWeightResponse(
      metaData: heightWeightBody.metaData,
      heightWeight: heightWeightBody.result,
      heightWeightChart:
          heightWeightChartBody.result as List<HeightWeightChartModel>,
      growthChart: growthChartBody.result as List<GrowthChartModel>,
    );
  },
);

final adminLaboratoryProvider =
    FutureProvider.autoDispose.family<LaboratoryModel, String>((ref, id) async {
  http.Response response = await GetIt.I
      .get<ApiClient>()
      .getData('${AppConstants.adminLaboratoryUri}/$id');
  ApiResponse body = ApiResponse.fromJson(
      jsonDecode(response.body), (result) => LaboratoryModel.fromJson(result));
  return body.result;
});

final adminTransfusionProvider = FutureProvider.autoDispose
    .family<List<TransfusionModel>, String>((ref, id) async {
  http.Response response = await GetIt.I
      .get<ApiClient>()
      .getData(AppConstants.adminTransfusionUri, query: {
    "id": id,
    "orderBy": "dateTransfusion",
    "descending": true,
    "pageSize": 10
  });

  ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
      (result) => TransfusionModel.decode(result["items"]));

  return body.result;
});

// TODO: Paginated table not implemented. Increased page size
final adminMriProvider =
    FutureProvider.autoDispose.family<MriResponse, String>((ref, id) async {
  http.Response response = await GetIt.I
      .get<ApiClient>()
      .getData('{AppConstants.adminMriUri}', query: {
    "id": id,
    "orderBy": "dateStarted",
    "descending": true,
    "pageSize": 50
  });

  ApiResponse body = ApiResponse.fromJson(
      jsonDecode(response.body), (result) => MriModel.decode(result["items"]));

  return MriResponse(
    metaData: body.metaData,
    mri: body.result,
  );
});

final adminDiagnosisProvider =
    FutureProvider.autoDispose.family<DiagnosisModel, String>((ref, id) async {
  http.Response response = await GetIt.I
      .get<ApiClient>()
      .getData('${AppConstants.adminDiagnosisUri}/$id');

  ApiResponse body = ApiResponse.fromJson(
      jsonDecode(response.body), (result) => DiagnosisModel.fromJson(result));

  return body.result;
});

// TODO: Paginated table not implemented. Increased page size
final adminChelationProvider = FutureProvider.autoDispose
    .family<ChelationResponse, String>((ref, id) async {
  http.Response response = await GetIt.I.get<ApiClient>().getData(
      '${AppConstants.adminChelationUri}/$id',
      query: {"orderBy": "dateStarted", "descending": true, "pageSize": 50});

  ApiResponse body = ApiResponse.fromJson(jsonDecode(response.body),
      (result) => ChelationModel.decode(result["items"]));

  return ChelationResponse(
    metaData: body.metaData,
    chelation: body.result,
  );
});

final adminFerritinProvider =
    FutureProvider.autoDispose.family<FerritinResponse, String>(
  (ref, id) async {
    final responses = await Future.wait([
      GetIt.I.get<ApiClient>().getData(AppConstants.adminFerritinUri, query: {
        "id": id,
        "orderBy": "dateMeasured",
        "descending": true,
        "pageSize": 10
      }),
      GetIt.I
          .get<ApiClient>()
          .getData('${AppConstants.adminFerritinChartUri}/$id'),
    ]);

    ApiResponse ferritinBody = ApiResponse.fromJson(
        jsonDecode(responses[0].body),
        (result) => FerritinModel.decode(result["items"]));
    ApiResponseList ferritinChartBody = ApiResponseList.fromJson(
        jsonDecode(responses[1].body),
        (result) => FerritinChartModel.decode(result));
    return FerritinResponse(
      metaData: ferritinBody.metaData,
      ferritin: ferritinBody.result,
      ferritinChart: ferritinChartBody.result as List<FerritinChartModel>,
    );
  },
);

final adminComplicationHepBProvider =
    FutureProvider.autoDispose.family<List<ComplicationModel>, String>(
  (ref, id) async {
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData('${AppConstants.adminComplicationHepBUri}/$id');
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ComplicationModel.decode(result));
    return body.result as List<ComplicationModel>;
  },
);

final adminComplicationHepCProvider =
    FutureProvider.autoDispose.family<List<ComplicationModel>, String>(
  (ref, id) async {
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData('${AppConstants.adminComplicationHepCUri}/$id');
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ComplicationModel.decode(result));
    return body.result as List<ComplicationModel>;
  },
);

final adminComplicationHivProvider =
    FutureProvider.autoDispose.family<List<ComplicationModel>, String>(
  (ref, id) async {
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData('${AppConstants.adminComplicationHivUri}/$id');
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ComplicationModel.decode(result));
    return body.result as List<ComplicationModel>;
  },
);

final adminComplicationOthersProvider =
    FutureProvider.autoDispose.family<List<ComplicationModel>, String>(
  (ref, id) async {
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData('${AppConstants.adminComplicationOthersUri}/$id');
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ComplicationModel.decode(result));
    return body.result as List<ComplicationModel>;
  },
);

final adminTherapyComplicationsProvider =
    FutureProvider.autoDispose.family<List<TherapyComplicationsModel>, String>(
  (ref, id) async {
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData("${AppConstants.adminTherapyComplicationsUri}/$id/0");
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => TherapyComplicationsModel.decode(result));
    return body.result as List<TherapyComplicationsModel>;
  },
);

final adminAllTherapyComplicationsProvider =
    FutureProvider.autoDispose.family<List<TherapyComplicationsModel>, String>(
  (ref, id) async {
    http.Response response = await GetIt.I
        .get<ApiClient>()
        .getData("${AppConstants.adminTherapyComplicationsUri}/$id/1");
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => TherapyComplicationsModel.decode(result));
    return body.result as List<TherapyComplicationsModel>;
  },
);

final sexReportProvider = FutureProvider<List<SexReportModel>>(
  (ref) async {
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.sexReportUri);
    ApiResponseList body = ApiResponseList.fromJson(
        jsonDecode(response.body), (result) => SexReportModel.decode(result));
    return body.result as List<SexReportModel>;
  },
);

final diagnosisReportProvider = FutureProvider<List<DiagnosisReportModel>>(
  (ref) async {
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.diagnosisReportUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => DiagnosisReportModel.decode(result));
    return body.result as List<DiagnosisReportModel>;
  },
);

final ethnicReportProvider = FutureProvider<List<EthnicReportModel>>(
  (ref) async {
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.ethnicReportUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => EthnicReportModel.decode(result));
    return body.result as List<EthnicReportModel>;
  },
);

final thalCodeReportProvider = FutureProvider<List<ThalCodeReportModel>>(
  (ref) async {
    http.Response response =
        await GetIt.I.get<ApiClient>().getData(AppConstants.thalCodeReportUri);
    ApiResponseList body = ApiResponseList.fromJson(jsonDecode(response.body),
        (result) => ThalCodeReportModel.decode(result));
    return body.result as List<ThalCodeReportModel>;
  },
);
