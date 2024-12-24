import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/contact_us_screen.dart';
import 'package:mytal/view/screens/login_screen.dart';
import 'package:mytal/view/screens/minister_dashboard_screen.dart';
import 'package:mytal/view/screens/report_view.dart';

class MinisterMain extends StatefulWidget {
  final int initialIndex;

  const MinisterMain({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  MinisterMainState createState() => MinisterMainState();
}

class MinisterMainState extends State<MinisterMain> {
  int _selectedIndex = 0;
  String _selectedTitle = "Dashboard";

  void updateTitle() {
    switch (_selectedIndex) {
      case 0:
        _selectedTitle = "Dashboard";
        break;
      case 1:
        _selectedTitle = "Reports";
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialIndex != 0) {
      setState(() {
        _selectedIndex = widget.initialIndex;
      });
      updateTitle();
    }
  }

  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
      updateTitle();
    } else {
      showModalBottomSheet<void>(
        context: context,
        useRootNavigator: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
            height: 180,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: Dimensions.paddingSizeDefault,
                crossAxisSpacing: Dimensions.paddingSizeDefault,
                shrinkWrap: true,
                children: [
                  // Consumer(builder: (context, ref, _) {
                  //   return InkWell(
                  //     onTap: () {
                  //       Navigator.pushAndRemoveUntil(
                  //           context,
                  //           MaterialPageRoute(
                  //             builder: (context) => const MyHomePage(),
                  //           ),
                  //           (Route<dynamic> route) => false);
                  //       ref.read(themeProvider.notifier).toggleUser();
                  //     },
                  //     child: Container(
                  //       padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  //       decoration: BoxDecoration(
                  //         color: Colors.red,
                  //         border: Border.all(color: Colors.red),
                  //         borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                  //       ),
                  //       child: const Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(
                  //             Icons.personal_injury,
                  //             size: 40,
                  //             color: Colors.white,
                  //           ),
                  //           SizedBox(height: 5),
                  //           Text(
                  //             "Switch to Patient",
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: Dimensions.fontSizeDefault,
                  //             ),
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   );
                  // }),
                  // Consumer(builder: (context, ref, _) {
                  //   return InkWell(
                  //     onTap: () {
                  //       Navigator.pushAndRemoveUntil(
                  //           context, MaterialPageRoute(builder: (context) => const DoctorMain()), (Route<dynamic> route) => false);
                  //       ref.read(themeProvider.notifier).toggleDoctor();
                  //     },
                  //     child: Container(
                  //       padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                  //       decoration: BoxDecoration(
                  //         color: Colors.teal,
                  //         border: Border.all(color: Colors.teal),
                  //         borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                  //       ),
                  //       child: const Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(
                  //             Icons.local_hospital,
                  //             size: 40,
                  //             color: Colors.white,
                  //           ),
                  //           SizedBox(height: 5),
                  //           Text(
                  //             "Switch to Doctor",
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: Dimensions.fontSizeDefault,
                  //             ),
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   );
                  // }),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mail,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Contact Us",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.fontSizeDefault,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Consumer(builder: (context, ref, _) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (Route<dynamic> route) => false);
                        GetIt.I.get<ApiClient>().signOut(ref);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeDefault),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              size: 40,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "Sign out",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: Dimensions.fontSizeDefault,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      MinisterDashboardScreen(navCallback: (int index) {
        _onItemTapped(index);
      }),
      const ReportView(),
      // const ProfileScreen(),
    ];

    return Scaffold(
      appBar: _selectedIndex == 0
          ? null
          : AppBar(
              title: Text(_selectedTitle),
            ),
      body: SafeArea(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Reports',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.account_circle),
          //   label: 'My Profile',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
