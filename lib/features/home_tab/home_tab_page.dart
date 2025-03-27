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
              CustomAppBar(),
              
              Container(
                child: Image.asset("assets/home_tab_assets/home_backgroung.png"),
              ),

              SizedBox(height: 20,),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  itemCount: 4,
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return categoryListWidget();
                    }
                ),
              ),
              SizedBox(height: 20,),
              bookListItemWidget(),
              SizedBox(height: 20,),
              bookListItemWidget(),
              SizedBox(height: 10,),
              Center(child: subscriptionBanner()),
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomAppBar()=>Container(
    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            onTap: (){
              showSearchBottomSheet(context);
            },
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.white54),
              filled: true,
              fillColor: Colors.grey[900],
              prefixIcon: Icon(Icons.search, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(width: 5,),
        CircleAvatar(
          maxRadius: 25,
          child: Icon(Icons.person),
        ),
        SizedBox(width: 5,),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: BoxShape.circle
          ),
          child: Center(child: Icon(Icons.language_outlined,size: 30,)),
        )
      ],
    ),
  );

  Widget categoryListWidget()=>IntrinsicWidth(
    child: Container(
    margin: EdgeInsets.only(right: 20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          // Background Container
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
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
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 10,),
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
    
    
        ],
      ),
    ),
  );

  Widget bookListItemWidget()=>Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        Row(
          children: [
            Text("Popular",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
            Spacer(),
            Text("Show all",style: TextStyle(fontSize: 15,color: Colors.white),),
            SizedBox(width: 4,),
            Icon(Icons.arrow_circle_right,color: Colors.white,)
          ],
        ),
        SizedBox(height: 10,),
        SizedBox(
          height: 230,
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.45,
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return bookItemWidget();
            },
          ),
        )
      ],
    ),
  );

  Widget bookItemWidget()=> Container(
    width: 140,
    decoration: BoxDecoration(
      color: Colors.black,
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

  Widget subscriptionBanner() => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Get unlimited access to books", style: TextStyle(color: Colors.white)),
          SizedBox(height: 10),
          Text("Only \$9.99 per month", style: TextStyle(color: Colors.green)),
        ],
      ),
    ),
  );

  /// Extracted Image Widget to Reuse
  Widget bookImageWidget() => Container(
    height: 100,
    width: 30,
    child: Image.asset(
      "assets/home_tab_assets/book_cover.png",
      fit: BoxFit.cover,
    ),
  );


  void showSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      isScrollControlled: true,
      builder: (context) {
        return Container(
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
      },
    );
  }

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

