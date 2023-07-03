import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import 'package:twilio/models/message.dart';
import 'package:twilio/models/messages_data.dart';
import 'package:twilio/twilio.dart';



import '../utils/routes.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({Key? key}) : super(key: key);

  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {

  final _formKey = GlobalKey<FormState>();

  //Twilio Credentials
  final String accountSid = "AC5a7810fffa744adae27dd7c79eae3b3a";
  final String authToken = "b611e62ad5da48e531e32f0fbef74588";
  final String twilioNumber = "+18557700808";

  late Twilio twilio;

  TextEditingController msg_from_Controller = TextEditingController();
  TextEditingController msg_to_Controller = TextEditingController();
  TextEditingController msg_body_Controller = TextEditingController();


  movetoSendMessage(BuildContext context) async {
    if(_formKey.currentState!.validate()) {
      setState(() {
      });
      await Future.delayed(Duration(seconds: 1));
      await send_message(msg_from_Controller.text.toString(), msg_to_Controller.text.toString(), msg_body_Controller.text.toString());
      setState(() {
        // changeButton = false;
      });
    }
  }

  send_message(String msg_from, String msg_to, String msg_body) async {

    if (kDebugMode) {
      print('abc');
      print(msg_from);
      print(msg_to);
      print(msg_body);
    }

    try{

    //Creating Twilio Object
      twilio = Twilio(
          accountSid: accountSid,
          authToken: authToken,
          twilioNumber: twilioNumber
      );


    //Send Message to another number from twilio number
    Future<void> sendMessage(String msg_to) async {
      Message? message = await twilio.messages.sendMessage(
          msg_to, msg_body);
      print(message!.body);
    }



      // Response response = await post(
      //     Uri.parse('https://twiliophone.tk/api/flutter/send_sms.php'),
      //     body: {
      //       'andriod': 'andriod-0001',
      //       'msg_from': msg_from,
      //       'msg_to' : msg_to,
      //       'msg_body' : msg_body,
      //     }
      // );
      //
      // if(response.statusCode == 200) {
      //   Map<String, dynamic> data = jsonDecode(response.body);
      //   if (kDebugMode) {
      //     print("data");
      //     print(data);
      //     //print(data['success']);
      //   }
      //   if (data['success'] == 1) {
      //     Navigator.pushNamed(context, MyRoutes.HomeRoute);
      //     // return 1;
      //   } else {
      //
      //     if (kDebugMode) {
      //       print("Hello else not login toast");
      //     }
      //
      //     Fluttertoast.showToast(
      //         msg: data['message'],
      //         toastLength: Toast.LENGTH_LONG,
      //         gravity: ToastGravity.TOP,
      //         timeInSecForIosWeb: 1,
      //         textColor: Colors.white,
      //         backgroundColor: Colors.redAccent,
      //         fontSize: 16.0
      //     );
      //
      //     return 0;
      //
      //   }
      //
      //
      // }else{
      //   if (kDebugMode) {
      //     print("Failed");
      //   }
      //   if (kDebugMode) {
      //     print(response);
      //   }
      //   return 0;
      // }

    }catch(e){
      if (kDebugMode) {
        print(e.toString());
      }
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Twilio SoftPhone"),
      ),
        body: Center(

          child: Form(
            key: _formKey,

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Container(
                    // padding: EdgeInsets.only(top: 0),
                    child: Text(
                      "SMS",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: msg_from_Controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Message From',
                            hintText: '+13478481535',
                          ),
                          validator: (value) {
                            if(value?.isEmpty ?? true) {
                              return 'From Number is not Set';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: msg_to_Controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Message To',
                            hintText: '+92 310 5653361',
                          ),
                          validator: (value) {
                            if(value?.isEmpty ?? true) {
                              return 'Please enter Message To Number';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 16.0),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: msg_body_Controller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Message Body',
                            hintText: 'Enter your message here',
                          ),
                          validator: (value) {
                            if(value?.isEmpty ?? true) {
                              return 'Please enter a message';
                            }
                            return null;
                          },
                          maxLines: 5, // Allows the text field to have multiple lines
                        ),
                      ),

                      SizedBox(height: 16.0),

                      Container(
                        padding: EdgeInsets.only(right: 10, left: 10),

                        child: Material(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.lightGreen,

                            child: InkWell(
                              onTap: () {
                                // Handle button press here
                                movetoSendMessage(context);
                              },

                              child: SizedBox(
                                width: 150,
                                height: 50,
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  // width: changeButton ? 50 : 150,
                                  // height: 50,
                                  alignment: Alignment.center,
                                  // decoration: BoxDecoration(
                                    // borderRadius: BorderRadius.circular(8),
                                    // color: Colors.lightGreen,
                                  // ),
                                  child: Text(
                                    "Send Message",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      )


                    ],
                  ),




                ],
              ),
          ),
          // child: Text("Welcome to Home Page"),
        ),
      drawer: const MyDrawer(),
    );

  }
}
