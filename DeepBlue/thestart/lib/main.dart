// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// void main() => runApp(new MaterialApp(
//       home: new MyApp(),
//     ));
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyApState();
// }
//
// class _MyApState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.car_rental_sharp),
//           onPressed: () {
//             if (kDebugMode) {
//               print('OH oo...');
//             }
//           },
//         ),
//         title: const Text('Lets Go...'),
//         actions: const <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: Icon(Icons.miscellaneous_services),
//             onPressed: () {},
//           )
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   // const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Text('My Mom'),
//     );
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Column(
//         children: <Widget>[
//           SafeArea(child: Text('First Build')),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import 'login_page.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'AI Chat Assistant',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ChatScreen(),
//     );
//   }
// }
//
// class ChatScreen extends StatefulWidget {
//   @override
//   State createState() => ChatScreenState();
// }
//
// class ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<ChatMessage> _messages = [];
//   bool isBotTyping = false;
//
//   void _handleLogin(BuildContext context) {
//     // Navigate to the login page
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => LoginPage()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('AI Chat Assistant'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.login),
//             onPressed: () {
//               // Add your login logic here
//               _handleLogin(context);
//               // For simplicity, a dialog is shown in this example
//               // showDialog(
//               //   context: context,
//               //   builder: (BuildContext context) {
//               //     return AlertDialog(
//               //       title: Text("Login"),
//               //       content: Text("Implement your login logic here."),
//               //       actions: [
//               //         TextButton(
//               //           onPressed: () {
//               //             Navigator.pop(context);
//               //           },
//               //           child: Text("Close"),
//               //         ),
//               //       ],
//               //     );
//               //   },
//               // );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               reverse: true, // Display messages in reverse order
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 return _messages[index];
//               },
//             ),
//           ),
//           _buildMessagePrompt(),
//           _buildMessageComposer(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMessagePrompt() {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: _messages.isNotEmpty && !_messages.first.isUser
//           ? Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 isBotTyping
//                     ? Row(
//                         children: [
//                           CircularProgressIndicator(),
//                           SizedBox(width: 8.0),
//                           Text('AI Assistant is typing...'),
//                         ],
//                       )
//                     : Container(),
//                 SizedBox(height: 5.0),
//               ],
//             )
//           : Container(),
//     );
//   }
//
//   Widget _buildMessageComposer() {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _messageController,
//               textInputAction: TextInputAction.send,
//               onSubmitted: _handleSubmitted,
//               decoration: InputDecoration.collapsed(
//                 hintText: 'Send a FAQ Prompt...',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               _handleSubmitted(_messageController.text);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _handleSubmitted(String text) {
//     _messageController.clear();
//     ChatMessage message = ChatMessage(
//       text: text,
//       isUser: true,
//     );
//     setState(() {
//       _messages.insert(0, message);
//     });
//     _handleAIDummyResponse();
//   }
//
//   void _handleAIDummyResponse() {
//     setState(() {
//       isBotTyping = true;
//     });
//     Future.delayed(Duration(seconds: 2), () {
//       ChatMessage aiMessage = ChatMessage(
//         text: "This is a dummy AI response.",
//         isUser: false,
//       );
//
//       setState(() {
//         isBotTyping = false;
//         // _messages.removeAt(0); // Remove the typing prompt
//         _messages.insert(0, aiMessage);
//       });
//     });
//   }
// }
//
// class ChatMessage extends StatelessWidget {
//   final String text;
//   final bool isUser;
//
//   ChatMessage({required this.text, required this.isUser});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           isUser
//               ? CircleAvatar(
//                   child: Icon(Icons.person),
//                 )
//               : CircleAvatar(
//                   child: Icon(Icons.android),
//                 ),
//           SizedBox(width: 10.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   isUser ? 'You' : 'AI Assistant',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 5.0),
//                 Text(text),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//--------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';

import 'signup_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Chat Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool isBotTyping = false;

  void _handleLogin(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LoginDialog();
      },
    );
  }

  void _handleSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI Chat Assistant'),
        actions: [
          IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              // Add your login logic here
              _handleLogin(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: _handleSignup,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Display messages in reverse order
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          _buildMessagePrompt(),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  Widget _buildMessagePrompt() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: _messages.isNotEmpty && !_messages.first.isUser
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isBotTyping
                    ? Row(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(width: 8.0),
                          Text('AI Assistant is typing...'),
                        ],
                      )
                    : Container(),
                SizedBox(height: 5.0),
              ],
            )
          : Container(),
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              textInputAction: TextInputAction.send,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a FAQ Prompt...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _handleSubmitted(_messageController.text);
            },
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _messageController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });
    _handleAIDummyResponse();
  }

  void _handleAIDummyResponse() {
    setState(() {
      isBotTyping = true;
    });
    Future.delayed(Duration(seconds: 2), () {
      ChatMessage aiMessage = ChatMessage(
        text: "This is a dummy AI response.",
        isUser: false,
      );

      setState(() {
        isBotTyping = false;
        // _messages.removeAt(0); // Remove the typing prompt
        _messages.insert(0, aiMessage);
      });
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isUser
              ? CircleAvatar(
                  child: Icon(Icons.person),
                )
              : CircleAvatar(
                  child: Icon(Icons.android),
                ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isUser ? 'You' : 'AI Assistant',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(text),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// login_page.dart
// import 'package:flutter/material.dart';

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
