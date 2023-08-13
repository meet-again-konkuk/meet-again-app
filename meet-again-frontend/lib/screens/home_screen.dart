import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinutes = 1500;

  int totalSeconds = twentyFiveMinutes;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;


  void oneCycle() {
    setState(() {
      totalSeconds = twentyFiveMinutes;
      totalPomodoros = totalPomodoros + 1;
      isRunning = false;
    });
    timer.cancel();
  }

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      oneCycle();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );

    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onRestPressed() {
    setState(() {
      totalSeconds = twentyFiveMinutes;
      totalPomodoros = 0;
      isRunning = false;
    });
    timer.cancel();
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);

    print(duration);
    var time = duration.toString().split(".")[0].split(":");
    var minute = time[1];
    var second = time[2];
    return '$minute:$second';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  format(totalSeconds),
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
          Flexible(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(
                        isRunning
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                      ),
                    ),
                    IconButton(
                      iconSize: 50,
                      color: Theme.of(context).cardColor,
                      onPressed: onRestPressed,
                      icon: const Icon(
                        Icons.restart_alt_outlined,
                      ),
                    ),
                  ],
                ),
              )),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pomodoro',
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '$totalPomodoros',
                            style: TextStyle(
                                fontSize: 58,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .color,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
