import 'package:book_reading/screens/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int count = 0;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //   return Home();
      // }));
      setState(() {
        hasDataLoaded = true;
      });
    });

    super.initState();
  }

  bool hasDataLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasDataLoaded == true ? SizedBox() : CircularProgressIndicator(),
            Text(
              hasDataLoaded == true
                  ? "Data fetching completed"
                  : 'Loading for data',
              style: const TextStyle(fontSize: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      count--;
                    });
                    print(count);
                  },
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                    print(count);
                  },
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
