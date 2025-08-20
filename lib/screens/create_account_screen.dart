import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/theme.dart';
import '../widgets/footer_section.dart';

class CreateAccountScreen extends StatefulWidget {
  final VoidCallback onLoginTap;
  final Function(File?) onSignUpClicked;

  const CreateAccountScreen({
    super.key,
    required this.onLoginTap,
    required this.onSignUpClicked,
  });

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isHovered = false;
  File? _selectedImage;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFFF97316)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: Offset(0, 4),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    "Create Account",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoMono(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFF97316),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Form
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTextField(
                          "Full Name",
                          "John Doe",
                          false,
                          controller: _nameController,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          "Email",
                          "example@mail.com",
                          false,
                          inputType: TextInputType.emailAddress,
                          controller: _emailController,
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          "Password",
                          "••••••••",
                          true,
                          controller: _passwordController,
                        ),
                        const SizedBox(height: 16),

                        // Profile Picture
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Profile Picture",
                              style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: OutlinedButton(
                                onPressed: _pickImage,
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 12),
                                  backgroundColor: Colors.white,
                                  side: BorderSide(color: Colors.grey[300]!),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                child: Text(
                                  _selectedImage != null
                                      ? _selectedImage!.path.split('/').last
                                      : "Choose File (No file chosen)",
                                  style: GoogleFonts.robotoMono(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Submit button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.onSignUpClicked(_selectedImage);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF97316),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.robotoMono(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Footer text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: GoogleFonts.robotoMono(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                            MouseRegion(
                              onEnter: (_) =>
                                  setState(() => _isHovered = true),
                              onExit: (_) =>
                                  setState(() => _isHovered = false),
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: widget.onLoginTap,
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.robotoMono(
                                    color: const Color(0xFFF97316),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    decoration: _isHovered
                                        ? TextDecoration.underline
                                        : TextDecoration.none,
                                    decorationColor: const Color(0xFFF97316),
                                    decorationThickness: 2,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 64),
          SizedBox(
            width: double.infinity,
            child: Text(
              "WE ARE VERY PROUD TO SERVE",
              style: lightMode.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          const FooterSection(),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder, bool obscureText,
      {TextInputType inputType = TextInputType.text,
        required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: inputType,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "$label is required";
        }
        if (label == "Email" &&
            !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return "Enter a valid email";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: GoogleFonts.robotoMono(
          color: Colors.grey[400],
          fontSize: 14,
        ),
        errorStyle: GoogleFonts.robotoMono(
          color: const Color(0xFFF97316),
          fontSize: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFF97316), width: 2),
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}
