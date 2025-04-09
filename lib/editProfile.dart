import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatelessWidget {
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
        leading: BackButton(color: Colors.white),
        title: Text("Edit Profile", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Tabs: General Info, Location, Settings
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                _tabButton("General Info", isSelected: true),
                _tabButton("Location"),
                _tabButton("Settings"),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // Profile Picture with Edit Icon
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/profile.jpg"), // Replace with actual user image
                      ),
                      Positioned(
                        bottom: 0,
                        right: 4,
                        child: CircleAvatar(
                          backgroundColor: accentColor,
                          radius: 16,
                          child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 24),

                  // First Name & Last Name
                  _textField(label: "First Name", hint: "Jamie"),
                  const SizedBox(height: 16),
                  _textField(label: "Last Name", hint: "Nelson"),

                  const SizedBox(height: 16),
                  _textField(
                    label: "Email",
                    hint: "jamienelson12@gmail.com",
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 16),
                  _textField(
                    label: "Skype",
                    hint: "jamieNelson234",
                    icon: Icons.video_call,
                  ),
                  const SizedBox(height: 16),
                  _textField(
                    label: "Phone",
                    hint: "+1-8134258374",
                    icon: Icons.phone,
                  ),

                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Change Password",
                      style: GoogleFonts.poppins(color: accentColor, fontWeight: FontWeight.w500),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: accentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }

  Widget _tabButton(String title, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: isSelected ? Border(bottom: BorderSide(color: Colors.blueAccent, width: 2)) : null,
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _textField({required String label, required String hint, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(color: Colors.grey, fontSize: 13)),
        const SizedBox(height: 6),
        TextFormField(
          initialValue: hint,
          style: GoogleFonts.poppins(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF2C2C2C),
            prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
