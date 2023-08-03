import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/category_grid.dart';
import 'package:food_delivery_app/presentation/pages/home/widgets/category_list.dart';
import 'package:provider/provider.dart';

import '../../../../controller/category_controller.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CategoryController>();
    return SizedBox(
      height: 100,
      child: FutureBuilder(
          future: controller.getAllCategory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching data'));
            } else {
              return ListView.separated(
                  itemCount: controller.categoriesData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final datas = controller.categoriesData;
                    return SizedBox(
                      width: 90,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryList(),
                              ));
                        },
                        child: CategoryGrid(
                          categories: datas,
                          index: index,
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
