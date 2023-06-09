import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rnd_flutter_app/provider/login_provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthProvider>(context);
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.3,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.pink.shade400),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nahid Hasan',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.pink.shade400),
              title: const Text('Home'),
              onTap: () {
                // Handle onTap
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart, color: Colors.pink.shade400),
              title: const Text('Statement'),
              onTap: () {
                // Handle onTap
              },
            ),
            ListTile(
              leading: Icon(Icons.assessment, color: Colors.pink.shade400),
              title: const Text('Limit'),
              onTap: () {
                // Handle onTap
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add, color: Colors.pink.shade400),
              title: const Text('Refer'),
              onTap: () {
                // Handle onTap
              },
            ),
            ListTile(
              leading: Icon(Icons.support, color: Colors.pink.shade400),
              title: const Text('Support'),
              onTap: () {
                // Handle onTap
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.pink.shade400),
              title: const Text('Logout'),
              onTap: () {
                if (authState.isAuthenticated) {
                  authState.logout();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
