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
                  value: 3,
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
        ],
      ),
    );
  }
}
