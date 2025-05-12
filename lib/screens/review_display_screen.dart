import 'package:flutter/material.dart';

class ReviewDisplayScreen extends StatelessWidget {
  final String name, surname, address, email, phone, gender, review;
  final double rating;

  const ReviewDisplayScreen({super.key, 
    required this.name,
    required this.surname,
    required this.address,
    required this.email,
    required this.phone,
    required this.gender,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review Details"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow("Name", "$name $surname"),
                  Divider(),
                  _buildDetailRow("Address", address),
                  Divider(),
                  _buildDetailRow("Email", email),
                  Divider(),
                  _buildDetailRow("Phone", phone),
                  Divider(),
                  _buildDetailRow("Gender", gender),
                  Divider(),
                  _buildDetailRow("Rating", "$rating Stars"),
                  Divider(),
                  _buildDetailRow("Review", review),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label:",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
