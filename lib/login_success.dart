import 'package:flutter/material.dart';

class LoginSuccess extends StatefulWidget {
  const LoginSuccess({super.key});

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const Text("Great Success!",
          style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 179, 65, 57),
        ),),
        const SizedBox(height:40),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              backgroundColor: const Color.fromARGB(255, 51, 48, 51),
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Go Back",
              style: TextStyle(fontSize: 20),
            ),
          )
      ]),
    )
      )
    );
  }
}