import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/util/dimensions.dart';
import 'package:mytal/view/screens/change_password_screen.dart';
import 'package:mytal/view/screens/chat_view.dart';
import 'package:mytal/view/screens/login_screen.dart';
import 'package:mytal/view/screens/patient_view.dart';
import 'package:mytal/view/screens/report_view.dart';
import 'package:mytal/view/widgets/tos_dialog.dart';

class AdminMain extends StatefulWidget {
  final int initialIndex;

  const AdminMain({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  AdminMainState createState() => AdminMainState();
}

class AdminMainState extends State<AdminMain> {
  int _selectedIndex = 0;
  String _selectedTitle = "Reports";

  void updateTitle() {
    switch (_selectedIndex) {
      case 0:
        _selectedTitle = "Reports";
        break;
      case 1:
        _selectedTitle = "Patients";
        break;
      case 2:
        _selectedTitle = "Chat";
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
    if (index != 3) {
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

            // color: Colors.amber,
            child: Center(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: Dimensions.paddingSizeDefault,
                crossAxisSpacing: Dimensions.paddingSizeDefault,
                shrinkWrap: true,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangePasswordScreen()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.key_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Change Password",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontSize: Dimensions.fontSizeDefault,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const TosDialog(),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_document,
                            size: 40,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
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
                        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
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
      // DoctorDashboardScreen(navCallback: (int index) {
      //   _onItemTapped(index);
      // }),
      const ReportView(),
      const PatientView(),
      const ChatView(),

      // const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedTitle),
      ),
      body: SafeArea(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.dashboard),
          //   label: 'Dashboard',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.personal_injury),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
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
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
