import 'package:demo_project/features/common_widgets/book_category_item_widget.dart';
import 'package:demo_project/features/common_widgets/book_list_item_widget.dart';
import 'package:demo_project/features/common_widgets/custom_app_bar_widget.dart';
import 'package:demo_project/features/home_tab/search_result_page.dart';
import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  void initState() {
    super.initState();
    // TODO: Implement API call here to fetch book categories and book lists
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarWidget(
                onTapCallBack: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SearchResultPage()),
                  );
                },
                isEnabled: true,
              ),

              Image.asset("assets/home_tab_assets/home_backgroung.png"),

              const SizedBox(height: 20),
              buildBookCategories(),
              const SizedBox(height: 20),
              buildBookSection(title: "Popular"),
              const SizedBox(height: 20),
              buildBookSection(title: "Recommended"),
              const SizedBox(height: 10),
              buildSubscriptionBanner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBookCategories() {
    return SizedBox(
      height: 188,
      child: ListView.builder(
        itemCount: 4, // Ideally, this should be fetched from API
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const BookCategoryItemWidget(),
      ),
    );
  }

  Widget buildBookSection({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: InkWell(
            onTap: () {
              // TODO: Navigate to category detail page or show all books
            },
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                const Text(
                  "Show all",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5, // Ideally fetched from API
            shrinkWrap: true,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(right: 6),
              child: BookListItemWidget(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSubscriptionBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Get unlimited access to\nbooks in just",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "\$9.99",
                style: TextStyle(
                  color: Colors.green.shade200,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: buildBookStackImage(),
          ),
        ],
      ),
    );
  }

  Widget buildBookStackImage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        buildBookImage(45, 50),
        buildBookImage(55, 60),
        buildBookImage(60, 70),
      ],
    );
  }

  Widget buildBookImage(double width, double height) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        "assets/home_tab_assets/book_cover.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
