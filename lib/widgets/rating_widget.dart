import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final Function(double) onRatingUpdate;

  const RatingWidget({super.key, required this.rating, required this.onRatingUpdate});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your Rating: ${rating.toStringAsFixed(1)}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 12),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: onRatingUpdate,
            ),
          ],
        ),
      ),
    );
  }
}
