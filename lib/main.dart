import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pricing_screen.dart'; // Make sure to create this
import 'congratulations_screen.dart'; // Make sure to create this

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Subscription Plans UI',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF1E1E1E),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PricingScreen(),
        '/congrats': (context) => CongratulationsScreen(),
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF1E1E2F), // Dark background
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Text(
                'A',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Alex Johnson',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'alex.johnson@example.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 32),
            ListTile(
              title: Text('Change Password'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle change password
              },
            ),
            Divider(),
            ListTile(
              title: Text('Manage Subscription'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to subscription page
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
    );
  }
}


class SubscriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Plans'),
        backgroundColor: Color(0xFF1E1E2F), // Dark background
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildPlanCard(context, 'Basic', '7.99', 'Basic features', Colors.blue),
            SizedBox(height: 16),
            _buildPlanCard(context, 'Pro', '19.99', 'Advanced features', Colors.green),
            SizedBox(height: 16),
            _buildPlanCard(context, 'Premium', '39.99', 'All features', Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard(BuildContext context, String title, String price, String features, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              '\$' + price + '/month',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
            ),
            SizedBox(height: 8),
            Text(features, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle subscription action
              },
              child: Text('Subscribe'),
              style: ElevatedButton.styleFrom(
                backgroundColor: color, // Use backgroundColor instead of primary
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}