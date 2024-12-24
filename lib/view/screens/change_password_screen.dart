import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/change_password_body.dart';
import 'package:mytal/data/model/response/change_password_model.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/app_constants.dart';
import 'package:mytal/util/dimensions.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureCurrentText = true;
  bool _obscureNewText = true;
  bool _obscureConfirmText = true;
  bool _isSubmitting = false;

  void _toggleCurrent() {
    setState(() {
      _obscureCurrentText = !_obscureCurrentText;
    });
  }

  void _toggleNew() {
    setState(() {
      _obscureNewText = !_obscureNewText;
    });
  }

  void _toggleConfirm() {
    setState(() {
      _obscureConfirmText = !_obscureConfirmText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Change Password")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: Dimensions.paddingSizeDefault),
                TextFormField(
                  controller: _currentPasswordController,
                  obscureText: _obscureCurrentText,
                  decoration: InputDecoration(
                      label: const Text('Current Password'),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureCurrentText ? Icons.visibility_off : Icons.visibility),
                        onPressed: _toggleCurrent,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your current password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                TextFormField(
                  controller: _newPasswordController,
                  obscureText: _obscureNewText,
                  decoration: InputDecoration(
                      label: const Text('New Password'),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureNewText ? Icons.visibility_off : Icons.visibility),
                        onPressed: _toggleNew,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your new password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmText,
                  decoration: InputDecoration(
                      label: const Text('Confirm Password'),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureConfirmText ? Icons.visibility_off : Icons.visibility),
                        onPressed: _toggleConfirm,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your new password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                Consumer(builder: (context2, ref, _) {
                  var prefsState = ref.watch(prefsProvider);
                  return ElevatedButton(
                    onPressed: () async {
                      debugPrint(prefsState[AppConstants.username]);
                      if (_isSubmitting) {
                        return;
                      }

                      if (_formKey.currentState!.validate()) {
                        if (_newPasswordController.text != _confirmPasswordController.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('New password and confirm password does not match'),
                            ),
                          );
                          return;
                        }

                        setState(() {
                          _isSubmitting = true;
                        });

                        try {
                          ChangePasswordModel changePassword = await GetIt.I.get<ApiClient>().changePassword(
                                ChangePasswordBody(
                                  username: prefsState[AppConstants.username],
                                  currentPassword: _currentPasswordController.text,
                                  newPassword: _newPasswordController.text,
                                  confirmNewPassword: _confirmPasswordController.text,
                                ),
                              );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(changePassword.message!),
                              ),
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        }

                        setState(() {
                          _isSubmitting = false;
                        });
                      }
                    },
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Change Password',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: _isSubmitting ? Theme.of(context).primaryColor.withOpacity(0.5) : null,
                            ),
                          ),
                        ),
                        if (_isSubmitting)
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
