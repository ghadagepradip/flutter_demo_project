import 'package:demo_project/features/home_tab/bottom_navigation_page.dart';
import 'package:demo_project/features/widgets/custom_filled_button.dart';
import 'package:demo_project/utils/common_snackbar.dart';
import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  final List<Map<String, dynamic>> _languages = [
    {"title": "Hindi\nBooks", "color": Colors.green},
    {"title": "Marathi\nBooks", "color": Colors.purple},
    {"title": "English\nBooks", "color": Colors.red},
    {"title": "Gujarati\nBooks", "color": Colors.orange},
  ];

  int? _selectedLanguageIndex;
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Language Selection",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  SizedBox(
                    height: 50.h,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: _languages.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.w,
                        mainAxisSpacing: 2.h,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        final lang = _languages[index];
                        final isSelected = _selectedLanguageIndex == index;
                        return _buildLanguageItem(index, lang['title'], lang['color'], isSelected);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: CustomFilledButton(
                title: _isLoading ? "Please wait..." : "Continue",
                // isDisabled: _selectedLanguageIndex == null || _isLoading,
                callBack: _onContinuePressed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(int index, String title, Color color, bool isSelected) {
    return GestureDetector(
      onTap: () => _selectLanguage(index),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -15,
              bottom: -25,
              child: Transform.rotate(
                angle: 0.5,
                child: Image.asset(
                  "assets/home_tab_assets/book_cover.png",
                  height: 130,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onContinuePressed() async {
    if (_selectedLanguageIndex == null) {
      SnackBarUtil.show(context,"Please select a language", backgroundColor: Colors.red);
      return;
    }

    setState(() => _isLoading = true);

    // TODO: Replace this with your actual API call to save the selected language
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const BottomNavigationPage()),
    );
  }

  void _selectLanguage(int index) {
    setState(() {
      _selectedLanguageIndex = index;
    });
  }

}
