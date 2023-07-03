import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

import 'package:flutter_application_1/models/catalog.dart';

 class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin  {

   // final TabController _tabController = TabController(length: 3, vsync: this);

   late TabController _tabController;

   @override
   void initState() {
     super.initState();
     _tabController = new TabController(vsync: this, length: 3);
   }

   @override
   void dispose() {
     _tabController.dispose();
     super.dispose();
   }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0.0,
         iconTheme: IconThemeData(color: Colors.black),

         title: Text(
             "Twilio SoftPhone",
           style: TextStyle(color: Colors.black),
         ),
       ),
       body: Column(
         children: [

           Container(

             child: TabBar(
                controller: _tabController,
                 labelColor: Colors.black,
                 unselectedLabelColor: Colors.green,
                 isScrollable: true,
                 tabs: [

                    Tab(text: "CALL"),
                    Tab(text: "SOFTPHONE"),

                 ]
             ),
           ),

           SizedBox(height: 30),

           Flexible(
             child: TabBarView(
                 controller: _tabController,
                 children: [
                   Text("SMS"),
                   Text("CALL"),
                   Text("SOFTPHONE"),
                 ]
             ),
           ),


         ],

       ),
       drawer: const MyDrawer(),
     );
   }
}
 