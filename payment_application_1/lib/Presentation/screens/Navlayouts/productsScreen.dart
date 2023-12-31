import 'package:flutter/material.dart';
import 'package:payment_application_1/core/utils/globales.dart';
import 'package:payment_application_1/Presentation/screens/Navlayouts/othersProductsList.dart';
import 'package:payment_application_1/Presentation/screens/Navlayouts/myProductsList.dart';

import '../../../core/utils/appColors.dart';

class Myproducts extends StatefulWidget {
  const Myproducts({super.key});

  @override
  State<Myproducts> createState() => _MyproductsState();
}

class _MyproductsState extends State<Myproducts> with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState

    _controller = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Products",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black),
        ),
      ),
      body: // const NoProductsScreen(),
          Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.landscape
                ? width * 0.05
                : height * 0.05,
            child: TabBar(
              controller: _controller,

              dividerColor: Colors.transparent,
              // labelPadding: const EdgeInsets.symmetric(horizontal: 25),
              //isScrollable: false,
              tabAlignment: TabAlignment.center,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[400],
              /*  splashBorderRadius: BorderRadius.circular(
                  25), */ //when u click on tab there is a shape
              // padding: const EdgeInsets.all(120),
              splashFactory: NoSplash.splashFactory,
              labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),

              indicator: const BoxDecoration(
                color: AppColors.defaultColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    25,
                  ),
                ),
              ),
              tabs: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Tab(
                    icon: Text('Merchants'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Tab(
                    text: "my products",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _controller,
              children: const [
                OthersProductsList(),
                MyProductsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
