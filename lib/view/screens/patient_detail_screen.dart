import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/admin/admin_patient_model.dart';
import 'package:mytal/view/screens/complications_tab_view.dart';
import 'package:mytal/view/screens/profile_clinical_view.dart';
import 'package:mytal/view/screens/profile_complications_view.dart';
import 'package:mytal/view/screens/profile_details_view.dart';
import 'package:mytal/view/screens/profile_treatment_view.dart';
import 'package:mytal/view/screens/therapy_complications_view.dart';

class PatientDetailScreen extends StatefulWidget {
  final AdminPatientModel patient;

  const PatientDetailScreen({Key? key, required this.patient})
      : super(
          key: key,
        );

  @override
  PatientDetailScreenState createState() => PatientDetailScreenState();
}

class PatientDetailScreenState extends State<PatientDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Patient'),
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            const TabBar(
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              labelColor: Colors.teal,
              tabs: [
                Tab(text: 'Details'),
                Tab(text: 'Clinical'),
                Tab(text: 'Treatment'),
                Tab(text: 'Complications'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Consumer(builder: (context, ref, _) {
                    return ProfileDetailsView(
                      patientDetails: ref.watch(adminPatientProvider(widget.patient.id.toString())),
                      heightWeights: ref.watch(adminHeightWeightProvider(widget.patient.id.toString())),
                      onRefresh: () async {
                        ref.invalidate(adminHeightWeightProvider(widget.patient.id.toString()));
                        return ref.refresh(adminPatientProvider(widget.patient.id.toString()).future);
                      },
                      onHeightWeightSave: () => ref.invalidate(adminHeightWeightProvider(widget.patient.id.toString())),
                      onPatientDetailSave: () => ref.invalidate(adminPatientProvider(widget.patient.id.toString())),
                      patientId: widget.patient.id,
                    );
                  }),
                  Consumer(builder: (context, ref, _) {
                    return ProfileClinicalView(
                      laboratory: ref.watch(adminLaboratoryProvider(widget.patient.id.toString())),
                      diagnosis: ref.watch(adminDiagnosisProvider(widget.patient.id.toString())),
                      onSave: () => ref.invalidate(adminLaboratoryProvider(widget.patient.id.toString())),
                      onRefresh: () async {
                        ref.invalidate(adminDiagnosisProvider(widget.patient.id.toString()));
                        return ref.refresh(adminLaboratoryProvider(widget.patient.id.toString()).future);
                      },
                      patientId: widget.patient.id,
                    );
                  }),
                  Consumer(builder: (context, ref, _) {
                    return ProfileTreatmentView(
                      transfusions: ref.watch(adminTransfusionProvider(widget.patient.id.toString())),
                      ferritins: ref.watch(adminFerritinProvider(widget.patient.id.toString())),
                      chelations: ref.watch(adminChelationProvider(widget.patient.id.toString())),
                      mris: ref.watch(adminMriProvider(widget.patient.id.toString())),
                      onRefresh: () async {
                        ref.invalidate(adminFerritinProvider(widget.patient.id.toString()));
                        ref.invalidate(adminChelationProvider(widget.patient.id.toString()));
                        ref.invalidate(adminMriProvider(widget.patient.id.toString()));
                        return ref.refresh(adminTransfusionProvider(widget.patient.id.toString()).future);
                      },
                      onTransfusionSave: () => ref.invalidate(adminTransfusionProvider(widget.patient.id.toString())),
                      onFerritinSave: () => ref.invalidate(adminFerritinProvider(widget.patient.id.toString())),
                      onChelationSave: () => ref.invalidate(adminChelationProvider(widget.patient.id.toString())),
                      onMriSave: () => ref.invalidate(adminMriProvider(widget.patient.id.toString())),
                      patientId: widget.patient.id,
                    );
                  }),
                  ComplicationsTabView(
                    profileComplicationsView: Consumer(
                      builder: (context, ref, _) {
                        return ProfileComplicationsView(
                          complicationHepB: ref.watch(adminComplicationHepBProvider(widget.patient.id.toString())),
                          complicationHepC: ref.watch(adminComplicationHepCProvider(widget.patient.id.toString())),
                          complicationHiv: ref.watch(adminComplicationHivProvider(widget.patient.id.toString())),
                          complicationOthers: ref.watch(adminComplicationOthersProvider(widget.patient.id.toString())),
                          onRefresh: () async {
                            ref.invalidate(adminComplicationHepCProvider(widget.patient.id.toString()));
                            ref.invalidate(adminComplicationHivProvider(widget.patient.id.toString()));
                            ref.invalidate(adminComplicationOthersProvider(widget.patient.id.toString()));
                            return ref.refresh(adminComplicationHepBProvider(widget.patient.id.toString()).future);
                          },
                          onComplicationHepBSave: () => ref.invalidate(adminComplicationHepBProvider(widget.patient.id.toString())),
                          onComplicationHepCSave: () => ref.invalidate(adminComplicationHepCProvider(widget.patient.id.toString())),
                          onComplicationHivSave: () => ref.invalidate(adminComplicationHivProvider(widget.patient.id.toString())),
                          onComplicationOthersSave: () => ref.invalidate(adminComplicationOthersProvider(widget.patient.id.toString())),
                          patientId: widget.patient.id,
                        );
                      },
                    ),
                    therapyComplicationsView: Consumer(builder: (context, ref, _) {
                      return TherapyComplicationsView(
                        therapyComplications: ref.watch(adminTherapyComplicationsProvider(widget.patient.id.toString())),
                        allTherapyComplications: ref.watch(adminAllTherapyComplicationsProvider(widget.patient.id.toString())),
                        onSave: () async {
                          ref.invalidate(adminTherapyComplicationsProvider(widget.patient.id.toString()));
                          ref.invalidate(adminAllTherapyComplicationsProvider(widget.patient.id.toString()));
                        },
                        onRefresh: () async {
                          ref.invalidate(adminAllTherapyComplicationsProvider(widget.patient.id.toString()));
                          return ref.refresh(adminTherapyComplicationsProvider(widget.patient.id.toString()).future);
                        },
                        patientId: widget.patient.id,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
