import 'package:demo_project/Screen/LoginScreen.dart';
import 'package:demo_project/Screen/student_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class S1 extends StatefulWidget {
  const S1({super.key});

  @override
  _S1State createState() => _S1State();
}

class _S1State extends State<S1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF001F3F), Color(0xFF0074E4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 12,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/logo1.png",
                      height: 100,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          size: 100,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Odisha International School",
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Select your role to continue",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                RoleSelectionCard(
                  imagePath: 'assets/Student.svg',
                  title: 'Student',
                  description: 'Access homework, attendance, and more.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => student_login()),
                    );
                  },
                ),
                const SizedBox(height: 24),
                RoleSelectionCard(
                  imagePath: 'assets/Teacher.svg',
                  title: 'Teacher',
                  description: 'Manage attendance, assignments, and reports.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoleSelectionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;

  const RoleSelectionCard({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(0.9),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 3),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(imagePath, height: 60),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF001F3F),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xFF003366),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF001F3F)),
          ],
        ),
      ),
    );
  }
}
