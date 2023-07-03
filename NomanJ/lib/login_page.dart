import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_application_1/utils/routes.dart";
import 'package:http/http.dart';

import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {

  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async {
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await login(emailController.text.toString(), passwordController.text.toString());
      setState(() {
        changeButton = false;
      });
    }
  }

  login(String email, String password) async {

    if (kDebugMode) {
      print('abc');
      print(email);
      print(password);
    }

    try{

      Response response = await post(
        // Uri.parse('https://reqres.in/api/register'),
        Uri.parse('https://twiliophone.tk/api/flutter/login-user.php'),
        body: {
          'andriod': 'andriod-0001',
          'email': email,
          'password' : password
        }
      );

      if(response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (kDebugMode) {
          print("data");
          print(data);
          //print(data['success']);
        }
        if (data['success'] == 1) {
          Navigator.pushNamed(context, MyRoutes.HomeRoute);
          // return 1;
        } else {

          print("Hello else not login toast");

          Fluttertoast.showToast(
              msg: data['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              backgroundColor: Colors.redAccent,
              fontSize: 16.0
          );

          return 0;

        }


      }else{
        if (kDebugMode) {
          print("Failed");
        }
        if (kDebugMode) {
          print(response);
        }
        return 0;
      }

    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(32),

          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                const SizedBox(height: 150),
                // Image.asset('assets/images/login-image.png', fit: BoxFit.cover),
                Image.asset('assets/images/twilio.png'),

                const SizedBox(height: 12),

                const Text(
                    "Welcome",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: emailController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter Username'
                  ),
                  validator: (value) {
                    if(value?.isEmpty ?? true) { // use null-aware operator `?` to check if `value` is not null
                      return 'Please enter a username';
                    }
                    return null;
                  },

                ),
                //
                const SizedBox(height: 12),
                //
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if(value?.isEmpty ?? true) { // use null-aware operator `?` to check if `value` is not null
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                //
                const SizedBox(height: 40),
                //
                // ElevatedButton(
                //   onPressed: () async {
                //     int loginStatus = await login(emailController.text.toString(), passwordController.text.toString());
                //     if (kDebugMode) {
                //       print(loginStatus);
                //     }
                //     if(loginStatus == 1) {
                //       Navigator.pushNamed(context, MyRoutes.HomeRoute);
                //     }
                //   },
                //   style: TextButton.styleFrom(
                //     minimumSize: Size(220, 40),
                //   ),
                //   child: const Text('Login'),
                // ),

                Material(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.lightGreen,

                    child: InkWell(
                    onTap: () => movetoHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changeButton?50:150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton?Icon(Icons.done, color: Colors.white,):Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //     color: Colors.lightGreen,
                      //     borderRadius: BorderRadius.circular(8)
                      // ),
                    ),
                  ),
                )



                // GestureDetector(

                  // onTap: (){
                  //   login(emailController.text.toString(), passwordController.text.toString());
                  // },
                  // behavior: HitTestBehavior.translucent,
                  // child: Container(
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //     color: Colors.green,
                  //     borderRadius: BorderRadius.circular(10)
                  //   ),
                  //   child: const Center(child: Text('Login')),
                  // ),
                  // TextButton.icon(
                  //   icon: const Icon(Icons.arrow_forward),
                  //   label: const Text("Login"),
                  //   onPressed: () {},
                  //   style: TextButton.styleFrom(
                  //     // primary: Colors.white,
                  //       backgroundColor: const Color.fromRGBO(35, 203, 124, 100),
                  //       textStyle: const TextStyle(fontSize: 22),
                  //       padding: const EdgeInsets.all(15),
                  //       elevation: 15,
                  //       side: const BorderSide(color: Colors.white, width:
                  //       1),
                  //       shape: const BeveledRectangleBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(5)),
                  //       )
                  //
                  //
                  //   ),
                  // ),

                // ),






              ],


            ),
          ),


        )






    )
    );
  }
}