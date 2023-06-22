import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/category_grid.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/category_home.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/home_search.dart';
import 'package:http/http.dart';
import 'package:iconsax/iconsax.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({
    super.key,
    required this.categories,
    required this.initialIndex,
  });
  final List<String> categories;
  final int initialIndex;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final TextEditingController textcontrolller = TextEditingController();
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: widget.initialIndex,
        child: Scaffold(
            appBar: AppBar(
              leading: const Icon(
                Iconsax.back_square,
                color: kggreencolor,
              ),
              title: Text(
                'Categories',
                style: mainHead.copyWith(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(children: [
                HomeSearch(searchController: textcontrolller),
                khight,
                SizedBox(
                  height: 50,
                  child: AppBar(
                    backgroundColor: Colors.white10,
                    elevation: 0,
                    bottom: TabBar(
                      indicatorColor: kggreencolor,
                      labelColor: Colors.black,
                      unselectedLabelColor: kgreycolor,
                      tabs: [
                        Tab(
                          text: 'All items',
                        ),
                        Tab(
                          text: 'Popular',
                        ),
                        Tab(
                          text: 'Best Deals',
                        ),
                      ],
                    ),
                  ),
                ),
                khight,

                // create widgets for each tab bar here
                Expanded(
                  child: TabBarView(
                    children: [
                      // first tab bar view widget
                      Container(
                        child: Center(
                            child: GridView.builder(
                          itemCount: widget.categories.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2 / 2.1,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) => Container(
                            decoration: kboxStyle,
                            child: CategoryGrid(
                                categories: widget.categories, index: index),
                          ),
                        )),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            '2',
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            '3',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }
}
