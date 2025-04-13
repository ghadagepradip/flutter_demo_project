import 'package:demo_project/features/home_tab/bottom_navigation_page.dart';
import 'package:demo_project/features/login_pages/language_selection_page.dart';
import 'package:demo_project/features/widgets/custom_filled_button.dart';
import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({super.key, this.phoneNumber = "+91 765432189"}); // can be passed from previous screen

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/home_tab_assets/bg.png", width: 100.w, fit: BoxFit.cover),

          _buildBackButton(),

          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(),
                  _buildOtpInputBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 6.h),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 15),
              SizedBox(width: 20),
              Text("Back to Log in", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w,),
      child: Row(
        children: [
          Text("OTP sent to ${widget.phoneNumber}",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text("Edit", style: TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpInputBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 3.h, vertical: 3.h),
      decoration: BoxDecoration(
        color: const Color(0xFF2E2E2E).withAlpha(190),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          TextField(
            controller: _otpController,
            maxLength: 4,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[800],
              hintText: "Enter 4-digit OTP",
              hintStyle: const TextStyle(color: Colors.grey),
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 15),
          CustomFilledButton(
            title: isLoading ? "Please wait..." : "Submit OTP",
            callBack: isLoading ? (){} : _submitOtp,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don’t receive a code? ", style: TextStyle(color: Colors.white)),
              GestureDetector(
                onTap: _resendOtp,
                child: const Text("Resend", style: TextStyle(color: Colors.red)),
              ),
              const Icon(Icons.keyboard_return, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  void _submitOtp() async {
    final otp = _otpController.text.trim();

    if (otp.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid 4-digit OTP"),backgroundColor: Colors.red,),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      await Future.delayed(Duration(seconds: 1));

      // On success
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LanguageSelectionPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("OTP verification failed")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _resendOtp() async {
    // TODO: Trigger resend OTP API here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("OTP resent")),
    );
  }

}
