import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Colors.dart';
import 'ReservationList.dart';

late User loggedinuser;
late String client;

class ReservationDetails extends StatefulWidget {
  final String cd1;

  ReservationDetails({required this.cd1});

  @override
  _ReservationDetailsState createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  GlobalKey globalKey = new GlobalKey();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late String code;

  @override
  void initState() {
    super.initState();
    code = widget.cd1;
    getcurrentuser();
  }

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

  ///timestamp/*
  /* String _formatDateAndTime(Timestamp timestamp) {
    try {
      final dateTime = timestamp.toDate(); // Convert Timestamp to DateTime
      final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss'); // Customize format
      return dateFormat.format(dateTime);
    } catch (error) {
      print('Error converting timestamp: $error');
      return '';
    }
  }*/

  ///

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('reservations')
          .doc(code)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data;

          return

              ///material app begin
              MaterialApp(
            // Application name
            title: 'My Flutter App',
            debugShowCheckedModeBanner: false, // Remove debug banner
            home:

                ///should be cut out from here
                Container(
              child: Scaffold(
                appBar: AppBar(
                  // preferredSize: Size.fromHeight(kToolbarHeight + 20),
                  backgroundColor: AppColors.backgroundcolor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  title: Text(
                    'Reservation Details',
                    style: TextStyle(color: Colors.white),
                  ),
                  iconTheme: IconThemeData(color: Colors.white),

                  //centerTitle: true,
                ),
                body: Container(
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 30.0,
                            ),

                            SizedBox(
                              height: 30.0,
                            ),

                            ///gem code
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              height: 60,
                              width: double.infinity,
                              color: AppColors.backgroundcolor,
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Location :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///place the gemcode variable here
                                  Expanded(
                                    child: Text(
                                      '${data?['Location']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),

                            ///gem code end
                            ///gem name
                            ///gem name
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              height: 60,
                              width: double.infinity,
                              color: AppColors.backgroundcolor,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Startinf Date :',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///place the gem name variable here
                                  Expanded(
                                    child: Text(
                                      '${data?['StartingDate']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          // height: 6,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),

                            ///gem code
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              height: 60,
                              width: double.infinity,
                              color: AppColors.backgroundcolor,
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'End Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///place the gemcode variable here
                                  Expanded(
                                    child: Text(
                                      '${data?['Enddate']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10.0,
                            ),

                            ///gem code
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              height: 60,
                              width: double.infinity,
                              color: AppColors.backgroundcolor,
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Activity 1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///place the gemcode variable here
                                  Expanded(
                                    child: Text(
                                      '${data?['Activity1']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              height: 60,
                              width: double.infinity,
                              color: AppColors.backgroundcolor,
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Activity 2',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///place the gemcode variable here
                                  Expanded(
                                    child: Text(
                                      '${data?['Activity2']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 20),
                              height: 60,
                              width: double.infinity,
                              color: AppColors.backgroundcolor,
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      'Activity 3',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///place the gemcode variable here
                                  Expanded(
                                    child: Text(
                                      '${data?['Activity3']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 22,
                                          height: 2,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ElevatedButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('reservations')
                                      .doc(code)
                                      .delete();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Reservations()),
                                  );
                                },
                                child: Text('Delete'))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );

          /// materialapp end
        }
        return CircularProgressIndicator();
      },
    );
  }
}
