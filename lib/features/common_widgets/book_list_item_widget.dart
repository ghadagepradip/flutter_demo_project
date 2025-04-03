import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookListItemWidget extends StatelessWidget {
  const BookListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 30.w,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              "assets/home_tab_assets/book_cover.png",
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "The good guy",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Mark mcallister",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white60,
              ),
            ),
          ),

          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(Icons.headphones, size: 16, color: Colors.white54),
                SizedBox(width: 4),
                Text("5m", style: TextStyle(color: Colors.white54, fontSize: 12)),
                SizedBox(width: 10),
                Icon(Icons.timeline_rounded, size: 16, color: Colors.white54),
                SizedBox(width: 4),
                Text("8m", style: TextStyle(color: Colors.white54, fontSize: 12)),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
