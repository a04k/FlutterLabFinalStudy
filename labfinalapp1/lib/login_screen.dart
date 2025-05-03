import 'package:flutter/material.dart';
import 'package:labfinalapp1/home_page.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String user = "";

  LoginScreen({super.key}); // Mutable variable to store username

  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(user: user),
      ),
    );
  }

  void _login(BuildContext context) {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      // Show alert if either is empty
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Missing Input"),
          content: Text("Please enter both username and password."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            )
          ],
        ),
      );
      return;
    }

    user = username;
    print("Logging in with user: $user");
    _navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Login Test"),
          centerTitle: true,
          backgroundColor: Colors.red,
          toolbarHeight: 120,
          leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(Icons.person, size: 30, color: Colors.white),
          )),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 600,
              width: 450,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Login",
                            style:
                                TextStyle(fontSize: 30, color: Colors.white)),
                        Padding(
                            padding:
                                EdgeInsetsDirectional.symmetric(vertical: 20)),
                                TextFormField(
                                  controller: _usernameController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person_3_rounded),
                                      labelText: "Username",
                                      hintText: "Enter your name",
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(15),
                                          borderSide: BorderSide(color: Colors.white))),
                        ),
                        Padding(
                            padding:
                                EdgeInsetsDirectional.symmetric(vertical: 5)),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.security_rounded),
                              labelText: "Password",
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Enter your password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                        Padding(
                            padding:
                                EdgeInsetsDirectional.symmetric(vertical: 20)),
                        MaterialButton(
                          onPressed: () {
                            _login(context);
                          },
                          color: Colors.white,
                          child: Icon(Icons.arrow_forward,
                              color: Colors.red, size: 30),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
