import 'package:book_reading/widgets/home_widgets/circle_shape.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ClipRRect(
          child: Stack(
            children: [
              CircleShape(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Text(
                      'What are you\nreading today?',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 200,
                            width: 150,
                            color: Colors.red,
                            child: Text('Hello'),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 150,
                          color: Colors.orange,
                          child: Text('Hello'),
                        ),
                        Container(
                          height: 200,
                          width: 150,
                          color: Colors.purple,
                          child: Text('Hello'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(color: Colors.blue),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.green),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
