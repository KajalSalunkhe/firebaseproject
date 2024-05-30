import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject/assets/assets.dart';
import 'package:firebaseproject/constants/colors.dart';
import 'package:firebaseproject/constants/route.dart';
import 'package:firebaseproject/screens/home_screen.dart';
import 'package:firebaseproject/widgets/common_textfield.dart';
import 'package:firebaseproject/widgets/messenger.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void loginAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email == "" || password == "") {
      print("Please fill all login details");
      ToastMessenger.errorMessageShow(context, "Please fill all the details");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      } on FirebaseAuthException catch (ex) {
        print(ex.code.toString());
        ToastMessenger.errorMessageShow(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: AppColors.appbarColor,
        title: Text("Login Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "We’ re so delighted you’re here",
                      // "Please Enter number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.darkPrimary,
                      width: 2.0,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      AppAssets.images.login,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    CommonTextfield(
                      autoFocus: true,
                      controller: emailController,
                      keyboardType: TextInputType.text,
                      hinttext: "Enter Email",
                      onChanged: (value) {},
                      validator: (value) {},
                    ),
                    SizedBox(height: 20),
                    CommonTextfield(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      hinttext: "Enter password",
                      onChanged: (value) {},
                      validator: (value) {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        loginAccount();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appbarColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouter.signupPage);
                  },
                  child: Text(
                    "Create a Account",
                    style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: AppColors.blue),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
