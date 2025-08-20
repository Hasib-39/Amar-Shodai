import 'dart:io';

import 'package:amar_shodai/screens/create_account_screen.dart';
import 'package:amar_shodai/screens/login_screen.dart';
import 'package:amar_shodai/utils/resonsive_helper.dart';
import 'package:amar_shodai/utils/theme.dart';
import 'package:amar_shodai/widgets/footer_section.dart';
import 'package:amar_shodai/widgets/image_carousel.dart';
import 'package:amar_shodai/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/product_model.dart';
import '../utils/constants.dart';
import '../widgets/category_circle_avatar.dart';
import '../widgets/category_drop_down.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentPage = "home";
  File? _profileImage; // store picked image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_buildNavBar(), const SizedBox(height: 10), _buildBody()],
      ),
    );
  }

  Widget _buildBody() {
    if (_currentPage == "login") {
      return Expanded(
        child: LoginScreen(
          onRegisterTap: () {
            setState(() {
              _currentPage = "register";
            });
          },
        ),
      );
    } else if (_currentPage == "register") {
      return Expanded(
        child: CreateAccountScreen(
          onLoginTap: () {
            setState(() {
              _currentPage = "login";
            });
          },
          onImagePicked: (File image) {
            setState(() {
              _profileImage = image;
              _currentPage = "home";
            });
          },
        ),
      );
    }

    // Home Page
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageCarousel(),
            const SizedBox(height: 10),
            // Shop by Category
            Column(
              children: [
                Text("Shop by Category", style: lightMode.textTheme.titleLarge),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 80,
                  runSpacing: 80,
                  alignment: WrapAlignment.start,
                  children: categoriesList.map((category) {
                    return CategoryCircleAvatar(
                      imagePath: category["imagePath"],
                      category: category["category"],
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 64),
            // Deals of the Day
            Column(
              children: [
                Text("Deals of the Day", style: lightMode.textTheme.titleLarge),
                const SizedBox(height: 32),
                ResponsiveWidget(
                  mobile: _buildMobileDealsSection(),
                  tab: _buildTabDealsSection(),
                  desktop: _buildDesktopDealsSection(),
                ),
              ],
            ),
            const SizedBox(height: 32),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: lightMode.primaryColor,
                shadowColor: Colors.grey,
                elevation: 2,
              ),
              onPressed: () {},
              child: Text(
                "Lead More",
                style: GoogleFonts.robotoMono(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
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
      ),
    );
  }

  Wrap _buildDesktopDealsSection() {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: productList.map((p) {
        final product = Product.fromMap(p);
        return SizedBox(
          width: 300,
          child: ProductCard(product: product, onTap: () {}),
        );
      }).toList(),
    );
  }

  Wrap _buildTabDealsSection() {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: productList.map((p) {
        final product = Product.fromMap(p);
        return SizedBox(
          width: 250,
          child: ProductCard(product: product, onTap: () {}),
        );
      }).toList(),
    );
  }

  Wrap _buildMobileDealsSection() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: productList.map((p) {
        final product = Product.fromMap(p);
        return SizedBox(
          width: 180,
          child: ProductCard(product: product, onTap: () {}),
        );
      }).toList(),
    );
  }

  Container _buildNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.6),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ResponsiveWidget(
        mobile: _buildMobileNavbar(),
        tab: _buildTabNavbar(),
        desktop: _buildDesktopNavbar(),
      ),
    );
  }

  // Navbar builders
  Container _buildDesktopNavbar() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Expanded(
            flex: 0,
            child: InkWell(
              onTap: () => setState(() => _currentPage = "home"),
              child: Image.asset("assets/images/logo.png", height: 56),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(flex: 0, child: CategoryDropdown(isTablet: false)),
          const SizedBox(width: 8),
          Expanded(flex: 0, child: _elevatedButton(false)),
          const SizedBox(width: 8),
          Expanded(flex: 2, child: SearchBox()),
          const SizedBox(width: 8),
          Expanded(
            flex: 0,
            child: _profileImage == null
                ? TextButton.icon(
                    onPressed: () {
                      setState(() {
                        _currentPage = "login"; // show login screen
                      });
                    },
                    icon: const Icon(
                      Icons.person,
                      size: 16,
                      color: Colors.white,
                    ),
                    label: Text(
                      "LOGIN / REGISTER",
                      style: GoogleFonts.robotoMono(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                    child: ClipOval(
                      child: Image.file(
                        _profileImage!,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),

          const SizedBox(width: 8),
          Expanded(
            flex: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Tablet & mobile navbars can be similarly modified for profile image
  Container _buildTabNavbar() {
    return _buildDesktopNavbar(); // for simplicity, use same layout
  }

  Container _buildMobileNavbar() {
    return _buildDesktopNavbar(); // or customize layout for mobile
  }

  ElevatedButton _elevatedButton(bool isTablet) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xfff97216),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        minimumSize: const Size(80, 40),
      ),
      child: isTablet
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "📢",
                  style: lightMode.textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "OFFER",
                  style: lightMode.textTheme.labelSmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : Text(
              "📢 OFFER",
              style: lightMode.textTheme.labelSmall?.copyWith(
                color: Colors.white,
              ),
            ),
    );
  }
}
