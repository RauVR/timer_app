import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timer_app/utils/text_container.dart';

class MyTimer extends StatefulWidget {

  const MyTimer({super.key});

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {

  final number = '0';

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

                //TextContainer(text: _hours, width: 250, fontsize: 190)

                Visibility(
                    visible: (_hours > 0) ? true : false,
                    child: Container(
                      decoration: const BoxDecoration(
                        //border: Border.all(color: Colors.white)
                      ),
                      width: 150,
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '$_hours:',
                            style: const TextStyle(fontSize: 190,
                                fontWeight: FontWeight.w100),
                          )
                      ),
                    ),
                ),


                TextContainer(text: _minutes, width: 270,fontsize: 190),


                Container(
                  decoration: const BoxDecoration(
                    //border: Border.all(color: Colors.white)
                  ),
                  width: 95,
                  child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Visibility(
                              visible: (_seconds<10)?true:false,
                              child: Text(number,
                                style: const TextStyle(fontSize: 80,fontWeight: FontWeight.w100),)
                          ),
                          Text(
                            '$_seconds',
                            style: const TextStyle(fontSize: 80,fontWeight: FontWeight.w100),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),


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
                const SizedBox(width: 40),
              ],
            ),
          ],
        ),
      ),


    );



  }
}
