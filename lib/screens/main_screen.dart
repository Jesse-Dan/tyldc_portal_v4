// ignore_for_file: unnecessary_statements

import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/screens/nav_screen.dart';
import 'package:flutter_facebook_responsive_ui/widgets/dialogue_forms.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/navigation_service.dart';
import '../config/palette.dart';
import '../data/data.dart';
import '../widgets/costum_text_field.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_submit_btn.dart';
import '../widgets/responsive.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/.main.screen';

  const MainScreen({Key key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MyNavigationService myNavigationService = MyNavigationService();

  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];
  bool isCreateAccountMainBool = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  isMainScreen: true,
                ),
              )
            : PreferredSize(
                preferredSize: Size(screenSize.width, 100.0),
                child: CustomAppBar(
                  currentUser: currentUser,
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (index) => setState(() => _selectedIndex = index),
                  isMainScreen: true,
                ),
              ),
        body: FormsWidget(
          form: Padding(
            padding: const EdgeInsets.all(32.0),
            child: !isCreateAccountMainBool
                ? buildSiginUpForm()
                : buildSiginForm(),
          ),
        ));
  }

  Center buildSiginUpForm() {
    return Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: Text(
                  'Create an Account',
                  style: GoogleFonts.zenAntique(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                )),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Hey, contact your admin for your admin auth code to procee with creating your account',
                textAlign: TextAlign.center,
                style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
            SizedBox(height: 55),
            CustomTextField(
              hint: 'Firstname',
              suffix: Icon(Icons.person_rounded, size: 20),
            ),
            SizedBox(height: 10),
            CustomTextField(hint: 'Lastname', suffix: Text('')),
            SizedBox(height: 10),
            CustomTextField(hint: 'Email', suffix: Icon(Icons.mail_rounded)),
            SizedBox(height: 10),
            CustomTextField(
                hint: 'Phone Number', suffix: Icon(Icons.phone_rounded)),
            SizedBox(height: 10),
            CustomTextField(hint: 'Gender', suffix: Icon(Icons.male_rounded)),
            SizedBox(height: 10),
            CustomTextField(
                hint: 'Department', suffix: Icon(Icons.group_rounded)),
            SizedBox(height: 10),
            CustomTextField(hint: 'Role', suffix: Icon(Icons.power)),
            SizedBox(height: 10),
            CustomTextField(
                hint: 'Auth code', suffix: Icon(Icons.admin_panel_settings)),
            SizedBox(height: 10),
            CustomTextField(
              hint: 'Password',
              suffix: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(Icons.lock_rounded, size: 20),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Having touble creating an account ?',
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            CustomSubmitButton(
              isCreateAccount: isCreateAccountMainBool,
            ),
            SizedBox(height: 55),
            Align(
                alignment: Alignment.bottomCenter,
                child: toggleCreateAccount(
                    isCreateAccount: isCreateAccountMainBool,
                    onTap: () {
                      setState(() {
                        isCreateAccountMainBool = !isCreateAccountMainBool;
                      });
                    }))
          ],
        ),
      ),
    );
  }

  Column buildSiginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.center,
            child: Text(
              'Admin Login',
              style: GoogleFonts.zenAntique(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.black),
              textAlign: TextAlign.center,
            )),
        SizedBox(height: 15),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Hey, enter your details to sign in\n to your account.',
            style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 55),
        CustomTextField(
          hint: 'Enter Email / Phone No',
          suffix: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(Icons.person_rounded, size: 20),
          ),
        ),
        SizedBox(height: 10),
        CustomTextField(
          hint: 'Password',
          suffix: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(Icons.lock_rounded, size: 20),
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Having touble Sign in ?',
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w600, fontSize: 12, color: Colors.black),
        ),
        SizedBox(height: 10),
        CustomSubmitButton(
          onTap: (() {
            myNavigationService.navigateAndClearRoute(NavScreen.routeName);
            print('Sign in button tapped');
          }),
          isCreateAccount: isCreateAccountMainBool,
        ),
        SizedBox(height: 55),
        Align(
            alignment: Alignment.bottomCenter,
            child: toggleCreateAccount(
                isCreateAccount: isCreateAccountMainBool,
                onTap: () {
                  setState(() {
                    isCreateAccountMainBool = !isCreateAccountMainBool;
                  });
                }))
      ],
    );
  }

  RichText toggleCreateAccount(
      {@required bool isCreateAccount, void Function() onTap}) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w400, fontSize: 12, color: Palette.grey),
          text: !isCreateAccount
              ? 'Already have an Account?'
              : 'Don\'t have an account'),
      TextSpan(
          style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w600, fontSize: 12, color: Colors.black),
          text: !isCreateAccount ? ' Sign in' : ' Create a new Account',
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              onTap();
            })
    ]));
  }
}
