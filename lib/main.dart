import 'package:cv_maker/firebase_options.dart';
import 'package:cv_maker/repository/services/shared_pref_services.dart';
import 'package:cv_maker/resources/consts/color.dart';
import 'package:cv_maker/utils/routes/routes.dart';
import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/view/auth_screen/login_screen.dart';
import 'package:cv_maker/view_model/auth_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Allow only portrait orientation
  ]);
  final prefs = SharedPreferencesHelper();
  await prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',

          theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(),
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
          ),
          initialRoute: RoutesName.splashScreen,
          onGenerateRoute: Routes.generateRoute,
          //home: const LoginScreen(),
        ));
  }
}
