import 'package:flutter/material.dart';
import 'package:payment_application_1/constants.dart';
import 'package:payment_application_1/views/Navlayouts/merchantsProductsList.dart';
import 'package:payment_application_1/views/Navlayouts/myProductsList.dart';

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
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: // const NoProductsScreen(),
          Column(
        children: [
          TabBar(
            controller: _controller,
            labelPadding: const EdgeInsets.symmetric(horizontal: 25),

            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[400],
            splashBorderRadius: BorderRadius.circular(
                50), //when u click on tab there is a shape
            padding: const EdgeInsets.all(8),
            labelStyle: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),

            indicator: const BoxDecoration(
              color: defaultColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            tabs: const [
              Tab(
                text: "Merchants",
              ),
              Tab(
                text: "my products",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
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
