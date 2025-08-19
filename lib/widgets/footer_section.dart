import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 800;
          return Wrap(
            spacing: 32,
            runSpacing: 24,
            alignment: WrapAlignment.start,
            children: _buildColumns(isWide),
          );
        },
      ),
    );
  }

  List<Widget> _buildColumns(bool isWide) {
    Widget _boxed({required double width, required Widget child}) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child: child,
      );
    }

    return [
      _boxed(
        width: 280,
        child: Column(
          crossAxisAlignment: isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png", height: 56),
            const SizedBox(height: 20),
            Image.asset("assets/images/payment.png", height: 56),
          ],
        ),
      ),
      _boxed(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Quick Links", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Text("About Us", style: TextStyle(color: Colors.black87)),
            Text("Career", style: TextStyle(color: Colors.black87)),
            Text("Blog", style: TextStyle(color: Colors.black87)),
            Text("Help Center", style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
      _boxed(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Contact Us", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Text(
              "House: 1/A, Road: 17, South Baridhara R/A, DIT Project,\nDhaka 1212 Bangladesh",
              style: TextStyle(color: Colors.black87),
            ),
            Text("E-Mail: support@freshtodaybd.com", style: TextStyle(color: Colors.black87)),
            Text("Phone: 09617 551122, 01931-000700", style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
      _boxed(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Policies", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Text("Privacy Policy", style: TextStyle(color: Colors.black87)),
            Text("Return Policy", style: TextStyle(color: Colors.black87)),
            Text("Terms and Conditions", style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
      _boxed(
        width: 240,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Get in touch", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                _socialIcon(FontAwesomeIcons.facebook, Colors.blue),
                _socialIcon(FontAwesomeIcons.twitter, Colors.lightBlue),
                _socialIcon(FontAwesomeIcons.instagram, Colors.purple),
                _socialIcon(FontAwesomeIcons.youtube, Colors.red),
                _socialIcon(FontAwesomeIcons.linkedin, Colors.blueAccent),
              ],
            )
          ],
        ),
      ),
    ];
  }

  Widget _socialIcon(IconData icon, Color color) {
    return IconButton(
      icon: FaIcon(icon, color: color),
      onPressed: () {},
    );
  }
}
