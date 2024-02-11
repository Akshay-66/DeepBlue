import 'package:flutter/material.dart';

import 'signup_page.dart';

void main() {
  runApp(MyAp());
}

class MyAp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chat Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void _handleLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LoginDialog();
      },
    );
  }

  void _handleSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                // Implement logo action here
                HomePage();
              },
              icon: Icon(Icons.format_align_center_rounded),
            ),
            Image.asset(
              'assets/images/my_logo.jpg', // Provide your image path
              width: 40, // Adjust width as needed
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Add your login logic here
                    _handleLogin(context);
                  },
                  icon: Icon(Icons.login),
                ),
                IconButton(
                  onPressed: () {
                    _handleSignup(context);
                  },
                  icon: Icon(Icons.person_add),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to AI Chat Assistant!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Our AI Chat Assistant is powered by state-of-the-art natural language processing models, allowing it to understand and respond to your inquiries effectively.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/related_image.jpg',
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text(
                'Architecture:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Our chatbot uses a combination of deep learning and rule-based approaches to understand user queries and provide accurate responses. It leverages technologies such as TensorFlow and BERT for natural language understanding.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Get Started:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Show login dialog when the gif is clicked
                  _handleLogin(context);
                },
                child: Image.asset(
                  'assets/gifs/get_started.gif',
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform sign-in logic here
                Navigator.pop(context);
                // UploadPage();
              },
              child: Text('Log In'),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOAuthButton(
                    'assets/images/google_logo.png', 'Continue with Google'),
                SizedBox(width: 16.0),
                _buildOAuthButton(
                    'assets/images/apple_logo.png', 'Continue with Apple'),
                SizedBox(width: 16.0),
                _buildOAuthButton(
                    'assets/images/mastek_logo.png', 'Continue with Mastek'),
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
