import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/theme.dart';
import '../widgets/footer_section.dart';

class CreateAccountScreen extends StatefulWidget {
  final VoidCallback onLoginTap;
  final Function(File) onImagePicked;
  const CreateAccountScreen({super.key, required this.onLoginTap, required this.onImagePicked});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _isHovered = false;
  File? _selectedImage;
  Future<void> _pickImage() async{
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if(image != null){
      setState(() {
        _selectedImage = File(image.path);
      });
      widget.onImagePicked(_selectedImage!);
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
                boxShadow: [
                  const BoxShadow(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildTextField("Full Name", "John Doe", false),
                      const SizedBox(height: 16),
                      _buildTextField("Email", "example@mail.com", false,
                          inputType: TextInputType.emailAddress),
                      const SizedBox(height: 16),
                      _buildTextField("Password", "••••••••", true),
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
                                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Colors.grey[300]!),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.centerLeft, // text aligns like placeholder
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
                          // TODO: handle submit
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
                                  decorationColor:
                                  const Color(0xFFF97316),
                                  decorationThickness: 2,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 64),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "WE ARE VERY PROUD TO SERVE",
                  style: lightMode.textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const FooterSection(),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder, bool obscureText,
      {TextInputType inputType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.robotoMono(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          obscureText: obscureText,
          keyboardType: inputType,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: GoogleFonts.robotoMono(
              color: Colors.grey[400],
              fontSize: 14,
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
              borderSide: BorderSide(color: Color(0xFFF97316), width: 2),
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
      ],
    );
  }
}
