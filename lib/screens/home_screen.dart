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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_buildNavBar(), SizedBox(height: 10), _buildBody()],
      ),
    );
  }

  Expanded _buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ImageCarousel(),
            SizedBox(height: 10),
            // shop by category section
            Column(
              children: [
                Text("Shop by Category", style: lightMode.textTheme.titleLarge),
                SizedBox(height: 32),
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
            SizedBox(height: 64),
            // deals of the day section
            Column(
              children: [
                Text("Deals of the Day", style: lightMode.textTheme.titleLarge),
                const SizedBox(height: 32),

                // Responsive grid using your ResponsiveWidget
                ResponsiveWidget(
                  mobile: _buildMobileDealsSection(),
                  tab: _buildTabDealsSection(),
                  desktop: _buildDesktopDealsSection(),
                ),
              ],
            ),
            SizedBox(height: 32),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.white, width: 2),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
            SizedBox(height: 64),
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
            SizedBox(height: 32,),
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
          width: 300, // 4 columns on desktop
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
          width: 250, // 3 columns on tablet
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
          width: 180, // 2 columns on mobile
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

  Container _buildDesktopNavbar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Image.asset(height: 56, "assets/images/logo.png"),
          ),
          SizedBox(width: 8),
          Expanded(flex: 0, child: CategoryDropdown(isTablet: false)),
          SizedBox(width: 8),
          Expanded(flex: 0, child: _elevatedButton(false)),
          SizedBox(width: 8),
          Expanded(flex: 2, child: SearchBox()),
          SizedBox(width: 8),
          // LOGIN / REGISTER Button
          Expanded(
            flex: 0,
            child: TextButton.icon(
              onPressed: () {
                // TODO: Navigate to login/register
              },
              icon: Icon(
                Icons.person, // user icon
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
            ),
          ),
          const SizedBox(width: 8),
          // Cart Button
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  // TODO: Navigate to cart
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: Colors.black,
                ),
                padding: EdgeInsets.zero, // remove default padding
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildTabNavbar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(height: 56, "assets/images/logo.png"),
          ),
          SizedBox(width: 8),
          Expanded(flex: 0, child: CategoryDropdown(isTablet: true)),
          SizedBox(width: 8),
          Expanded(flex: 1, child: _elevatedButton(true)),
          SizedBox(width: 8),
          Expanded(flex: 1, child: SearchBox()),
          SizedBox(width: 8),
          // LOGIN / REGISTER Button
          Expanded(
            flex: 1,
            child: TextButton.icon(
              onPressed: () {
                // TODO: Navigate to login/register
              },
              icon: Icon(
                Icons.person, // user icon
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
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Container _buildMobileNavbar() {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 8),
          Icon(Icons.menu, color: lightMode.primaryColor),
          SizedBox(width: 8),
          Expanded(flex: 1, child: SearchBox()),
          SizedBox(width: 8),
          // Cart Button
          Expanded(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  // TODO: Navigate to cart
                },
                icon: Icon(
                  Icons.shopping_cart,
                  size: 20,
                  color: lightMode.primaryColor,
                ),
                padding: EdgeInsets.zero, // remove default padding
              ),
            ),
          ),
          // LOGIN / REGISTER Button
          Expanded(
            flex: 1,
            child: TextButton.icon(
              onPressed: () {
                // TODO: Navigate to login/register
              },
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person, // user icon
                  size: 20,
                  color: lightMode.primaryColor,
                ),
              ),
              label: Text(
                "LOGIN / REGISTER",
                style: GoogleFonts.robotoMono(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: lightMode.primaryColor,
                ),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isTablet
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    color: Colors.white, // text visible on orange bg
                  ),
                ),
        ],
      ),
    );
  }
}
