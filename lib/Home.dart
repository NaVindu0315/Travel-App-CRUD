import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel/ReservationList.dart';

late User loggedinuser;
late String client;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  ///upload
  Future<void> upload(String loc, String dt1, String dt2, String ac1,
      String ac2, String ac3) async {
    String idd = "$client $loc";
    final failedattempt = _firestore.collection("reservations").doc(idd);
    failedattempt.set({
      'code': idd,
      'Location': loc,
      'StartingDate': dt1,
      'Enddate': dt2,
      'Activity1': ac1,
      'Activity2': ac2,
      'Activity3': ac3,
    });
  }

  /// end

  TextEditingController locationcontroller = new TextEditingController();
  TextEditingController startdatecontroller = new TextEditingController();
  TextEditingController enddatecontroller = new TextEditingController();
  TextEditingController activity1controller = new TextEditingController();
  TextEditingController activity2controller = new TextEditingController();
  TextEditingController activity3controller = new TextEditingController();

  String location = "";
  String startdate = "";
  String enddate = "";
  String activity1 = "-";
  String activity2 = "-";
  String activity3 = "-";

  void getcurrentuser() async {
    try {
      // final user = await _auth.currentUser();
      ///yata line eka chatgpt code ekk meka gatte uda line eke error ekk ena hinda hrytama scene eka terenne na
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedinuser = user;
        client = loggedinuser.email!;

        ///i have to call the getdatafrm the function here and parse client as a parameter

        print(loggedinuser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 60.0,
                ),

                ///location
                SizedBox(
                  height: 70,
                  width: 350, // Set the width of the SizedBox to 300 pixels
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: locationcontroller,
                      onChanged: (value) {
                        location = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.map,
                        ),
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),

                ///start date
                SizedBox(
                  height: 70,
                  width: 350, // Set the width of the SizedBox to 300 pixels
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: startdatecontroller,
                      onChanged: (value) {
                        startdate = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.calendar_month,
                        ),
                        labelText: 'Starting Date',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),

                ///end date
                SizedBox(
                  height: 70,
                  width: 350, // Set the width of the SizedBox to 300 pixels
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: enddatecontroller,
                      onChanged: (value) {
                        enddate = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.calendar_month_outlined,
                        ),
                        labelText: 'Location',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),

                ///activity 1
                SizedBox(
                  height: 70,
                  width: 350, // Set the width of the SizedBox to 300 pixels
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: activity1controller,
                      onChanged: (value) {
                        activity1 = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.local_activity,
                        ),
                        labelText: 'Activity 1',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),

                ///activity 2
                SizedBox(
                  height: 70,
                  width: 350, // Set the width of the SizedBox to 300 pixels
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: activity2controller,
                      onChanged: (value) {
                        activity2 = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.local_activity,
                        ),
                        labelText: 'Activity 2',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  height: 70,
                  width: 350, // Set the width of the SizedBox to 300 pixels
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: activity3controller,
                      onChanged: (value) {
                        activity3 = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.local_activity,
                        ),
                        labelText: 'Acitivity 3',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          locationcontroller.text = "";
                          startdatecontroller.text = "";
                          enddatecontroller.text = "";
                          activity3controller.text = "";
                          activity2controller.text = "";
                          activity1controller.text = "";
                        },
                        child: Text('clear')),
                    ElevatedButton(
                        onPressed: () {
                          print(location);
                          print(startdate);
                          print(enddate);
                          print(activity1);
                          print(activity2);
                          print(activity3);

                          locationcontroller.text = "";
                          startdatecontroller.text = "";
                          enddatecontroller.text = "";
                          activity3controller.text = "";
                          activity2controller.text = "";
                          activity1controller.text = "";
                          upload(location, startdate, enddate, activity1,
                              activity2, activity3);
                        },
                        child: Text('Submit')),
                    Spacer(),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Reservations()),
                      );
                    },
                    child: Text('List')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
