import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseproject/constants/route.dart';
import 'package:firebaseproject/firebase_options.dart';
import 'package:firebaseproject/screens/email_auth/login_screen.dart';
import 'package:firebaseproject/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp()
      // ChangeNotifierProvider(
      //   create: (_) => InternetConnectionProvider(),
      //   child: const MyApp(),
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var internetStatus =
    //     Provider.of<InternetConnectionProvider>(context).status;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppRouter().generateRoute,
      home: (FirebaseAuth.instance.currentUser != null)
          ? HomeScreen()
          : LoginScreen(),
      // Consumer<InternetConnectionProvider>(
      //   builder: (context, internetProvider, child) {
      //     if (FirebaseAuth.instance.currentUser != null) {
      //       if (internetStatus == InternetConnectionStatus.connected) {
      //         return HomeScreen();
      //       } else {
      //         return InternetNotAvailable();
      //       }
      //     } else {
      //       return LoginScreen();
      //     }
      //   },
      // ),
      //  (FirebaseAuth.instance.currentUser != null)
      //     ? (internetStatus == InternetConnectionStatus.connected
      //         ? HomeScreen()
      //         : InternetNotAvailable()) // Display appropriate screen based on internet status
      //     : LoginScreen(),
    );
  }
}
