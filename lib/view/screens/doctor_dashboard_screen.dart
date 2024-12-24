import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/providers/prefs_provider.dart';
import 'package:mytal/util/app_constants.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/about_thalassaemia_screen.dart';
import 'package:mytal/view/screens/hospitals_screen.dart';
import 'package:mytal/view/screens/patient_screen.dart';
import 'package:mytal/view/screens/report_screen.dart';
import 'package:mytal/view/screens/support_group_screen.dart';
import 'package:mytal/view/widgets/articles_widget.dart';

class DoctorDashboardScreen extends StatefulWidget {
  final Function navCallback;
  const DoctorDashboardScreen({Key? key, required this.navCallback}) : super(key: key);

  @override
  DoctorDashboardScreenState createState() => DoctorDashboardScreenState();
}

class ResourceCard {
  String image;
  String title;
  Widget? screen;
  ResourceCard({required this.image, required this.title, this.screen});
}

class DoctorDashboardScreenState extends State<DoctorDashboardScreen> {
  int _currentCarousel = 0;
  final CarouselController _carouselController = CarouselController();
  final ScrollController _scrollController = ScrollController();
  final List<ResourceCard> resources = [
    ResourceCard(image: "assets/images/blood.jpg", title: "About Thalassaemia", screen: const AboutThalassaemiaScreen()),
    ResourceCard(image: "assets/images/support-group.jpg", title: "Support Groups", screen: SupportGroupScreen(isDoctor: true)),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // color: Colors.teal,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter, colors: [
                Colors.teal.shade300,
                Colors.teal.shade800,
              ], stops: const [
                0.0,
                0.7
              ]),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
            ),
            width: double.infinity,
            // padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
                  child: Consumer(builder: (context, ref, _) {
                    var prefsState = ref.watch(prefsProvider);
                    return Text("Hi ${prefsState[AppConstants.profileName]},",
                        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.left);
                  }),
                ),
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      // aspectRatio: 2.0,
                      height: 200,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentCarousel = index;
                        });
                      }),
                  items: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "New Reports",
                              style: TextStyle(
                                // color: Colors.teal,
                                letterSpacing: 1,
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: Dimensions.paddingSizeDefault),
                            const Text(
                              "The 2023 Annual Report is now available to view.",
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeSmall,
                              ),
                            ),
                            const SizedBox(height: Dimensions.paddingSizeDefault),
                            TextButton.icon(
                              style: TextButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.4), minimumSize: const Size.fromHeight(30)),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportScreen()));
                              },
                              icon: const Icon(Icons.pie_chart, color: Colors.teal, size: 20),
                              label: const Text(
                                'View Reports',
                                style: TextStyle(color: Colors.teal),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Upcoming Appointment",
                              style: TextStyle(
                                // color: Colors.teal,
                                letterSpacing: 1,
                                fontSize: Dimensions.fontSizeLarge,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: Dimensions.paddingSizeDefault),
                            const Text(
                              "You have 1 appointment today",
                              style: TextStyle(
                                // color: Colors.teal,
                                fontSize: Dimensions.fontSizeSmall,
                              ),
                            ),
                            const SizedBox(height: Dimensions.paddingSizeDefault),
                            RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(text: 'Prince Court Medical Centre', style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: ' at '),
                                    TextSpan(text: '3:30 PM', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ]),
                            ),
                            const SizedBox(height: Dimensions.paddingSizeDefault),
                            TextButton.icon(
                              style: TextButton.styleFrom(backgroundColor: Colors.white.withOpacity(0.4), minimumSize: const Size.fromHeight(30)),
                              onPressed: () {},
                              icon: const Icon(Icons.calendar_today, color: Colors.teal, size: 20),
                              label: const Text(
                                'View Appointment',
                                style: TextStyle(color: Colors.teal),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [0, 1].asMap().entries.map((entry) {
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
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PatientScreen())),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.personal_injury,
                          size: 40,
                          color: Colors.teal,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Patients",
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: Dimensions.paddingSizeDefault,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportScreen())),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit_document,
                          size: 40,
                          color: Colors.teal,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Reports",
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: Dimensions.paddingSizeDefault,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HospitalsScreen(
                                  isDoctor: true,
                                ))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_hospital,
                          size: 40,
                          color: Colors.teal,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Hospitals",
                          style: TextStyle(
                            color: Colors.teal,
                            fontSize: Dimensions.paddingSizeDefault,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Resources', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: Dimensions.paddingSizeSmall),
                    const Padding(
                      padding: EdgeInsets.only(top: 1.5),
                      child: Icon(Icons.arrow_right_alt, color: Colors.teal, size: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              SizedBox(
                height: 165,
                child: ListView.builder(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
                  itemCount: resources.length,
                  itemBuilder: (context, index) {
                    var resource = resources[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, Dimensions.paddingSizeSmall, 2),
                      child: InkWell(
                        onTap: () {
                          if (resource.screen != null) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => resource.screen!));
                          }
                        },
                        child: Container(
                          height: 165,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300]!,
                                blurRadius: 5,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.radiusSmall)),
                                child: Container(
                                  width: 200,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    image: DecorationImage(
                                      image: AssetImage(resource.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                  child: Text(
                                    resource.title,
                                    style: const TextStyle(
                                      fontSize: Dimensions.fontSizeDefault,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeLarge),
              Padding(
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('News', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(width: Dimensions.paddingSizeSmall),
                    const Padding(
                      padding: EdgeInsets.only(top: 1.5),
                      child: Icon(Icons.arrow_right_alt, color: Colors.teal, size: 25),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeDefault),
              const ArticlesWidget(),
              const SizedBox(height: Dimensions.paddingSizeExtraLarge),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child:
          // ),
        ],
      ),
    );
  }
}
