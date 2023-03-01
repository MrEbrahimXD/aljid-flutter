import 'package:aljid/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aljid/Utilities/SizeConfig.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _centerNameController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _halaqahController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String dropdownValue = 'المعلمة هبه حسن';

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      backgroundColor: const Color(0xFF142E2B),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultSize * 2.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: defaultSize * 35,
                  child: Image.asset(
                    'lib/Assets/s.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: defaultSize * 2),
                TextField(
                  controller: _centerNameController,
                  decoration: InputDecoration(
                    labelText: 'اسم المركز',
                    labelStyle: TextStyle(color: Color(0xFFEAD67F)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEAD67F)),
                    ),
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.business_center, color: Color(0xFFEAD67F)),
                  ),
                  style: TextStyle(
                    color: itemsInThemeColor,
                  ),
                ),
                SizedBox(height: defaultSize * 2),
                TextField(
                  controller: _studentNameController,
                  decoration: InputDecoration(
                    labelText: 'اسم الطالبة',
                    labelStyle: TextStyle(color: Color(0xFFEAD67F)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEAD67F)),
                    ),
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person, color: Color(0xFFEAD67F)),
                  ),
                  style: TextStyle(
                    color: itemsInThemeColor,
                  ),
                ),
                SizedBox(height: defaultSize * 2),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: 'الحلقة',
                    labelStyle: TextStyle(color: Color(0xFFEAD67F)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEAD67F)),
                    ),
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.group, color: Color(0xFFEAD67F)),
                  ),
                  dropdownColor: itemsInThemeColor,
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'المعلمة هبه حسن',
                    'المعلمة هبة يحيى',
                    'المعلمة غفران محمد'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: defaultSize * 2),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'رقم الهاتف',
                    labelStyle: TextStyle(color: Color(0xFFEAD67F)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEAD67F)),
                    ),
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.phone, color: Color(0xFFEAD67F)),
                  ),
                  style: TextStyle(
                    color: itemsInThemeColor,
                  ),
                ),
                SizedBox(height: defaultSize * 2),
                SizedBox(height: defaultSize * 3),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFFEAD67F),
                    padding: EdgeInsets.symmetric(vertical: defaultSize * 1.7),
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
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  // onPressed: () async {
                  //   setState(() {
                  //     _isLoading = true;
                  //   });
                  //   // Create a new user with phone number authentication
                  //   await _auth.verifyPhoneNumber(
                  //     phoneNumber: '+971${_phoneController.text}',
                  //     verificationCompleted:
                  //         (PhoneAuthCredential credential) async {
                  //       await _auth.signInWithCredential(credential);
                  //     },
                  //     verificationFailed: (FirebaseAuthException e) {
                  //       if (e.code == 'invalid-phone-number') {
                  //         print('The provided phone number is not valid.');
                  //       }
                  //     },
                  //     codeSent:
                  //         (String verificationId, int? resendToken) async {
                  //       // Prompt the user to enter the verification code
                  //       String smsCode = '';
                  //       showDialog(
                  //         context: context,
                  //         builder: (context) => AlertDialog(
                  //           title: Text('أدخل رمز التحقق'),
                  //           content: TextField(
                  //             style: TextStyle(
                  //               color: themeColor,
                  //             ),
                  //             decoration: InputDecoration(
                  //               focusedBorder: OutlineInputBorder(
                  //                 borderSide: BorderSide(color: themeColor),
                  //               ),
                  //               border: OutlineInputBorder(),
                  //             ),
                  //             autofocus: true,
                  //             onChanged: (value) {
                  //               smsCode = value;
                  //             },
                  //           ),
                  //           backgroundColor: itemsInThemeColor,
                  //           icon: Icon(Icons.message),
                  //           surfaceTintColor: themeColor,
                  //           actions: [
                  //             TextButton(
                  //               onPressed: () async {
                  //                 // Sign in the user with the verification code
                  //                 PhoneAuthCredential credential =
                  //                     PhoneAuthProvider.credential(
                  //                   verificationId: verificationId,
                  //                   smsCode: smsCode,
                  //                 );
                  //                 await _auth.signInWithCredential(credential);

                  //                 // Save user data to Firestore
                  //                 await _firestore
                  //                     .collection('users')
                  //                     .doc(_auth.currentUser!.uid)
                  //                     .set({
                  //                   'centerName': _centerNameController.text,
                  //                   'studentName': _studentNameController.text,
                  //                   'halaqahName': dropdownValue,
                  //                   'phoneNumber':
                  //                       '+971${_phoneController.text}',
                  //                 });

                  //                 // Navigate to the home page
                  //                 Navigator.pushReplacementNamed(
                  //                     context, '/home');
                  //               },
                  //               child: Text(
                  //                 'حسنا',
                  //                 style: TextStyle(
                  //                   color: themeColor,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     },
                  //     codeAutoRetrievalTimeout: (String verificationId) {},
                  //   );
                  // },
                  child: _isLoading == false
                      ? const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            color: Color(0xFF142E2B),
                            fontSize: 23,
                          ),
                        )
                      : CircularProgressIndicator(color: themeColor),
                ),
                SizedBox(height: defaultSize * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle sign up button pressed
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: const Color(0xFFEAD67F),
                          fontSize: defaultSize * 2.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'لديك حساب بالفعل؟',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: defaultSize * 2.1,
                      ),
                    ),
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
