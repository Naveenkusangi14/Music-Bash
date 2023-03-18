import 'package:flutter/material.dart';
import 'package:spotify/views/search/widgets.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor:   Colors.deepPurple.shade700.withOpacity(0.8),
        body: CustomScrollView(
          
          slivers: [
            // Search text
            const SliverAppBar(
              toolbarHeight: 80,
              backgroundColor: Colors.transparent,
              pinned: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 20),
                child: Text(
                  "Search",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      fontFamily: "Raleway",
                      fontStyle: FontStyle.normal,
                      fontSize: 32.0),
                ),
              ),
            ),
            // search-text-field
            SliverAppBar(
              backgroundColor:  Colors.transparent,
              expandedHeight: 56,
              floating: true,
              pinned: true,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                centerTitle: true,
                titlePadding: EdgeInsets.symmetric(vertical: 5),
                title: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child:  TextField(
                    style:const TextStyle(
                        color: Color(0xff747474),
                        fontWeight: FontWeight.w700,
                        fontFamily: "Raleway",
                        fontStyle: FontStyle.normal,
                        fontSize: 13.0),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          onPressed: (){},
                        icon: const Icon(Icons.search),
                        ),
                        contentPadding: EdgeInsets.only(top: 15),
                        hintText: 'Artist, Song, Album or podcast'),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 18, left: 16, right: 16, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   
                           SearchSectionItemBuilder(
                            list: categories,
                          )
                        
                    // SectionBuilder(
                    //     sectionTitle: 'Browse All',
                    //     padding: EdgeInsets.zero,
                    //     titlePadding: const EdgeInsets.only(bottom: 10),
                    //     sectionBodyBuilder: (context) {
                    //       return SearchSectionItemBuilder(
                    //         list: kAllSearh,
                    //       );
                    //     }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchSectionItemBuilder extends StatelessWidget {
  const SearchSectionItemBuilder({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ignore: division_optimization
      height: 120 * ((list.length / 2).toInt()).toDouble(),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.8,
              crossAxisSpacing: 8,
              mainAxisSpacing: 11),
          itemCount: list.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              decoration: BoxDecoration(
                color: list[index].color,
                borderRadius: const BorderRadius.all(Radius.circular(4)),
              ),
              child: Stack(
                children: [
                  // img
                  Positioned(
                    right: -15,
                    bottom: -10,
                    child: RotationTransition(
                      turns: const AlwaysStoppedAnimation(25 / 360),
                      child: Container(
                        width: 83,
                        height: 83,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(list[index].img),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4)),
                        ),
                      ),
                    ),
                  ),
                  // text
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 11),
                    child: Text(list[index].title,
                        style: const TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Raleway",
                            fontStyle: FontStyle.normal,
                            fontSize: 13.0),
                        textAlign: TextAlign.left),
                  ),
                ],
              ),
            );
          }),
    );
  }
}