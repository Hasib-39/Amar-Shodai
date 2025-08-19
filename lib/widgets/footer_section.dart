import 'package:amar_shodai/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/resonsive_helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: double.infinity,
      child: ResponsiveWidget(
        mobile: _buildMobile(),
        tab: _buildTablet(),
        desktop: _buildDesktop(),
      ),
    );
  }

  // ---------------- Desktop ----------------
  Widget _buildDesktop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(flex: 2, fit: FlexFit.loose, child: _logoColumn()),
        const SizedBox(width: 32),
        Flexible(flex: 2, fit: FlexFit.loose, child: _quickLinksColumn()),
        const SizedBox(width: 32),
        Flexible(flex: 3, fit: FlexFit.loose, child: _contactColumn()),
        const SizedBox(width: 32),
        Flexible(flex: 2, fit: FlexFit.loose, child: _policiesColumn()),
        const SizedBox(width: 32),
        Flexible(flex: 3, fit: FlexFit.loose, child: _socialColumn()),
      ],
    );
  }

  // ---------------- Tablet ----------------
  Widget _buildTablet() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(flex: 2, fit: FlexFit.loose, child: _logoColumn()),
        const SizedBox(width: 28),
        Flexible(flex: 2, fit: FlexFit.loose, child: _quickLinksColumn()),
        const SizedBox(width: 28),
        Flexible(flex: 3, fit: FlexFit.loose, child: _contactColumn()),
        const SizedBox(width: 28),
        Flexible(flex: 2, fit: FlexFit.loose, child: _policiesColumn()),
        const SizedBox(width: 28),
        Flexible(flex: 2, fit: FlexFit.loose, child: _socialColumn()),
      ],
    );
  }

  // ---------------- Mobile ----------------
  Widget _buildMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _logoColumnMobile(),
        const SizedBox(height: 28),
        _quickLinksColumn(),
        const SizedBox(height: 28),
        _contactColumn(),
        const SizedBox(height: 28),
        _policiesColumn(),
        const SizedBox(height: 28),
        _socialColumn(),
      ],
    );
  }

  // ---------------- Columns ----------------
  Widget _logoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", height: 56),
        const SizedBox(height: 20),
        Image.asset("assets/images/payment.png", height: 56),
      ],
    );
  }

  Widget _logoColumnMobile() {
    return SizedBox(
      width: double.infinity, // full width
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // optional: center vertically
        crossAxisAlignment: CrossAxisAlignment.center, // center horizontally
        children: [
          Image.asset("assets/images/logo.png"),
          const SizedBox(height: 20),
          Image.asset("assets/images/payment.png"),
        ],
      ),
    );
  }

  Widget _quickLinksColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quick Links", style: lightMode.textTheme.titleSmall),
        Text("About Us", style: lightMode.textTheme.bodySmall),
        Text("Career", style: lightMode.textTheme.bodySmall),
        Text("Blog", style: lightMode.textTheme.bodySmall),
        Text("Help Center", style: lightMode.textTheme.bodySmall),
      ],
    );
  }

  Widget _contactColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Contact Us", style: lightMode.textTheme.titleSmall),
        Text(
          "House: 1/A, Road: 17, South Baridhara R/A, DIT Project,\nDhaka 1212 Bangladesh",
          style: lightMode.textTheme.bodySmall,
        ),
        Text("E-Mail: ", style: lightMode.textTheme.titleSmall),
        Text("support@freshtodaybd.com", style: lightMode.textTheme.bodySmall),
        Text("Phone: ", style: lightMode.textTheme.titleSmall),
        Text(
          "09617 551122, 01931-000700",
          style: lightMode.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _policiesColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Policies", style: lightMode.textTheme.titleSmall),
        Text("Privacy Policy", style: lightMode.textTheme.bodySmall),
        Text("Return Policy", style: lightMode.textTheme.bodySmall),
        Text("Terms and Conditions", style: lightMode.textTheme.bodySmall),
      ],
    );
  }

  Widget _socialColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Get in touch", style: lightMode.textTheme.titleSmall),
        SizedBox(height: 12,),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _socialIcon(FontAwesomeIcons.facebook, Colors.blue),
            _socialIcon(FontAwesomeIcons.twitter, Colors.lightBlue),
            _socialIcon(FontAwesomeIcons.instagram, Colors.pinkAccent),
            _socialIcon(FontAwesomeIcons.youtube, Colors.red),
            _socialIcon(FontAwesomeIcons.linkedin, Colors.blueAccent),
          ],
        ),
      ],
    );
  }

  Widget _socialIcon(IconData icon, Color color) {
    return IconButton(
      icon: FaIcon(icon, color: color, size: 24),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () {},
    );
  }
}
