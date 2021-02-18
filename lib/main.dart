
import 'package:edustudio/util/navigator_state.dart';
import 'package:edustudio/util/sharePreference_instance.dart';
import 'package:edustudio/view/SigninSignUp/fb&google/fbSignIn.dart';
import 'package:edustudio/view/SigninSignUp/loginScreen.dart';
import 'package:edustudio/view/SigninSignUp/parentProfile.dart';
import 'package:edustudio/view/SigninSignUp/signupScreen.dart';
import 'package:edustudio/view/SigninSignUp/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'applicationProvider/authentication_event.dart';
import 'applicationProvider/authentication_notifier.dart';
import 'applicationProvider/authentication_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) async {
    Provider.debugCheckInvalidValueType = null;
    // final appDocumentDir = await getApplicationDocumentsDirectory();
    
    // dg code
    // SharedPreferences.setMockInitialValues({});
    //dg
    sharePrefereceInstance.init();
    runApp(
      ChangeNotifierProvider(
        create: (_) =>
            AuthenticationNotifier()..notifyStateChange(AppStarted()),
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var _height = MediaQuery.of(context).size.height;
    // var _width = MediaQuery.of(context).size.width;
    return GetMaterialApp(
      theme: ThemeData(primaryColor: Colors.black, fontFamily: 'Poppins'),
      navigatorKey: NavigatorStore.navKey,
      debugShowCheckedModeBanner: false,
      home: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Consumer<AuthenticationNotifier>(
                builder: (context, authenticationNotifier, _) {
              ScreenUtil.init(context, allowFontScaling: false);
              AuthenticationState state =
                  authenticationNotifier.getAuthenticationState;
              if (state is AuthenticationAuthenticated) {
                return LoginScreen();
                // return VideoConference();
              } else if (state is AuthenticationUnauthenticated) {
                return SignUpScreen();
                // return ParentProfile();
                // return ParentProfile();
                // return FbSignIn();
                //return DashBoard();
                //return StudentProfile();
                // return VideoConference();
              } else {
                return ParentProfile();
              }
            });
          },
        );
      }),
    );
  }
}
