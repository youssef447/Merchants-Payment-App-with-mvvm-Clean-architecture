import 'package:flutter/material.dart';
import 'package:payment_application_1/core/utils/constants.dart';
import 'package:payment_application_1/Presentation/widgets/merchantsProductsList.dart';
import 'package:payment_application_1/Presentation/widgets/myProductsList.dart';

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
          TabBar(
            controller: _controller,
            dividerColor: Colors.transparent,
            labelPadding: const EdgeInsets.symmetric(horizontal: 25),
            //isScrollable: false,
            tabAlignment: TabAlignment.center,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            splashBorderRadius: BorderRadius.circular(
                25), //when u click on tab there is a shape
            padding: const EdgeInsets.all(10),
            labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          
            indicator: const BoxDecoration(
              color: defaultColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20,
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
          Expanded(
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _controller,
              children: const [
                MerchantsProductsList(),
                MyProductsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
