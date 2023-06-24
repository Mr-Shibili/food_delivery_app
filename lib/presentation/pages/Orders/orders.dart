import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/pages/constants/constants.dart';
import 'package:iconsax/iconsax.dart';

class OrdersPage extends StatefulWidget {
  OrdersPage({
    super.key,
  });
  final List<String> orders = ['order 1', 'order 2', 'order 3', 'orde 4'];

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final TextEditingController textcontrolller = TextEditingController();
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              leading: const Icon(
                Iconsax.back_square,
                color: kggreencolor,
              ),
              title: Text(
                'Orders',
                style: mainHead.copyWith(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white10,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(children: [
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
                          text: 'Active',
                        ),
                        Tab(
                          text: 'Completed',
                        ),
                        Tab(
                          text: ' Cancelled',
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
                      ListView.separated(
                        separatorBuilder: (context, index) => khight,
                        shrinkWrap: true,
                        itemCount: widget.orders.length,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 145,
                              decoration: kboxStyle1,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Image(
                                            height: 80,
                                            image: AssetImage(
                                                'asset/images/food-home-nanoosh-20.png')),
                                        kwidth,
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Special Sandwitch',
                                                style: mediumHead,
                                              ),
                                              const Text('3 items | 2.4km'),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  const Text(
                                                    '₹ 200',
                                                    style: mediumHead,
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                    width: 60,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          padding:
                                                              MaterialStateProperty
                                                                  .all(const EdgeInsets
                                                                      .all(0)),
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .green),
                                                        ),
                                                        onPressed: () {},
                                                        child: const Text(
                                                          'Paid',
                                                          style: smallHead,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 25,
                                          width: 100,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                                side: MaterialStateProperty.all(
                                                  const BorderSide(
                                                    color: kggreencolor,
                                                    width: 2,
                                                  ),
                                                ),
                                                padding:
                                                    MaterialStateProperty.all(
                                                        const EdgeInsets.all(0)),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                'Leave a review',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                              )),
                                        ),
                                        SizedBox(
                                          height: 25,
                                          width: 100,
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.green),
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                'Track Driver',
                                                style: smallTextBlack,
                                              )),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        },
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
