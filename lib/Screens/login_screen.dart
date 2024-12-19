import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:msme_exhibition/Items/footer_section.dart';
import 'package:msme_exhibition/Items/help_section.dart';
import '../Items/appbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnabled = false;

  // Placeholder for onSearch function (adjust this as per your requirements)
  void _onSearch(String query) {
    // Handle search functionality here
    print("Searching for: $query");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Ensure you pass onSearch to CustomSliverAppBar
          CustomSliverAppBar(
            title: 'Micro Mart',
            expandedHeight: 50.0, // Pass the onSearch function here
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color(0xFFFAE9F5),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF5A1E),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black54),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                          onChanged: _checkFields,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black54),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                          onChanged: _checkFields,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Perform login logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Login submitted!')),
                          );
                        }
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonEnabled
                            ? const Color(0xFFFFBA00) // Yellow when enabled
                            : Colors.grey, // Grey when disabled
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Submit',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Divider(
              color: Color(0xFFFFC5EC),
              thickness: 2,
            ),
          ),
          const SliverToBoxAdapter(
            child: HelpSection(),
          ),
          const SliverToBoxAdapter(
            child: FooterSection(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
        ],
      ),
    );
  }

  // Method to enable/disable button
  void _checkFields(String value) {
    setState(() {
      isButtonEnabled = _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }
}