import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject/assets/assets.dart';
import 'package:firebaseproject/constants/colors.dart';
import 'package:firebaseproject/constants/route.dart';
import 'package:firebaseproject/widgets/common_textfield.dart';
import 'package:firebaseproject/widgets/messenger.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if (email == "" || password == "" || cPassword == "") {
      ToastMessenger.errorMessageShow(context, "Please fill all the details");
    } else if (password != cPassword) {
      // print("Passwords do not match!");
      ToastMessenger.errorMessageShow(context, "Passwords do not match!");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // print("User Created");
        ToastMessenger.successrMessageShow(context, "User Created");

        if (userCredential.user != null) {
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (ex) {
        print(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("signup screen"),
        elevation: 1.0,
        backgroundColor: AppColors.appbarColor,
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
                    SizedBox(height: 20),
                    CommonTextfield(
                      controller: cPasswordController,
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
                        createAccount();

                        // Navigator.pushNamed(context, AppRouter.home);
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
                    Navigator.pushNamed(context, AppRouter.loginPage);
                  },
                  child: Text(
                    "login",
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
