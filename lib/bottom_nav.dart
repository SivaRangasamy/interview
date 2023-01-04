import 'package:flutter/material.dart';
import 'package:interview/chat.dart';
import 'package:interview/contracts.dart';
import 'package:interview/home.dart';
import 'package:interview/loan.dart';
import 'package:interview/teams.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 2;

  final pages = [
    const Contracts(),
    const Loan(),
    const Home(),
    const Teams(),
    const Chat(),
  ];

  void onTap(int index) {
    currentIndex = index;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon:Image.asset("images/home.png",
                  height: 20,width: 20), label: 'Home'),
          BottomNavigationBarItem(icon: Image.asset("images/loan.png",
              height: 20,width: 20), label: 'Loan'),
          BottomNavigationBarItem(icon: Image.asset("images/contracts.png",
              height: 20,width: 20), label: 'Contracts'),
          BottomNavigationBarItem(icon: Image.asset("images/teams.png",
              height: 20,width: 20), label: 'Teams'),
          BottomNavigationBarItem(icon: Image.asset("images/chat.png",
              height: 20,width: 20), label: 'Chat'),
        ],
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Color(0XFF231F20),
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
