import 'package:demo_project/features/common_widgets/custom_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBarWidget(autofocus: true,),
              searchBottomSheet(),
            ],
          ),
        ),
      )
    );
  }

  Widget searchBottomSheet()=> Container(
    padding: EdgeInsets.all(16),
    height: MediaQuery
        .of(context)
        .size
        .height * 0.85,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Top Searches", style: TextStyle(color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 3,
          children: [
            searchChip("Raaja Milindache Prashn"),
            searchChip("Aatmakendrit"),
            searchChip("Graamageeta"),
            searchChip("Aurangajeb : Kulakatha"),
          ],
        ),
        SizedBox(height: 20),
        Text("Genres", style: TextStyle(color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 3.5,
            children: [
              genreTile("assets/home_tab_assets/book_cover.png", "Ideological"),
              genreTile("assets/home_tab_assets/book_cover.png", "Progressive Literature"),
              genreTile("assets/home_tab_assets/book_cover.png", "Historical Literature"),
              genreTile("assets/home_tab_assets/book_cover.png", "Character Portraits"),
              genreTile("assets/home_tab_assets/book_cover.png", "Personality Development"),
              genreTile("assets/home_tab_assets/book_cover.png", "Biography"),
              genreTile("assets/home_tab_assets/book_cover.png", "Informative"),
              genreTile("assets/home_tab_assets/book_cover.png", "History"),
            ],
          ),
        ),
      ],
    ),
  );

  Widget searchChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget genreTile(String imagePath, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 50,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),

            ),
            child: Image.asset(imagePath,fit: BoxFit.cover,),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }


}
