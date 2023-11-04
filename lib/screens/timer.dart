import 'dart:async';

import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {

  const MyTimer({super.key});

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {

  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;
  int _milliseconds  = 0;
  late Timer _timer;

  void startTimer() {

    const duration = Duration(milliseconds: 10);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        _milliseconds += 10;
        if (_milliseconds >= 1000) {
          _milliseconds = 0;
          _seconds++;
        }
        if (_seconds >= 60) {
          _seconds = 0;
          _minutes++;
        }
        if (_minutes >= 60) {
          _minutes = 0;
          _hours++;
        }
      });
    });
  }

  void restartTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    setState(() {
      _milliseconds = 0;
      _hours=0;
      _minutes=0;
      _seconds=0;
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Cronometro'),
            Text('Designed by Raul Ventura',style: TextStyle(fontSize: 10),)
          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        //border: Border.all(color: Colors.white),
                    ),
                    width: 170,

                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('$_hours :',style: const TextStyle(fontSize: 135))
                    ),
                ),
                Container(
                    decoration: const BoxDecoration(
                        //border: Border.all(color: Colors.white)
                    ),
                  width: 220,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text('$_minutes:',style: const TextStyle(fontSize: 135))
                    ),
                ),
                Container(
                    decoration: const BoxDecoration(
                        //border: Border.all(color: Colors.white)
                    ),
                  width: 220,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(' $_seconds:',style: const TextStyle(fontSize: 135))
                    ),
                ),
                Container(
                    decoration: const BoxDecoration(
                        //border: Border.all(color: Colors.white)
                    ),
                  width: 120,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(' $_milliseconds',style: const TextStyle(fontSize: 60))
                    ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: startTimer,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: stopTimer,
                  child: const Text('Stop'),
                ),
                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: restartTimer,
                  child: const Text('Restart'),
                ),
              ],
            ),
          ],
        ),
      ),


    );



  }
}
