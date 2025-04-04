import 'package:demo_project/features/login_pages/otp_page.dart';
import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/home_tab_assets/bg.png",width: 100.w,),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6.w,),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Log in",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w500),),
                    ),
                    IntrinsicHeight(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF2E2E2E).withAlpha(190),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 3.h,vertical: 3.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
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
                              ),
                              SizedBox(height: 15),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  minimumSize: Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                  )
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage()));
                                },
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
                              _socialLoginButton(
                                  icon: Icons.facebook, text: "Login with Facebook",color: Colors.blueAccent),
                              _socialLoginButton(
                                  icon: Icons.g_mobiledata, text: "Login with Google",color: Colors.red),
                              _socialLoginButton(icon: Icons.apple, text: "Login with Apple",color: Colors.black),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    Text("By continuing, you accept our Privacy Policy and T&C",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialLoginButton({required IconData icon, required String text,required Color color}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5)
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(width: 2.w,),
          Icon(icon, color: color,size: 35,),
          Spacer(),
          Text(text),
          Spacer(),
        ],
      ),
    );
  }
}

