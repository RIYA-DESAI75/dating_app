import 'package:dating_app/authenticationScreen/registration_screen.dart';
import 'package:dating_app/authenticationScreen/widgets/custom_text-field_widget.dart';
import 'package:dating_app/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool showProgressBar = false;
  var controllerAuth = AuthenticationController.authController;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body:   SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                height:120,
              ),

              Image.asset(
                "images/logo.png",
                width:300,
              ),

              const Text(
                "Welcome",
                style: TextStyle(
                    fontSize:22,
                    fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height:10,
              ),

              const Text(
                "Login now to find your perfect Match",
                style: TextStyle(
                    fontSize:18,
                    fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height:28,
              ),

              //email
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                    editingController: emailEditingController,
                    labelText: "Email",
                    iconData: Icons.email_outlined,
                    isObscure: false,
                  ),
              ),

              const SizedBox(
                height:24,
              ),

              //password
              SizedBox(
                width: MediaQuery.of(context).size.width - 36,
                height: 55,
                child: CustomTextFieldWidget(
                    editingController: passwordEditingController,
                    labelText: "Password",
                    iconData: Icons.lock_outlined,
                    isObscure: true,
                  ),
              ),

              const SizedBox(
                height:30,
              ),

              //login button
              Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )
                ),
                child: InkWell(
                  onTap: () async
                  {
                    if(emailEditingController.text.trim().isNotEmpty
                    && passwordEditingController.text.trim().isNotEmpty)
                    {
                      setState(() {
                        showProgressBar = true;
                      });

                      await controllerAuth.loginUser(
                          emailEditingController.text.trim(),
                          passwordEditingController.text.trim(),
                      );

                      setState(() {
                        showProgressBar = false;
                      });
                    }
                    else
                    {
                      Get.snackbar("Email or password is missing", "please fill out both the fields");
                    }

                  },
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ),

              const SizedBox(
                height:16,
              ),

              //don't have an account create here button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),

                  InkWell(
                    onTap: ()
                    {
                      Get.to(RegistrationScreen());
                    },
                    child: const Text(
                      "Create here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),

              const SizedBox(
                height:16,
              ),

              showProgressBar == true
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                    )
                  : Container(),

              const SizedBox(
                height:30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
