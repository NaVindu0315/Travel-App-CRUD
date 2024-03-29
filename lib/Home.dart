import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 100.0,
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
                        Icons.email,
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
             / //activity 2
              SizedBox(
                height: 70,
                width: 350, // Set the width of the SizedBox to 300 pixels
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: acr,
                    onChanged: (value) {
                      location = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
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
                        Icons.email,
                      ),
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
