import 'package:flutter/material.dart';
import 'profile.dart'; // Import the ProfilePage

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnabled = false; // Awalnya tombol tidak aktif

  // Fungsi untuk mengecek apakah semua input sudah diisi
  void _checkInput() {
    setState(() {
      isButtonEnabled = _usernameController.text.isNotEmpty &&
          _roleController.text.isNotEmpty &&
          _descriptionController.text.isNotEmpty &&
          _schoolController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    // Menambahkan listener ke setiap text field untuk mengecek input
    _usernameController.addListener(_checkInput);
    _roleController.addListener(_checkInput);
    _descriptionController.addListener(_checkInput);
    _schoolController.addListener(_checkInput);
    _passwordController.addListener(_checkInput);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profil Image / Icon User di dalam lingkaran
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[800], // Warna background lingkaran
              child: Icon(
                Icons.person_outline,
                color: Colors.yellow,
                size: 60,
              ),
            ),
            const SizedBox(height: 20),

            // Username TextField
            TextField(
              controller: _usernameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person, color: Colors.yellow),
                labelText: 'Username',
                labelStyle: const TextStyle(color: Colors.yellow),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.yellow),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Role TextField
            TextField(
              controller: _roleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.work, color: Colors.yellow),
                labelText: 'Role',
                labelStyle: const TextStyle(color: Colors.yellow),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.yellow),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Description TextField
            TextField(
              controller: _descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.description, color: Colors.yellow),
                labelText: 'Description',
                labelStyle: const TextStyle(color: Colors.yellow),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.yellow),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // School TextField
            TextField(
              controller: _schoolController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.school, color: Colors.yellow),
                labelText: 'School',
                labelStyle: const TextStyle(color: Colors.yellow),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.yellow),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Password TextField
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock, color: Colors.yellow),
                labelText: 'Password',
                labelStyle: const TextStyle(color: Colors.yellow),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.yellow),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Tombol Login
            ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(
                            username: _usernameController.text,
                            role: _roleController.text,
                            description: _descriptionController.text,
                            school: _schoolController.text,
                            password: _passwordController.text,
                          ),
                        ),
                      );
                    }
                  : null, // Tombol dinonaktifkan jika input belum lengkap
              style: ElevatedButton.styleFrom(
                backgroundColor: isButtonEnabled
                    ? Colors.yellow
                    : Colors.grey, // Warna tombol berubah sesuai kondisi
                foregroundColor: Colors.black,
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
