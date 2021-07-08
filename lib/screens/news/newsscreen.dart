import 'package:doors_tour_app/constants/constants.dart';
import 'package:doors_tour_app/models/news.dart';
import 'package:doors_tour_app/services/newsService.dart';
import 'package:doors_tour_app/widgets/appStreamBuilder.dart';
import 'package:doors_tour_app/widgets/bottom_navigator.dart';
import 'package:doors_tour_app/widgets/newsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  int currentTab = 0, topListViewIndex = 0;
  ScrollController _scrollController = ScrollController();
  List<Map<dynamic, dynamic>> homePageTopListView = [
    {"text": "Invest Right,\nEarn Right.", "image": "assets/images/pig.png"},
    {"text": "Invest Right,\nEarn Right.", "image": "assets/images/pig.png"},
    {"text": "Invest Right,\nEarn Right.", "image": "assets/images/pig.png"},
    {"text": "Invest Right,\nEarn Right.", "image": "assets/images/pig.png"},
  ];

  Stream<List<NewsModel>> _getStream() {
    switch (currentTab) {
      case 0:
        return NewsServices().allNews().asStream();
      case 1:
        return NewsServices().globalNews().asStream();
      case 2:
        return NewsServices().reitNews().asStream();
      case 3:
        return NewsServices().invitNews().asStream();
      case 4:
        return NewsServices().financeNews().asStream();
      default:
        return Stream.empty();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<countmodel>(
      create: (context) => countmodel(),
      child: Builder(builder: (context) {
        Widget buildDot(int index) {
          return Consumer<countmodel>(builder: (context, data, child) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                index == data.countervalvalue()
                    ? Container()
                    : Container(
                        margin: EdgeInsets.all(3),
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                Container(
                  margin: index == data.countervalvalue()
                      ? EdgeInsets.all(2)
                      : EdgeInsets.all(4),
                  height: index == data.countervalvalue() ? 10 : 6,
                  width: index == data.countervalvalue() ? 10 : 6,
                  decoration: BoxDecoration(
                    color: data.countervalvalue() == index
                        ? Constants.kPrimaryColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            );
          });
        }

        Container topListView(int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(left: 30),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          homePageTopListView[topListViewIndex]["text"],
                          style: TextStyle(
                              fontSize: 20,
                              color: Constants.kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Image.asset(homePageTopListView[index]["image"]),
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 20),
                )
              ],
            ),
          );
        }

        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                Consumer<countmodel>(builder: (context, data1, child) {
                  return SliverAppBar(
                    automaticallyImplyLeading: false,
                    floating: false,
                    pinned: true,
                    snap: false,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      background: Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    icon: Icon(Icons.arrow_back),
                                    color: Colors.white,
                                    iconSize: 30,
                                    onPressed: () {}),
                                Text(
                                  "NEWS",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child:
                                      Image.asset("assets/images/person.png"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 0.25 * MediaQuery.of(context).size.height,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    itemCount: homePageTopListView.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 3,
                                          bottom: 5),
                                      child: topListView(index),
                                    ),
                                    onPageChanged: (value) =>
                                        {data1.increament(value)},
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [0, 1, 2, 3]
                                            .map((e) => buildDot(e))
                                            .toList()),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    expandedHeight: 0.35 * MediaQuery.of(context).size.height,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: Constants.kPrimaryColor,
                  );
                }),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: CategoryTabs(
                    initalTab: currentTab,
                    onTabChanged: (tab) {
                      setState(() {
                        currentTab = tab;
                      });
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: StrmBldr<List<NewsModel>>(
                      stream: _getStream(),
                      builder: (context, snapshot) {
                        return Container(
                          child: Column(
                            children: List.generate(
                              snapshot?.length ?? 0,
                              (index) => NewsCard(news: snapshot![index]),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigator(index: 3),
        );
      }),
    );
  }
}

class CategoryTabs implements SliverPersistentHeaderDelegate {
  int initalTab;
  Function(int tab) onTabChanged;
  CategoryTabs({required this.initalTab, required this.onTabChanged});

  late int currentTab = initalTab;

  Widget rowbars(int index, String text) {
    return InkWell(
      onTap: () {
        currentTab = index;
        onTabChanged(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: index == currentTab
              ? Constants.kPrimaryColor
              : Color(0xff3F4442).withOpacity(0.73),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "$text",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: {
            0: "All",
            1: "Global",
            2: "REITs",
            3: "INVITs",
            4: "Finance",
          }.entries.map<Widget>((e) => rowbars(e.key, e.value)).toList()),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
