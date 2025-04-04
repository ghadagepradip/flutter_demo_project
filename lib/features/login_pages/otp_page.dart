import 'package:demo_project/features/home_tab/bottom_navigation_page.dart';
import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [

          Image.asset("assets/home_tab_assets/bg.png",width: 100.w,),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.h,vertical: 3.h),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 15,),
                    SizedBox(width: 20,),
                    Text("Back to Log in",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
                      child: Row(
                        children: [
                          Text("OTP sent to +91 765432189",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                          Spacer(),
                          Text("Edit",style: TextStyle(color: Colors.red),)
                        ],
                      ),
                    ),
                  ),
                  IntrinsicHeight(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
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
                                hintText: "Enter 4 digit otp",
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
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationPage()));
                              },
                              child: Text("submit OTP"),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don’t receive a code? ",style: TextStyle(color: Colors.white),),
                                Text("Resend",style: TextStyle(color: Colors.red),),
                                Icon(Icons.keyboard_return,color: Colors.red,)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

