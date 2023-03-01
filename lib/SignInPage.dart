import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _centerNameController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _halaqahController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF142E2B),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'lib/Assets/s.png',
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),

                const SizedBox(height: 10.0), // area above for image
                TextField(
                  controller: _centerNameController,
                  decoration: const InputDecoration(
                    labelText: 'اسم المركز',
                    labelStyle: TextStyle(color: Color(0xFFEAD67F)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(
                              0xFFEAD67F)), // hover border color// cursor to use when hovering
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    icon: Icon(Icons.business_center),
                    iconColor: Color(0xFFEAD67F),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _studentNameController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Color(0xFFEAD67F)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(
                              0xFFEAD67F)), // hover border color// cursor to use when hovering
                    ),
                    labelText: 'اسم الطالبة',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person),
                    iconColor: Color(0xFFEAD67F),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _halaqahController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Color(0xFFEAD67F)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(
                              0xFFEAD67F)), // hover border color// cursor to use when hovering
                    ),
                    labelText: 'الحلقة',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.group),
                    iconColor: Color(0xFFEAD67F),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Color(0xFFEAD67F)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(
                              0xFFEAD67F)), // hover border color// cursor to use when hovering
                    ),
                    labelText: 'كلمة المرور',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.lock),
                    iconColor: Color(0xFFEAD67F),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24.0),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFFEAD67F),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize: const Size(double.infinity, 0.0),
                  ),
                  onPressed: () {
                    // Handle sign in button pressed
                  },
                  child: const Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      color: Color(0xFF142E2B),
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
