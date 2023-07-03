import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        backgroundColor: Colors.green,
        shadowColor: Colors.white,
        child: ListView(
          // padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.green,
              child: DrawerHeader(
                padding: EdgeInsets.only(top: 10, bottom: 0, left: 0, right: 0),
                  // margin: EdgeInsets.only(top: 0,bottom: 0, left: 0,right: 0),
                  child:Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 0, left: 9,right: 0),
                    child: Text(
                        "TwilioApp",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),

              ),
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: const Text(
                'HOME',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pushNamed(context, MyRoutes.HomeRoute);
              },

            ),


            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),

              title: const Text(
                'SMS',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // Navigator.pop(context, MyRoutes.LoginRoute);
                Navigator.pushNamed(context, MyRoutes.SmsRoute);

              },
            ),


            ListTile(
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.white,
              ),
              title: const Text(
                'CALL',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },

            ),





          ],
        ),
      ),
    );
  }
}
