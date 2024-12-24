import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/app_constants.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/widgets/prescription_card.dart';

class PrescriptionScreen extends ConsumerWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prefs = ref.watch(prefsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescriptions"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              Dimensions.paddingSizeDefault,
            ),
            child: Column(
              children: [
                PrescriptionCard(
                  prescriptions: prefs[AppConstants.profilePrescriptions] ?? [],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
