import 'package:firebase_auth_getx_localization/controller/Auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthenticationServices authcontroller = Get.put(AuthenticationServices());
  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("hello "),
            ElevatedButton(
              onPressed: () {
                authcontroller.signOut();
              },
              child: const Text("Logout"),
            ),
            PopupMenuButton<SampleItem>(
              initialValue: selectedMenu,
              // Callback that sets the selected popup menu item.
              onSelected: (SampleItem item) {
                //    print(item);
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.itemOne,
                  child: Text('Item 1'),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.itemTwo,
                  child: Text('Item 2'),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.itemThree,
                  child: Text('Item 3'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
