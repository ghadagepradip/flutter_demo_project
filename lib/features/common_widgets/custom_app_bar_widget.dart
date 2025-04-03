import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget {
  final VoidCallback? onTapCallBack;
  final bool? isEnabled;
  final bool? autofocus;
  const CustomAppBarWidget({super.key,this.onTapCallBack, this.isEnabled, this.autofocus});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onTap:onTapCallBack,
              autofocus: autofocus??false,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                isDense: true,
                fillColor: Colors.grey[900],
                prefixIcon: Icon(Icons.search, color: Colors.white),
                enabled: isEnabled??true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 8,),
          CircleAvatar(
            maxRadius: 23,
            child: Image.asset("assets/home_tab_assets/profile_pic.png"),
          ),
          SizedBox(width: 8,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer.withAlpha(30),
                shape: BoxShape.circle,
            ),
            child: Center(child: Image.asset("assets/icons/language_icon.png",width: 27,)),
          )
        ],
      ),
    );
  }
}
