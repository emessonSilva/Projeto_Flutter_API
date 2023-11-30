import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_create_vscode/pages/LoginScreen.dart';



//Tela Carregamento

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ClackMovie',
      home: ProgressIndicatorApp(),
    );
  }
}

class ProgressIndicatorApp extends StatelessWidget {
  const ProgressIndicatorApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProgressIndicatorExample(),
    );
  }
}

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({Key? key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}
class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Change duration 
    )..addListener(() {
        setState(() {});
      });

    // Start the animation
    controller.repeat(reverse: false);

    super.initState();
    
    // Add a delay and then navigate to the next screen
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/img_claquete.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain, 
                  ),
                  const SizedBox(height: 4),
                  Text(
                'ClackMovie',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 50, 
                    height: 50, 
                    child: CircularProgressIndicator(
                    value: controller.value,
                    strokeWidth: 6,
                    color:  const Color(0xFF5E548E),
                  ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

