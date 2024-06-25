import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:promilo/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'promilo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Hi, Welcome Back!',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade900),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Please Sign in to continue',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Email or Mob No.'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Sign In With OTP',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 15,
                  )
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  Text('Remember Me'),
                  Spacer(),
                  Text(
                    'Forget Password',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(width: 15),
                ],
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey.shade200,
                      border: Border.all(color: Colors.blue, width: 3)),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/google.png',
                    width: 50,
                    height: 50,
                  ),
                  Image.asset(
                    'assets/linkedin.png',
                    width: 50,
                    height: 50,
                  ),
                  Image.asset(
                    'assets/facebook.png',
                    width: 50,
                    height: 50,
                  ),
                  Image.asset(
                    'assets/instagram.png',
                    width: 50,
                    height: 50,
                  ),
                  Image.asset(
                    'assets/whatsapp.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Business User?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Login Here',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'By continuing, you agree to Promilo\'s Terms of Use & Privacy Policy.',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
