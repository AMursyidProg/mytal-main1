import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/view/screens/complications_tab_view.dart';
import 'package:mytal/view/screens/profile_clinical_view.dart';
import 'package:mytal/view/screens/profile_complications_view.dart';
import 'package:mytal/view/screens/profile_details_view.dart';
import 'package:mytal/view/screens/profile_treatment_view.dart';
import 'package:mytal/view/screens/therapy_complications_view.dart';

class ProfileTabView extends StatefulWidget {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  ProfileTabViewState createState() => ProfileTabViewState();
}

class ProfileTabViewState extends State<ProfileTabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const TabBar(
            tabAlignment: TabAlignment.center,
            isScrollable: true,
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Clinical'),
              Tab(text: 'Treatment'),
              Tab(text: 'Complications'),
            ],
          ),
          Expanded(
            child: Consumer(builder: (context, ref, _) {
              return TabBarView(
                children: [
                  ProfileDetailsView(
                    patientDetails: ref.watch(patientDetailsProvider),
                    heightWeights: ref.watch(heightWeightProvider),
                    onRefresh: () async {
                      ref.invalidate(heightWeightProvider);
                      return ref.refresh(patientDetailsProvider);
                    },
                    onHeightWeightSave: () => ref.invalidate(heightWeightProvider),
                    onPatientDetailSave: () => ref.invalidate(patientDetailsProvider),
                  ),
                  ProfileClinicalView(
                    laboratory: ref.watch(laboratoryProvider),
                    diagnosis: ref.watch(diagnosisProvider),
                    onSave: () => ref.invalidate(laboratoryProvider),
                    onRefresh: () async {
                      ref.invalidate(diagnosisProvider);
                      return ref.refresh(laboratoryProvider.future);
                    },
                  ),
                  ProfileTreatmentView(
                    chelations: ref.watch(chelationProvider),
                    transfusions: ref.watch(transfusionProvider),
                    ferritins: ref.watch(ferritinProvider),
                    mris: ref.watch(mriProvider),
                    onRefresh: () async {
                      ref.invalidate(chelationProvider);
                      ref.invalidate(ferritinProvider);
                      ref.invalidate(mriProvider);
                      return ref.refresh(transfusionProvider.future);
                    },
                    onTransfusionSave: () => ref.invalidate(transfusionProvider),
                    onFerritinSave: () => ref.invalidate(ferritinProvider),
                    onChelationSave: () => ref.invalidate(chelationProvider),
                    onMriSave: () => ref.invalidate(mriProvider),
                  ),
                  ComplicationsTabView(
                    profileComplicationsView: Consumer(
                      builder: (context, ref, _) {
                        return ProfileComplicationsView(
                          complicationHepB: ref.watch(complicationHepBProvider),
                          complicationHepC: ref.watch(complicationHepCProvider),
                          complicationHiv: ref.watch(complicationHivProvider),
                          complicationOthers: ref.watch(complicationOthersProvider),
                          onRefresh: () async {
                            ref.invalidate(complicationHepCProvider);
                            ref.invalidate(complicationHivProvider);
                            ref.invalidate(complicationOthersProvider);
                            return ref.refresh(complicationHepBProvider.future);
                          },
                          onComplicationHepBSave: () => ref.invalidate(complicationHepBProvider),
                          onComplicationHepCSave: () => ref.invalidate(complicationHepCProvider),
                          onComplicationHivSave: () => ref.invalidate(complicationHivProvider),
                          onComplicationOthersSave: () => ref.invalidate(complicationOthersProvider),
                        );
                      },
                    ),
                    therapyComplicationsView: Consumer(builder: (context, ref, _) {
                      return TherapyComplicationsView(
                        therapyComplications: ref.watch(therapyComplicationsProvider),
                        allTherapyComplications: ref.watch(allTherapyComplicationsProvider),
                        onSave: () async {
                          ref.invalidate(therapyComplicationsProvider);
                          ref.invalidate(allTherapyComplicationsProvider);
                        },
                        onRefresh: () async {
                          ref.invalidate(allTherapyComplicationsProvider);
                          return ref.refresh(therapyComplicationsProvider.future);
                        },
                      );
                    }),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
