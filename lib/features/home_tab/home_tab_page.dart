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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBarWidget(
                onTapCallBack: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchResultPage()));
                },
                isEnabled: true,
              ),
              
              Image.asset("assets/home_tab_assets/home_backgroung.png"),

              SizedBox(height: 20,),
              SizedBox(
                height: 188,
                child: ListView.builder(
                  itemCount: 4,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return BookCategoryItemWidget();
                    }
                ),
              ),
              SizedBox(height: 20,),
              bookListItemWidget(),
              SizedBox(height: 20,),
              bookListItemWidget(),
              SizedBox(height: 10,),
              subscriptionBanner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bookListItemWidget()=>Column(
    children: [
      InkWell(
        onTap: (){

        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            children: [
              Text("Popular",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w400),),
              Spacer(),
              Text("Show all",style: TextStyle(fontSize: 15,color: Colors.white),),
              SizedBox(width: 4,),
              Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,)
            ],
          ),
        ),
      ),
      SizedBox(height: 10,),
      SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 6),
              child: BookListItemWidget(),
            );
          },
        ),
      )

    ],
  );

  Widget subscriptionBanner() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
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
            Text("Get unlimited access to\nbooks in just", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary,fontSize: 19,fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            Text("\$9.99", style: TextStyle(color: Colors.green.shade200,fontSize: 30,fontWeight: FontWeight.w600)),
            SizedBox(height: 20),
          ],
        ),
        Positioned(
          right: 0,
            bottom: 0,
            child: bookImageWidget())
      ],
    ),
  );

  Widget bookImageWidget() => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    spacing: 4,
    children: [
      SizedBox(
        height: 50,
        width: 45,
        child: Image.asset(
          "assets/home_tab_assets/book_cover.png",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        height: 60,
        width: 55,
        child: Image.asset(
          "assets/home_tab_assets/book_cover.png",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(
        height: 70,
        width: 60,
        child: Image.asset(
          "assets/home_tab_assets/book_cover.png",
          fit: BoxFit.cover,
        ),
      ),
    ],
  );

}

