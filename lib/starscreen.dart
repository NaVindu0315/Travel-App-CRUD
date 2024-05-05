import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:travelapp/widget.dart';

import 'displaywidget.dart';

class Ratingclz extends StatefulWidget {
  const Ratingclz({Key? key}) : super(key: key);

  @override
  State<Ratingclz> createState() => _RatingclzState();
}

class _RatingclzState extends State<Ratingclz> {
  final _firestore = FirebaseFirestore.instance;
  int strval = 0;

  Future<void> retrieveData() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final DocumentSnapshot _documentSnapshot =
        await _firestore.collection('stars').doc('start1').get();

    if (_documentSnapshot.exists) {
      strval = _documentSnapshot.get('starcount');

      // Now you can use these variables as needed
      // print('Name: $_name, Bday: $_bday, Address: $_address, Image URL: $_imageUrl');
    } else {
      print('Document does not exist');
    }
  }

  @override
  void initState() {
    super.initState();
    retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Rating Example'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: Row(
              children: [
                Spacer(),
                StarDisplay(
                  key: ValueKey('key'),
                  value: strval,
                ),
                Spacer(),
              ],
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: InteractiveRatingWidget(
              maxRating: 5,
              filledStar: Icons.star,
              unfilledStar: Icons.star_border,
              onChanged: (rating) async {
                print('Rating changed to $rating');
                final failedattempt =
                    _firestore.collection("stars").doc('start1');
                failedattempt.set({
                  'starcount': rating,
                });
              },
            ),
          ),
          Row(
            children: [
              Spacer(),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
