import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/body/login_body.dart';
import 'package:mytal/data/model/response/login_model.dart';
import 'package:mytal/main.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/admin_main.dart';
import 'package:mytal/view/screens/doctor_main.dart';
import 'package:mytal/view/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class CarouselModel {
  String text;
  String image;

  CarouselModel({required this.text, required this.image});
}

class LoginScreenState extends State<LoginScreen> {
  int _currentCarousel = 0;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final CarouselController _carouselController = CarouselController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _isLoggingIn = false;

  final List<CarouselModel> carousels = [
    CarouselModel(
        text: "Thalassemia is an inherited blood disorder where there is insufficient hemoglobin. This leads to a condition known as anemia.",
        image: "assets/images/blood.jpg"),
    CarouselModel(
        text: "Symptoms of Thalassemia include fatigue, weakness, abdominal swelling, facial bone deformaties, and stunted growth.",
        image: "assets/images/tired.jpg"),
    CarouselModel(
        text:
            "1 in 20 Malaysians are carriers of Thalassaemia. If 2 carriers have a child, there is a high chance that the baby will have Thalassaemia.",
        image: "assets/images/malaysians.jpg"),
    CarouselModel(
        text: "Thalassaemia is a life long condition. Treatments include continious blood transfusion, and chelation therapy to remove excess iron.",
        image: "assets/images/bloodtransfusion.jpg")
  ];

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const SizedBox(height: 30),
                const Text(
                  "MyThal",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 4),
                ),
                const SizedBox(height: 30),
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 6),
                      height: 200,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentCarousel = index;
                        });
                      }),
                  items: carousels.map((CarouselModel carousel) {
                    return Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(carousel.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.grey.withOpacity(0.0),
                                Colors.black,
                              ],
                              stops: const [0.1, 1.0],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                          child: Text(
                            carousel.text,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: carousels.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(_currentCarousel == entry.key ? 0.9 : 0.4)),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                          color: Colors.white.withOpacity(0.4),
                        ),
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white.withOpacity(0.5),
                                      filled: true,
                                      isDense: true,
                                      label: const Text('Username'),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                        borderSide: const BorderSide(style: BorderStyle.none, width: 0),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your username';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: Dimensions.paddingSizeDefault),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                        fillColor: Colors.white.withOpacity(0.5),
                                        filled: true,
                                        label: const Text('Password'),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                                          borderSide: const BorderSide(style: BorderStyle.none, width: 0),
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                                          onPressed: _toggle,
                                        )),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: Dimensions.paddingSizeDefault),
                                  Consumer(
                                    builder: (context, ref, _) {
                                      ref.watch(prefsProvider);
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(40)),
                                        onPressed: () async {
                                          if (_isLoggingIn) {
                                            return;
                                          }

                                          if (_formKey.currentState!.validate()) {
                                            setState(() {
                                              _isLoggingIn = true;
                                            });

                                            try {
                                              LoginModel login = await GetIt.I
                                                  .get<ApiClient>()
                                                  .login(LoginBody(username: _emailController.text, password: _passwordController.text));

                                              GetIt.I.get<ApiClient>().signIn(ref, login);

                                              Widget screen = const MyHomePage();
                                              if (login.isAdmin) {
                                                screen = const AdminMain();
                                              } else if (login.isCentreUser) {
                                                screen = const DoctorMain();
                                              }

                                              if (context.mounted) {
                                                Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => screen,
                                                  ),
                                                  (Route<dynamic> route) => false,
                                                );
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
                                              _isLoggingIn = false;
                                            });
                                          }
                                        },
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Sign In',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: _isLoggingIn ? Theme.of(context).primaryColor.withOpacity(0.5) : null,
                                                ),
                                              ),
                                            ),
                                            if (_isLoggingIn)
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
                                    },
                                  ),
                                  const SizedBox(height: Dimensions.paddingSizeDefault),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("Don't have an account?"),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                                        },
                                        child: const Text('Sign Up'),
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
