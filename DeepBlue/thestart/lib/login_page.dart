// login_page.dart
import 'package:flutter/material.dart';

import 'signup_page.dart'; // Import the SignupPage class

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log In',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'By continuing, you agree to our User Agreement and acknowledge that you understand the Privacy Policy.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.0),
              _buildTextFieldContainer('Username'),
              SizedBox(height: 16.0),
              _buildTextFieldContainer('Password', obscureText: true),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle forgot password logic
                    },
                    child: Text('Forgot your username or password?'),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Perform sign-in logic here
                },
                child: Text('Log In'),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOAuthButton(
                      'assets/google_logo.png', 'Continue with Google'),
                  SizedBox(width: 16.0),
                  _buildOAuthButton(
                      'assets/apple_logo.png', 'Continue with Apple'),
                  SizedBox(width: 16.0),
                  _buildOAuthButton(
                      'assets/mastek_logo.png', 'Continue with Mastek'),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      // Navigate to the sign-up page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldContainer(String label, {bool obscureText = false}) {
    return Container(
      width: 300.0, // Adjust the width as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: label,
          ),
        ),
      ),
    );
  }

  Widget _buildOAuthButton(String logoPath, String buttonText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: TextButton(
        onPressed: () {
          // Handle OAuth login logic
        },
        child: Row(
          children: [
            Image.asset(
              logoPath,
              height: 24.0,
              width: 24.0,
            ),
            SizedBox(width: 8.0),
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}

// // login_page.dart
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Log In'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Log In',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Text(
//                 'By continuing, you agree to our User Agreement and acknowledge that you understand the Privacy Policy.',
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 32.0),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Colors.grey[200],
//                 ),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//                     labelText: 'Username',
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Colors.grey[200],
//                 ),
//                 child: TextField(
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//                     labelText: 'Password',
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       // Handle forgot password logic
//                     },
//                     child: Text('Forgot your username or password?'),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 32.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Perform sign-in logic here
//                 },
//                 child: Text('Log In'),
//               ),
//               SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _buildOAuthButton(
//                       'assets/google_logo.png', 'Continue with Google'),
//                   SizedBox(width: 16.0),
//                   _buildOAuthButton(
//                       'assets/apple_logo.png', 'Continue with Apple'),
//                   SizedBox(width: 16.0),
//                   _buildOAuthButton(
//                       'assets/mastek_logo.png', 'Continue with Mastek'),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOAuthButton(String logoPath, String buttonText) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: Colors.grey[200],
//       ),
//       child: TextButton(
//         onPressed: () {
//           // Handle OAuth login logic
//         },
//         child: Row(
//           children: [
//             Image.asset(
//               logoPath,
//               height: 24.0,
//               width: 24.0,
//             ),
//             SizedBox(width: 8.0),
//             Text(buttonText),
//           ],
//         ),
//       ),
//     );
//   }
// }
