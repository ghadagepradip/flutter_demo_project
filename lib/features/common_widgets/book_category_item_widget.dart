import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/material.dart';

class BookCategoryItemWidget extends StatelessWidget {
  const BookCategoryItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      margin: EdgeInsets.only(right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.blueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(
              "Historical Literature",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20,),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  color: Colors.white,
                  // width: 120,
                  height: 70,
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/home_tab_assets/book_cover.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
