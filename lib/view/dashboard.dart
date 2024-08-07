import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/auth_controller.dart';
import 'package:test/view/grid_image_list.dart';
import 'package:test/view/horizontal_image_list.dart';
import 'package:test/view/vertical_image_list.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          TextButton(
            child: const Text("Logout"),
            onPressed: () => authController.signOut(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Horizontal List',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            HorizontalImageList(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Vertical List',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            VerticalImageList(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Grid View',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            GridImageList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0, 
        selectedItemColor: Colors.blue,
        onTap: (index) {
        },
      ),
    );
  }
}
