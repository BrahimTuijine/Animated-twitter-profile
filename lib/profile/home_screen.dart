import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5263EF),
        leading: Container(
          margin: EdgeInsets.only(left: 8),
          height: 56,
          width: 56,
          decoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
        ),
        title: Column(
          spacing: 5,
          children: [
            Text(
              'Hi, Bilel !',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: Colors.white),
            ),
            Text(
              'Rue adresse, Localisation',
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.copyWith(color: Colors.white),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 25),
            height: 45,
            width: 45,
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(delegate: HomeAppBar(), pinned: false),
        ],
      ),
    );
  }
}

class HomeAppBar extends SliverPersistentHeaderDelegate {
  final scalePointsInfoWidget = Tween<double>(begin: 1, end: 0.5);

  final opacityPointsInfoWidget = Tween<double>(begin: 1, end: 0);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final relativeScroll = min(shrinkOffset, 40) / 40;
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: maxExtent,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xff5263EF),
            // borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(20),
            //   bottomRight: Radius.circular(20),
            // ),
          ),
        ),
        Positioned(
          bottom: 91 / 2 * -1,
          child: Transform.scale(
            scale: scalePointsInfoWidget.transform(relativeScroll),
            child: Opacity(
              // opacity: opacityPointsInfoWidget.transform(relativeScroll),
              opacity: 1,
              child: Card(
                child: Container(
                  height: 91,
                  width: 326,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Home Screen',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 10;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
