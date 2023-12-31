import 'package:flutter/material.dart';
import 'package:payment_application_1/Data/models/Order%20Registration%20API/response/OrderApiResponse.dart';
import 'package:payment_application_1/Presentation/widgets/defaultCachedImage.dart';
import 'package:payment_application_1/Presentation/widgets/defaultContainer.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../core/utils/globales.dart';
import '../../core/utils/sharedAssets.dart';

class OrderScreen extends StatefulWidget {
  final OrderApiResponse order;
  const OrderScreen(this.order, {super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double offset = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: OrientationBuilder(
          builder: (context, orientation) => Column(
            children: [
              widget.order.imgsUrl.isEmpty
                  ? SizedBox(
                      height: height * 0.3,
                      //width: double.infinity,
                      child: Hero(
                        tag: 'orderasset',
                        child: Image.asset(ImageAssets.camera),
                      ),
                    )
                  : widget.order.imgsUrl.length == 1
                      ? SizedBox(
                          height: height * 0.3,
                          //width: constraints.maxWidth,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.order.imgsUrl.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: height * 0.3,
                                  width: width,
                                  child: Hero(
                                    tag: 'order1',
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25)),
                                      child: DefaultCachedImage(
                                        imgUrl: widget.order.imgsUrl[index],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : SizedBox(
                          height: height * 0.4,
                          width: width,
                          child: Stack(
                            children: [
                              ListView.builder(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.order.imgsUrl.length,
                                itemBuilder: (context, index) {
                                  return VisibilityDetector(
                                    key: Key(index.toString()),
                                    onVisibilityChanged: (info) {
                                      if (info.visibleFraction == 1) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      }
                                    },
                                    child: SizedBox(
                                      height: height * 0.4,
                                      width: width,
                                      child: Hero(
                                        tag: 'order$index',
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              bottomRight: Radius.circular(25),
                                              bottomLeft: Radius.circular(25)),
                                          child: DefaultCachedImage(
                                            imgUrl: widget.order.imgsUrl[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              _currentIndex == 0
                                  ? const SizedBox()
                                  : Positioned(
                                      top: height * 0.4 * 0.4,
                                      right: width - 60,
                                      child: IconButton(
                                        onPressed: () {
                                          _scrollController.animateTo(
                                              offset -= width,
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              curve: Curves.easeIn);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios_outlined,
                                        ),
                                      ),
                                    ),
                              Positioned(
                                left: width - 60,
                                top: height * 0.4 * 0.4,
                                child: IconButton(
                                  onPressed: () {
                                    _scrollController.animateTo(offset += width,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeIn);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
              Expanded(
                child: DefaultContainer(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Hero(
                          tag: 'title',
                          child: Text(
                            widget.order.item[0].name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Hero(
                          tag: 'description',
                          child: Text(
                            widget.order.item[0].description ?? '',
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                               ,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
