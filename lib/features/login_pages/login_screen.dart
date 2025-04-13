import 'package:demo_project/features/login_pages/otp_page.dart';
import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/home_tab_assets/bg.png", width: 100.w, fit: BoxFit.cover),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Log in",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    IntrinsicHeight(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF2E2E2E).withAlpha(190),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.h),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[800],
                                  hintText: "Enter Mobile Number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.phone,
                                maxLength: 10,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter mobile number";
                                  } else if (!RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                                    return "Enter a valid mobile number";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              _isLoading
                                  ? CircularProgressIndicator(color: Colors.white)
                                  : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize: Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                onPressed: _sendOtp,
                                child: Text("Send OTP"),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(child: Divider(color: Colors.grey)),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text("Or", style: TextStyle(color: Colors.grey)),
                                  ),
                                  Expanded(child: Divider(color: Colors.grey)),
                                ],
                              ),
                              SizedBox(height: 15),
                              _socialLoginButton(icon: Icons.facebook, text: "Login with Facebook", color: Colors.blueAccent),
                              _socialLoginButton(icon: Icons.g_mobiledata, text: "Login with Google", color: Colors.red),
                              _socialLoginButton(icon: Icons.apple, text: "Login with Apple", color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "By continuing, you accept our Privacy Policy and T&C",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialLoginButton({required IconData icon, required String text, required Color color}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 2.w),
          Icon(icon, color: color, size: 30),
          Spacer(),
          Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
          Spacer(),
        ],
      ),
    );
  }

  Future<bool> fakeOtpApiCall(String phone) async {

    return Future.value(true);
  }

  void _sendOtp() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      await Future.delayed(Duration(seconds: 2));

      // TODO: Replace this with your actual API call to save the selected language

      bool success = await fakeOtpApiCall(_phoneController.text);

      setState(() => _isLoading = false);

      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OtpPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to send OTP. Try again.")),
        );
      }
    }
  }


}
