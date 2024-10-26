import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:login_signup_screens_responsive/controllers/UI.dart';
import 'package:login_signup_screens_responsive/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:login_signup_screens_responsive/constants.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailContoroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailContoroller.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    UIController uiController = Get.find<UIController>();

    return GestureDetector(
      onTap: () {},
      child: Scaffold(
          backgroundColor: Colors.white,
          body: LayoutBuilder(
            builder: (context, Constraints) {
              if (size.width > 600) {
                return buildLargeScreen(size, uiController);
              } else {
                return buildSmallScreen(size, uiController);
              }
            },
          )),
    );
  }

  Widget buildLargeScreen(Size size, UIController uiController) {
    return Row(
      children: [
        Expanded(
            child: RotatedBox(
          quarterTurns: 4,
          child: Lottie.asset("assets/wave.json", fit: BoxFit.fill),
        )),
        SizedBox(
          width: size.width * 0.06,
        ),
        Expanded(flex: 3, child: buildMainBody(size, uiController))
      ],
    );
  }

  Widget buildSmallScreen(Size size, UIController uiController) {
    return Center(child: buildMainBody(size, uiController));
  }

  Widget buildMainBody(Size size, UIController uiController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          size.width > 600 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        size.width > 600
            ? Container()
            : Lottie.asset("assets/wave.json", fit: BoxFit.fill),
        SizedBox(
          height: size.height * 0.03,
        ),
        Text("Login", style: loginStyle(size)),
        SizedBox(height: size.height * 0.02),
        Text(
          "Welcome back Catchy",
          style: loginStyle(size),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "email or gmail",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "plz enter username";
                    } else if (value.length < 4) {
                      return "at elast 4 characters";
                    } else if (value.length > 14) {
                      return "maxixum length 10";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Obx(() => TextFormField(
                      controller: passwordController,
                      obscureText: uiController.isObsucre.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_clock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            uiController.isObsucre.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            uiController.isObsucreActive();
                          },
                        ),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "plz enter some text";
                        } else if (value.length < 7) {
                          return "minimum lenfth is 7";
                        } else if (value.length > 16) {
                          return "maximum lenth is 17";
                        }
                        return null;  
                      },
                    )) ,

                    SizedBox(height: size.height*0.01,),


                    
              ],
            ),
          ),
        )
      ],
    );
  }
}
