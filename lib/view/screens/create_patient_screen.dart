import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:intl/intl.dart';

class CreatePatientScreen extends StatefulWidget {
  const CreatePatientScreen({Key? key}) : super(key: key);

  @override
  CreatePatientScreenState createState() => CreatePatientScreenState();
}

const List<String> genders = <String>['Male', 'Female'];

var maskFormatter = MaskTextInputFormatter(mask: '######-##-####', filter: {"#": RegExp(r'[0-9]')}, type: MaskAutoCompletionType.lazy);

class CreatePatientScreenState extends State<CreatePatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('New Patient')),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter patient\'s name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [maskFormatter],
                      decoration: const InputDecoration(
                        labelText: 'IC Number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter patient\'s IC';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    TextFormField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        labelText: "Date of Birth",
                        border: OutlineInputBorder(),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now());
                        if (pickedDate != null) {
                          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            dateController.text = formattedDate;
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter patient\'s Date of Birth';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault + 2),
                    DropdownMenu(
                      // initialSelection: ColorLabel.green,
                      controller: genderController,
                      label: const Text('Gender'),
                      dropdownMenuEntries: genders.map((String value) {
                        return DropdownMenuEntry(value: value, label: value);
                      }).toList(),
                      // onSelected: (ColorLabel? color) {
                      //   setState(() {
                      //     selectedColor = color;
                      //   });
                      // },
                    ),
                    const SizedBox(height: Dimensions.paddingSizeLarge),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Patient created')),
                          );
                        }
                      },
                      child: const Text('Create Patient'),
                    ),
                  ],
                )),
          ),
        )));
  }
}
