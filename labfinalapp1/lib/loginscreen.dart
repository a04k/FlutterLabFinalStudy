import 'dart:core';

import 'package:flutter/material.dart';
import 'package:labfinalapp1/home_page.dart';

class Login extends StatelessWidget{

   String user= "";

  final TextEditingController usercontrol = TextEditingController();
  final TextEditingController passcontrol = TextEditingController();


  void _login(BuildContext context) {
    String username = usercontrol.text.trim();
    String password = passcontrol.text.trim();

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

  void _navigateToHome(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(user: user)
      )
      );
  }


@override
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      leading: Icon(Icons.person, size: 40, color: Colors.white),
      title: Text("Login Screen 2"),
      toolbarHeight: 200,
      titleTextStyle: TextStyle(
        fontSize: 32,
        color: Colors.white,
      ),
      backgroundColor: Colors.black,
    ),
    body: Center(
      child: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Form(
          child: 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children:[
                TextFormField(
                  controller: usercontrol,
                  obscureText: false,
              
                  
                  decoration: InputDecoration(
                      hintText: "Input username",
                      prefixIcon: Icon(Icons.person_2_outlined),
                      labelText: "Username",
                      filled: true,
                      fillColor: Colors.white,
              
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red) // border color
                      ),
                
                    )
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passcontrol,
                  obscureText: true,
              
                  
                  decoration: InputDecoration(
                      hintText: "Input password",
                      prefixIcon: Icon(Icons.security_rounded),
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors.white,
              
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.red) // border color
                      ),
                
                    )
                ),
                  SizedBox(
                  height: 20,
                ),
                    ElevatedButton(
                      onPressed: () {
                        print('Styled button pressed');
                        _login(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Background color
                        foregroundColor: Colors.white, // Text color
                        side: BorderSide(color: Colors.black, width: 2), // Border
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Rounded corners
                        ),
                      ),
                      child: Text('Log in'),
                    )
                     ] ),
            )
        )
      ]
    
      )

      
      )
    );

}

}