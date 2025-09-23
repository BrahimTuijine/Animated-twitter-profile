import 'dart:math';

import 'package:flutter/material.dart';

class WhatsappProfilePage extends StatelessWidget {
  const WhatsappProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(delegate: WhatsappAppBar(), pinned: true),
          ],
        ),
      ),
    );
  }
}

class WhatsappAppBar extends SliverPersistentHeaderDelegate {
  final appBarColorTween = ColorTween(
    begin: Colors.white,
    end: const Color.fromARGB(255, 4, 94, 84),
  );

  final appBackIconsColorTween = ColorTween(
    begin: Colors.grey[800],
    end: Colors.white,
  );

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final relativeScroll = min(shrinkOffset, 45) / 45;
    // print(shrinkOffset);
    // print('-' * 10);
    // print(relativeScroll);
    return SizedBox.expand(
      child: Container(
        color: appBarColorTween.transform(relativeScroll),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new),
                color: appBackIconsColorTween.transform(relativeScroll),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
                color: appBackIconsColorTween.transform(relativeScroll),
              ),
            ),
            Positioned(top: 15, left: 90, child: Text('+33 333333333333')),
          ],
        ),
      ),
    );
  }

  // Widget displayPhoneNumber(double relativeFullScrollOffset) {
  //   if (relativeFullScrollOffset >= 0.8) {
  //     return Transform(
  //       transform: Matrix4.identity()
  //         ..translate(
  //           0.0,
  //           phoneNumberTranslateTween.transform(
  //             (relativeFullScrollOffset - 0.8) * 5,
  //           ),
  //         ),
  //       child: Text(
  //         "+3 3333333333",
  //         style: TextStyle(
  //           fontSize: phoneNumberFontSizeTween.transform(
  //             (relativeFullScrollOffset - 0.8) * 5,
  //           ),
  //           color: Colors.white,
  //           fontWeight: FontWeight.w500,
  //         ),
  //       ),
  //     );
  //   }

  //   return const SizedBox.shrink();
  // }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
