import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamrez_flutter_playground/congratulations_screen.dart';

class PricingScreen extends StatefulWidget {
  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  bool isYearly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8D7BF3),
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 220,
              color: Color(0xFF1E1E1E),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pricing Plan",
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )),
                SizedBox(height: 10),
                Text(
                    "Choose a plan to unlock all the functionality of the application.",
                    style: GoogleFonts.poppins(
                        fontSize: 14, color: Colors.white70)),
                SizedBox(height: 20),

                /// Free Plan
                FeaturePlanCard(
                  title: "Free Plan",
                  features: [
                    "Access to limited tools",
                    "Basic support",
                    "Single-device login"
                  ],
                  price: "Free",
                  isSelected: false,
                  isPro: false,
                ),

                /// Pro Plan
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pro Plan",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 16)),
                    Switch(
                      value: isYearly,
                      onChanged: (val) => setState(() => isYearly = val),
                      activeColor: Colors.greenAccent,
                    )
                  ],
                ),
                FeaturePlanCard(
                  title: isYearly
                      ? "Yearly Subscription"
                      : "Monthly Subscription",
                  features: [
                    "All AI tools unlocked",
                    "Priority support",
                    "Multi-device login",
                    "Access to Beta features"
                  ],
                  price: isYearly ? "\$99/year (Save 30%)" : "\$12/month",
                  isSelected: true,
                  isPro: true,
                  badgeText: isYearly ? "Save 30%" : null,
                ),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => CongratulationsScreen())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9C8BFF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding:
                      EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    ),
                    child: Text("Continue"),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeaturePlanCard extends StatelessWidget {
  final String title;
  final List<String> features;
  final String price;
  final bool isSelected;
  final bool isPro;
  final String? badgeText;

  const FeaturePlanCard({
    required this.title,
    required this.features,
    required this.price,
    required this.isSelected,
    required this.isPro,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF9C8BFF) : Color(0xFF2E2E2E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 4),
              Text(price,
                  style: GoogleFonts.poppins(
                      color: Colors.white70, fontSize: 12)),
              SizedBox(height: 10),
              ...features.map((f) => Row(
                children: [
                  Icon(Icons.check_circle_outline,
                      color: Colors.white, size: 16),
                  SizedBox(width: 6),
                  Expanded(
                      child: Text(f,
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.white))),
                ],
              )),
            ],
          ),
        ),
        if (badgeText != null)
          Positioned(
            top: 4,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(badgeText!,
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
            ),
          )
      ],
    );
  }
}
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);

    var secondControlPoint = Offset(3 * size.width / 4, size.height - 60);
    var secondEndPoint = Offset(size.width, size.height - 20);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
