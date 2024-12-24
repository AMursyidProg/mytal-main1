class AppConstants {
  static const String isLoading = "is_loading";
  static const String apiToken = "api_token";
  static const String tenantId = "tenant_id";
  static const String tenantHeader = "X-TENANT-ID";
  static const String username = "username";
  static const String privileges = "privileges";
  static const String roleAdmin = "Admin";
  static const String roleUser = "User";
  static const String roleCentreUser = "CentreUser";

  static const String profileName = "profile_name";
  static const String profileDob = "profile_dob";
  static const String profileGender = "profile_gender";
  static const String profileHeight = "profile_height";
  static const String profileWeight = "profile_weight";
  static const String profileTransfusion = "profile_transfusion";
  static const String profileFerritin = "profile_ferritin";
  static const String profileChelation = "profile_chelation";
  static const String profileMri = "profile_mri";
  static const String profileComplications = "profile_complications";
  static const String profileTherapyComplications =
      "profile_therapy_complications";
  static const String profilePrescriptions = "profile_prescriptions";
  static const String profileAppointments = "profile_appointments";

  static const String loginUri = '/api/Auth/login';
  static const String registerUri = '/api/Auth/register';
  static const String changePasswordUri = '/api/Auth/changepassword';
  static const String patientDetailsUri = "/api/patients/GetPatientDetails";
  static const String editPatientDetailsUri = "/api/patients/UpdatePatient";
  static const String heightWeightUri = "/api/HeightWeight/GetHeightWeightList";
  static const String deleteHeightWeightUri = "/api/HeightWeight/Delete";
  static const String editHeightWeightUri = "/api/HeightWeight/Update";
  static const String addHeightWeightUri = "/api/HeightWeight/Add";
  static const String heightWeightChartUri =
      "/api/HeightWeight/GetGraphHeightWeight";
  static const String transfusionUri = "/api/Transfusion/GetTransfusionList";
  static const String addTransfusionUri = "/api/Transfusion/Add";
  static const String editTransfusionUri = "/api/Transfusion/Update";
  static const String deleteTransfusionUri = "/api/Transfusion/Delete";
  static const String ferritinUri = "/api/Ferritin/GetFerritinList";
  static const String ferritinChartUri = "/api/Ferritin/GetGraphFerritinLevel";
  static const String addFerritinUri = "/api/Ferritin/Add";
  static const String editFerritinUri = "/api/Ferritin/Update";
  static const String deleteFerritinUri = "/api/Ferritin/Delete";
  static const String complicationHepBUri =
      "/api/Complication/GetComplicationHepatitisB";
  static const String complicationHepCUri =
      "/api/Complication/GetComplicationHepatitisC";
  static const String complicationHivUri =
      "/api/Complication/GetComplicationHiv";
  static const String complicationOthersUri =
      "/api/Complication/GetComplicationOthers";
  static const String editComplicationUri =
      "/api/complication/UpdateComplication";
  static const String laboratoryUri = "/api/patients/GetLaboratory";
  static const String editLaboratoryUri = "/api/patients/UpdateLaboratory";
  static const String therapyComplicationsUri =
      "/api/complication/GetComplicationsTherapy/0";
  static const String allTherapyComplicationsUri =
      "/api/complication/GetComplicationsTherapy/1";
  static const String editTherapyComplicationsUri =
      "/api/complication/UpdateComplicationsTherapy";
  static const String chelationUri =
      "/api/chelationhistory/getchelationhistorylist";
  static const String addChelationUri = "/api/ChelationHistory/add";
  static const String editChelationUri = "/api/ChelationHistory/Update";
  static const String deleteChelationUri = "/api/ChelationHistory/Delete";
  static const String diagnosisUri = "/api/Patients/GetPatientDiagnosis";
  static const String mriUri = "/api/Mri/GetMriList";
  static const String addMriUri = "/api/Mri/Add";
  static const String editMriUri = "/api/Mri/Update";
  static const String getMriUri = "/api/Mri/GetMriList";
  static const String getMRIGraph = "/api/Mri/GetGraphMri";

  static const String chelationTypeListUri =
      "/api/referencedata/GetChelationTypeList";
  static const String sexListUri = "/api/referencedata/getsexlist";
  static const String centreListUri = "/api/referencedata/getcentrelist";
  static const String ethnicListUri = "/api/referencedata/getethniclist";
  static const String growthChartUri =
      "/api/referencedata/GetGrowthChartList/1";
  static const String micSeverityList = "/api/referencedata/GetMicSeverityList";
  static const String licSeverityList = "/api/referencedata/GetLicSeverityList";
  static const String chatUri = "/api/patients/AskQuestion";

  // Admin
  static const String adminPatientListUri = "/api/patients/GetPatientListAdmin";
  static const String adminAddPatientUri = "/api/Patients";
  static const String adminEditPatientUri =
      "/api/patients/UpdatePatientByPatientId";
  static const String adminPatientUri = "/api/patients/GetPatientDetailsById";
  static const String adminHeightWeightUri =
      "/api/HeightWeight/GetHeightWeightListByPatientId";
  static const String adminHeightWeightChartUri =
      "/api/HeightWeight/GetGraphHeightWeightByPatientId";
  static const String adminAddHeightWeightUri =
      "/api/HeightWeight/AddPatientHeightWeight";
  static const String adminEditHeightWeightUri =
      "/api/HeightWeight/UpdatePatientHeightWeight";
  static const String adminLaboratoryUri =
      "/api/patients/GetLaboratoryByPatientId";
  static const String adminEditLaboratoryUri =
      "/api/patients/UpdateLaboratoryAdmin";
  static const String adminTransfusionUri =
      "/api/Transfusion/GetTransfusionListByPatientId";
  static const String adminAddTransfusionUri =
      "/api/Transfusion/AddPatientTransfusion";
  static const String adminEditTransfusionUri =
      "/api/Transfusion/UpdatePatientTransfusion";
  static const String adminFerritinUri = "/api/Ferritin/GetFerritinListById";
  static const String adminFerritinChartUri =
      "/api/Ferritin/GetGraphFerritinLevelById";
  static const String adminAddFerritinUri =
      "/api/Ferritin/AddPatientFerritinLevel";
  static const String adminEditFerritinUri =
      "/api/Ferritin/UpdatePatientFerritinLevel";
  static const String adminChelationUri =
      "/api/chelationhistory/getchelationhistoryByPatientId";
  static const String adminAddChelationUri =
      "/api/ChelationHistory/AddPatientChelationHistory";
  static const String adminEditChelationUri =
      "/api/ChelationHistory/UpdatePatientChelationHistory";
  static const String adminComplicationHepBUri =
      "/api/Complication/GetPatientComplicationHepatitisB";
  static const String adminComplicationHepCUri =
      "/api/Complication/GetPatientComplicationHepatitisC";
  static const String adminComplicationHivUri =
      "/api/Complication/GetPatientComplicationHiv";
  static const String adminComplicationOthersUri =
      "/api/Complication/GetPatientComplicationOthers";
  static const String adminEditComplicationUri =
      "/api/complication/UpdatePatientComplication";
  static const String adminTherapyComplicationsUri =
      "/api/complication/GetPatientComplicationsTherapy";
  static const String adminEditTherapyComplicationsUri =
      "/api/complication/UpdatePatientComplicationsTherapy";
  static const String adminDiagnosisUri =
      "/api/Patients/GetDiagnosisByPatientId";
  static const String adminMriUri = "/api/Mri/GetMriListByPatientId";
  static const String adminAddMriUri = "/api/Mri/AddPatientMri";
  static const String adminEditMriUri = "/api/Mri/UpdatePatientMri";

  static const String sexReportUri = "/api/reports/GetSexReport";
  static const String diagnosisReportUri = "/api/reports/GetDiagnosisReport";
  static const String ethnicReportUri = "/api/reports/GetEthnicReport";
  static const String thalCodeReportUri = "/api/reports/GetThalCodeReport";
}
