import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/app_constants.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:intl/intl.dart';


// TODO: To be deleted
class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

const List<String> genders = <String>['Male', 'Female'];

var maskFormatter = MaskTextInputFormatter(mask: '######-##-####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);

class EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    ref.read(prefsProvider);
  }

  @override
  Widget build(BuildContext context) {
    final prefState = ref.watch(prefsProvider);

    final TextEditingController nameController = TextEditingController(text: prefState[AppConstants.profileName] ?? '');
    final TextEditingController dobController = TextEditingController(text: prefState[AppConstants.profileDob] ?? '');
    final TextEditingController genderController = TextEditingController(text: prefState[AppConstants.profileGender] ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: prefState[AppConstants.isLoading]
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter name';
                          //   }
                          //   return null;
                          // },
                        ),
                        // const SizedBox(height: Dimensions.paddingSizeDefault),
                        // TextFormField(
                        //   keyboardType: TextInputType.number,
                        //   inputFormatters: [maskFormatter],
                        //   decoration: const InputDecoration(
                        //     labelText: 'IC Number',
                        //     border: OutlineInputBorder(),
                        //   ),
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please enter patient\'s IC';
                        //     }
                        //     return null;
                        //   },
                        // ),
                        const SizedBox(height: Dimensions.paddingSizeDefault),
                        TextFormField(
                          controller: dobController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.calendar_today),
                            labelText: "Date of Birth",
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now());
                            if (pickedDate != null) {
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              dobController.text = formattedDate;
                            }
                          },
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter Date of Birth';
                          //   }
                          //   return null;
                          // },
                        ),
                        const SizedBox(height: Dimensions.paddingSizeDefault + 2),
                        DropdownMenu(
                          // initialSelection: ColorLabel.green,
                          controller: genderController,
                          label: const Text('Gender'),
                          dropdownMenuEntries: genders.map((String value) {
                            return DropdownMenuEntry(value: value, label: value);
                          }).toList(),
                          onSelected: (gender) {
                            genderController.text = gender as String;
                          },
                        ),
                        const SizedBox(height: Dimensions.paddingSizeLarge),
                        Consumer(builder: (context, ref, _) {
                          return ElevatedButton(
                            onPressed: () async {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                // await prefs.setString(AppConstants.profileName, nameController.text);
                                ref.read(prefsProvider.notifier).setString(AppConstants.profileName, nameController.text);
                                ref.read(prefsProvider.notifier).setString(AppConstants.profileDob, dobController.text);
                                ref.read(prefsProvider.notifier).setString(AppConstants.profileGender, genderController.text);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Profile updated')),
                                );

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => const MyHomePage(initialIndex: 2)),
                                // );

                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Update Profile'),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
