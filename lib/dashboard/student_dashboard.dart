import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({super.key});

  @override
  _StudentDashboardState createState() => _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Aarav Das"),
                accountEmail: Text("Grade: NURSERY, Section A"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Manage Profile"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  isDarkTheme ? Icons.wb_sunny : Icons.nightlight_round,
                ),
                title: Text("Toggle Theme"),
                onTap: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor:
              isDarkTheme ? Colors.black : Colors.lightBlue.shade100,
          elevation: 0,
          title: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aarav Das',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDarkTheme ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    'Grade: NURSERY, Section A',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: isDarkTheme ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(Icons.notifications, color: Colors.amber.shade700, size: 28),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/bgstudent.jpg',
                  ), // ✅ Student-themed background image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(
                        0.8,
                      ), // Slight transparency
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'General Announcement',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'We hope this message finds you well. The school will remain closed on Friday in observance of the upcoming public holiday.',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        _buildGridItem('assets/homework.png', 'Homework'),
                        _buildGridItem('assets/academics.png', 'Performance'),
                        _buildGridItem(
                          'assets/student_attendance.png',
                          'Attendance',
                        ),
                        _buildGridItem('assets/timetable.png', 'Timetable'),
                        _buildGridItem('assets/Event.png', 'Calendar'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String assetPath, String title) {
    return Column(
      children: [
        SvgPicture.asset(assetPath, height: 60),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
