import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neww/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _emailTEC = TextEditingController();
  TextEditingController _passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/creoit.jpeg"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Welcome to my app"),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailTEC,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordTEC,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                   height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        String email = _emailTEC.text.trim();
                        String password = _passwordTEC.text.trim();

                        RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$');
                        RegExp passwordRegExp = RegExp(r'^(?=.[A-Za-z])(?=.\d)[A-Za-z\d]{8,}$');

                        if (email.isEmpty || password.isEmpty) {
                          Fluttertoast.showToast(
                              msg: 'Please enter email and password');
                        } else if (!emailRegExp.hasMatch(email)) {
                          Fluttertoast.showToast(
                              msg: 'Invalid email format');
                        } else if (!passwordRegExp.hasMatch(password)) {
                          Fluttertoast.showToast(
                              msg: 'Password should have at least 8 characters with at least 1 alphabet and 1 number');
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Login successful');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return HomeScreen();
                            }),
                          );
                        }
                      },
                      child: Text("Login"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text("Signup"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
