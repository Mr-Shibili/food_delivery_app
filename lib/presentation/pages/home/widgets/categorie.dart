import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/catebory_model.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/category_grid.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/home_search.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../controller/category_controller.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({
    super.key,
    required this.initialIndex,
  });

  final int initialIndex;

  final TextEditingController textcontrolller = TextEditingController();

  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CategoryController>();
    return DefaultTabController(
        length: 3,
        initialIndex: initialIndex,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Iconsax.back_square,
                  color: kggreencolor,
                ),
              ),
              title: initialIndex == 1
                  ? Text(
                      'Popular Foods',
                      style: mainHead.copyWith(color: Colors.black),
                    )
                  : Text(
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
                    bottom: const TabBar(
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
                            child: FutureBuilder(
                                future: controller.getAllCategory(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                        child: Text('Error fetching data'));
                                  } else {
                                    return GridView.builder(
                                      itemCount:
                                          controller.categoriesData.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              childAspectRatio: 2 / 2.1,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10),
                                      itemBuilder: (context, index) =>
                                          Container(
                                        decoration: kboxStyle,
                                        child: CategoryGrid(
                                            categories:
                                                controller.categoriesData,
                                            index: index),
                                      ),
                                    );
                                  }
                                })),
                      ),
                      Container(
                        child: const Center(
                          child: Text(
                            '2',
                          ),
                        ),
                      ),
                      Container(
                        child: const Center(
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
