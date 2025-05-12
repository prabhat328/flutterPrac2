import 'package:flutter/material.dart';
import '../widgets/rating_widget.dart';
import '../widgets/submit_button.dart';
import 'review_display_screen.dart';
import 'package:flutter/services.dart';

class ReviewFormScreen extends StatefulWidget {
  const ReviewFormScreen({super.key});

  @override
  _ReviewFormScreenState createState() => _ReviewFormScreenState();
}

class _ReviewFormScreenState extends State<ReviewFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  String? _gender;
  double _rating = 5;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewDisplayScreen(
            name: _nameController.text,
            surname: _surnameController.text,
            address: _addressController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            gender: _gender!,
            review: _reviewController.text,
            rating: _rating,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Review Form"),
        backgroundColor: Colors.teal, // Customize your app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField(_nameController, "Name"),
                _buildInputField(_surnameController, "Surname"),
                _buildInputField(_addressController, "Address"),
                _buildInputField(
                  _emailController,
                  "Email",
                  validator: (value) =>
                      value!.contains('@') ? null : "Enter valid Email",
                ),
                _buildInputField(
                  _phoneController,
                  "Phone Number",
                  validator: (value) =>
                      value!.length == 10 ? null : "Enter valid Phone Number",
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                _buildGenderDropdown(),
                RatingWidget(
                  rating: _rating,
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating;
                    });
                  },
                ),
                _buildInputField(_reviewController, "Review"),
                SizedBox(height: 20),
                SubmitButton(onPressed: _submitForm),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label,
      {String? Function(String?)? validator,
      List<TextInputFormatter>? inputFormatters}) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          validator:
              validator ?? (value) => value!.isEmpty ? "Enter $label" : null,
          inputFormatters: inputFormatters, // Apply inputFormatters
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Gender",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          value: _gender,
          items: ["Male", "Female", "Other"]
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) {
            setState(() {
              _gender = value;
            });
          },
          validator: (value) => value == null ? "Select Gender" : null,
        ),
      ),
    );
  }
}
