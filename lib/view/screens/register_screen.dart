import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/login_body.dart';
import 'package:mytal/data/model/body/register_body.dart';
import 'package:mytal/data/model/response/login_model.dart';
import 'package:mytal/main.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/login_screen.dart';
import 'package:mytal/view/widgets/tos_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureConfirmText = true;
  bool _isLoggingIn = false;
  bool _termsAccepted = false;
  //final now = DateTime.now();
  DateTime dt = DateTime.now();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  String formattedDate = "0";
  //formattedDate = dateFormat.format(dt);

  @override
  void initState() {
    _isLoggingIn = false;
    super.initState();
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff540b06),
                      Colors.red,
                    ],
                    stops: [0.2, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const SizedBox(),
              )),
          SingleChildScrollView(
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Create Account",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 4),
                    ),
                    const SizedBox(height: Dimensions.paddingSizeDefault),
                    Padding(
                      padding:
                          const EdgeInsets.all(Dimensions.paddingSizeLarge),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(
                                Dimensions.paddingSizeLarge),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radiusLarge),
                              color: Colors.white.withOpacity(0.4),
                            ),
                            child: Column(
                              children: [
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: _usernameController,
                                        decoration: InputDecoration(
                                          fillColor:
                                              Colors.white.withOpacity(0.5),
                                          filled: true,
                                          isDense: true,
                                          label: const Text('Username'),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radiusSmall),
                                            borderSide: const BorderSide(
                                                style: BorderStyle.none,
                                                width: 0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your username';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeDefault),
                                      TextFormField(
                                        controller: _nameController,
                                        decoration: InputDecoration(
                                          fillColor:
                                              Colors.white.withOpacity(0.5),
                                          filled: true,
                                          isDense: true,
                                          label: const Text('Name'),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radiusSmall),
                                            borderSide: const BorderSide(
                                                style: BorderStyle.none,
                                                width: 0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeDefault),
                                      TextFormField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                          fillColor:
                                              Colors.white.withOpacity(0.5),
                                          filled: true,
                                          isDense: true,
                                          label: const Text('Email'),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radiusSmall),
                                            borderSide: const BorderSide(
                                                style: BorderStyle.none,
                                                width: 0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeDefault),
                                      TextFormField(
                                        controller: _passwordController,
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                            fillColor:
                                                Colors.white.withOpacity(0.5),
                                            filled: true,
                                            label: const Text('Password'),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radiusSmall),
                                              borderSide: const BorderSide(
                                                  style: BorderStyle.none,
                                                  width: 0),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(_obscureText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              onPressed: _toggle,
                                            )),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeDefault),
                                      TextFormField(
                                        controller: _confirmPasswordController,
                                        obscureText: _obscureConfirmText,
                                        decoration: InputDecoration(
                                            fillColor:
                                                Colors.white.withOpacity(0.5),
                                            filled: true,
                                            label:
                                                const Text('Confirm Password'),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radiusSmall),
                                              borderSide: const BorderSide(
                                                  style: BorderStyle.none,
                                                  width: 0),
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(_obscureConfirmText
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              onPressed: _toggleConfirm,
                                            )),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please confirm your password';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeDefault),
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: _termsAccepted,
                                            onChanged: (bool? val) {
                                              setState(() {
                                                _termsAccepted =
                                                    !_termsAccepted;
                                              });
                                            },
                                          ),
                                          const Text("I accept the"),
                                          TextButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    const TosDialog(),
                                              );
                                            },
                                            child: const Text(
                                                "Terms & Conditions"),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeDefault),
                                      Consumer(
                                        builder: (context, ref, _) {
                                          return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                minimumSize:
                                                    const Size.fromHeight(40)),
                                            onPressed: () async {
                                              if (_isLoggingIn) {
                                                return;
                                              }

                                              if (_formKey.currentState!
                                                  .validate()) {
                                                if (_passwordController.text !=
                                                    _confirmPasswordController
                                                        .text) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Password and confirm password does not match'),
                                                    ),
                                                  );
                                                  return;
                                                }

                                                if (_termsAccepted == false) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Please accept the terms and conditions'),
                                                    ),
                                                  );
                                                  return;
                                                }

                                                setState(() {
                                                  _isLoggingIn = true;
                                                });

                                                try {
                                                  await GetIt.I
                                                      .get<ApiClient>()
                                                      .register(
                                                        RegisterBody(
                                                          name: _nameController
                                                              .text,
                                                          username:
                                                              _usernameController
                                                                  .text,
                                                          email:
                                                              _emailController
                                                                  .text,
                                                          password:
                                                              _passwordController
                                                                  .text,
                                                          sexId: "0",
                                                          countryId: 1,
                                                          dob: (formattedDate =
                                                              dateFormat
                                                                  .format(dt)),
                                                        ),
                                                      );

                                                  LoginModel login = await GetIt
                                                      .I
                                                      .get<ApiClient>()
                                                      .login(LoginBody(
                                                          username:
                                                              _usernameController
                                                                  .text,
                                                          password:
                                                              _passwordController
                                                                  .text));

                                                  GetIt.I
                                                      .get<ApiClient>()
                                                      .signIn(ref, login);

                                                  if (context.mounted) {
                                                    Navigator
                                                        .pushAndRemoveUntil(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const MyHomePage(),
                                                            ),
                                                            (Route<dynamic>
                                                                    route) =>
                                                                false);
                                                  }
                                                } catch (e) {
                                                  if (context.mounted) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content:
                                                            Text(e.toString()),
                                                      ),
                                                    );
                                                  }
                                                }

                                                setState(() {
                                                  _isLoggingIn = false;
                                                });
                                              }
                                            },
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'Create Account',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: _isLoggingIn
                                                          ? Theme.of(context)
                                                              .primaryColor
                                                              .withOpacity(0.5)
                                                          : null,
                                                    ),
                                                  ),
                                                ),
                                                if (_isLoggingIn)
                                                  Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          right: Dimensions
                                                              .paddingSizeDefault),
                                                      child: SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                          height:
                                              Dimensions.paddingSizeDefault),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                              "Have an account already?"),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const LoginScreen()));
                                            },
                                            child: const Text('Sign In'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
