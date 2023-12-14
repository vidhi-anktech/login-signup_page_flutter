import 'package:flutter/material.dart';
import 'package:flutter_login_agian/login_success.dart';
import 'package:flutter_login_agian/register_now.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'SignIn/ SignUp',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyWidget(),
        '/second': (context) => const MySignUp(),
        '/third' : (context) => const LoginSuccess(),
      },
    ),
  );
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _validate = false;
  final _text = TextEditingController();
  final _passwordController = TextEditingController();

  final String defaultUsername = "admin";
  final String defaultPassword = "AdminDefault@123";
  String errorMessage = '';
  bool loggedIn = false;

  _onLoginPressed() {
    String enteredUsername = _text.text;
    String enteredPassword = _passwordController.text;

    if (enteredUsername == defaultUsername &&
        enteredPassword == defaultPassword) {
    
      setState(() {
        errorMessage = '';
        loggedIn = true;
        Navigator.pushNamed(context, '/third');
      });
    } else {
      setState(() {
        errorMessage = "Invalid Login Credentials";
      });
    }
   
  }

  void clearText() {
    _text.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _text.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      _header(),
                      const SizedBox(height: 30),
                      _inputField(),
                      const SizedBox(height: 30),
                      _forgotPassword(),
                      const SizedBox(height: 30),
                      _registerNow(),
                    ],
                  ),
                ))));
  }

  _header() {
    return const Column(
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text("Enter Your Credentials to Login"),
        // _isLoggedIn()
      ],
    );
  }

  _inputField() {
    return Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(height: 50),
      TextField(
        controller: _text,
        decoration: InputDecoration(
          hintText: "Enter Your UserName",
          errorText: _validate ? "Value Can't Be Empty" : null,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: const Color.fromARGB(255, 87, 88, 92).withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.person),
        ),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          hintText: "Enter Your Password",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: const Color.fromARGB(255, 87, 88, 92).withOpacity(0.1),
          filled: true,
          prefixIcon: const Icon(Icons.password),
        ),
        obscureText: true,
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FlutterPwValidator(
            controller: _passwordController,
            minLength: 6,
            uppercaseCharCount: 2,
            lowercaseCharCount: 2,
            numericCharCount: 3,
            specialCharCount: 1,
            width: 200,
            height: 150,
            onSuccess: () {},
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _validate = _text.text.isEmpty;
              
              });
              _onLoginPressed();
              clearText();
            
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              backgroundColor: const Color.fromARGB(255, 51, 48, 51),
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      )
    ]));
  }

  _forgotPassword() {
    return TextButton(
        onPressed: () {},
        child: const Text("Forgot Password?",
            style: TextStyle(
              color: Color.fromARGB(255, 59, 58, 58),
              fontWeight: FontWeight.bold,
            )));
  }

  _registerNow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Not a Member?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: const Text(
              "REGISTER NOW !",
              style: TextStyle(
                color: Color.fromARGB(255, 53, 51, 51),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ))
      ],
    );
  }
}
