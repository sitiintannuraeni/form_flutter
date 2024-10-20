import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String role;
  final String description;
  final String school;
  final String password;

  const ProfilePage({
    Key? key,
    required this.username,
    required this.role,
    required this.description,
    required this.school,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // User Icon inside a circular Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100), // Circular shape
              ),
              elevation: 4, // Elevation for shadow effect
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100), // Circular clipping
                child: Container(
                  width: 100, // Width of the card
                  height: 100, // Height of the card
                  color: Colors.yellow, // Background color
                  child: Icon(
                    Icons.person, // User icon
                    size: 60, // Icon size
                    color: Colors.black, // Icon color
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),

            Text(
              username,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),

            // School Card
            _buildCard(Icons.school, "School", school),
            const SizedBox(height: 10.0),

            // Role Card
            _buildCard(Icons.work, "Role", role),
            const SizedBox(height: 10.0),

            // Description Card
            _buildCard(Icons.description, "About", description),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(IconData icon, String title, String value) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.yellow),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
