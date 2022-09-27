import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextButton(
                    child: Text(
                      '1  2  3  4  5  6',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.white,
            ),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: TextButton(
              child: Text(
                'Visit www.hrmswebsite.com,'
                'and login to approve the code',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CircularCountDownTimer(
            duration: 60,
            initialDuration: 0,
            controller: CountDownController(),
            width: 60,
            height: 50,
            ringColor: Colors.grey[300]!,
            ringGradient: null,
            fillColor: Colors.purpleAccent[100]!,
            fillGradient: null,
            backgroundColor: Colors.purple[500],
            backgroundGradient: null,
            strokeWidth: 20.0,
            strokeCap: StrokeCap.round,
            textStyle: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            textFormat: CountdownTextFormat.S,
            isReverse: true,
            isReverseAnimation: true,
            isTimerTextShown: true,
            autoStart: true,
            onStart: () {
              debugPrint('Countdown Started');
            },
            onComplete: () {
              debugPrint('Countdown Ended');
            },
            onChange: (String timeStamp) {
              debugPrint('Countdown Changed $timeStamp');
            },
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          // FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
          FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
          FloatingNavbarItem(
              icon: Icons.arrow_back_ios_new_outlined, title: 'Back'),
        ],
      ),
    );
  }
}
