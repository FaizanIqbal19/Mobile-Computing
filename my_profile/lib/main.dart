
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           const CircleAvatar(
                radius: 60, // Image ka size
                backgroundImage: AssetImage('assets/Faizan.jpeg'), // Aap ki image ka path
           ),
            const SizedBox(height: 12),
            const Text(
              'Faizan Iqbal',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            const Card(
              child: ListTile(
                leading: Icon(Icons.numbers, color: Colors.blue),
                title: Text('Roll Number'),
                subtitle: Text('2502141'),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.green),
                title: Text('Department'),
                subtitle: Text('BSIT'),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.red),
                title: Text('Email'),
                subtitle: Text('2502141@students.au.edu.pk'),
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      likes++;
                    });
                  },
                  icon: const Icon(Icons.thumb_up),
                  label: const Text('Like'),
                ),
                const SizedBox(width: 15),
                Text(
                  'Likes: $likes',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
