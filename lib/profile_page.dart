import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'editProfile.dart';

class ProfileScreen extends StatelessWidget {
  final Color bgColor = const Color(0xFF1E1E1E);
  final Color cardColor = const Color(0xFF2C2C2C);
  final Color accentColor = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text("My Profile", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Profile Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/profile.jpg'), // Replace with actual avatar
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("John Mobbin", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
                        Text("🌟 Essential", style: GoogleFonts.poppins(color: Colors.grey)),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _statBlock("4", "Reputation"),
                            _statBlock("6", "Published"),
                            _statBlock("1k", "Followers"),
                            _statBlock("100", "Following"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfileScreen()),
                      );
                    },
                    child: Text("Edit Profile", style: GoogleFonts.poppins(color: accentColor)),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Published Ideas Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Published Ideas",
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // Ideas Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
              children: List.generate(_ideas.length, (index) {
                final item = _ideas[index];
                return _ideaCard(item['title']!, item['date']!, item['likes']!, item['comments']!, item['image']!);
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _statBlock(String number, String label) {
    return Column(
      children: [
        Text(number, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _ideaCard(String title, String date, String likes, String comments, String image) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 8),
          Text(date, style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(title, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _iconText(Icons.thumb_up, likes),
              _iconText(Icons.comment, comments),
            ],
          )
        ],
      ),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: GoogleFonts.poppins(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  final List<Map<String, String>> _ideas = [
    {
      'title': 'Why is gold outpacing the stock market?',
      'date': '07 Jan, 24',
      'likes': '133',
      'comments': '30',
      'image': 'images/whatsapp.png'
    },
    {
      'title': 'Gold route map & trading plan update.',
      'date': '02 Jan, 24',
      'likes': '130',
      'comments': '28',
      'image': 'images/facebook.png'
    },
    {
      'title': 'Amazon - My plan for 2024.',
      'date': '31 Dec, 23',
      'likes': '150',
      'comments': '45',
      'image': 'images/instagram.png'
    },
    {
      'title': 'Why is gold outpacing the stock market?',
      'date': '25 Dec, 23',
      'likes': '100',
      'comments': '10',
      'image': 'images/twitter.png'
    }
  ];
}
