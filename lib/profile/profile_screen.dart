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
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    Text(
                      '50 611 513',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Brahim tuijine',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const WhatsappProfileBody(),
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

  final phoneNumberFontSizeTween = Tween<double>(begin: 20, end: 15);

  final phoneNumberTranslationTween = Tween<double>(begin: 80, end: 15);

  final profileLeftPositionTween = Tween<double>(begin: 160, end: 40);

  final profileTopPositionTween = Tween<double>(begin: 80, end: 4);

  final profileSizeTween = Tween<double>(begin: 3, end: 1);

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
            if (shrinkOffset > 16)
              Positioned(
                top: phoneNumberTranslationTween.transform(relativeScroll),
                left: 90,
                child: Text(
                  '+216 50 611 513',
                  style: TextStyle(
                    fontSize: phoneNumberFontSizeTween.transform(
                      relativeScroll,
                    ),
                  ),
                ),
              )
            else
              SizedBox.shrink(),
            Positioned(
              top: profileTopPositionTween.transform(relativeScroll),
              left: profileLeftPositionTween.transform(relativeScroll),
              child: Transform.scale(
                scale: profileSizeTween.transform(relativeScroll),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEgzwHNJhsADqquO7m7NFcXLbZdFZ2gM73x8I82vhyhg&s",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class WhatsappProfileBody extends StatelessWidget {
  const WhatsappProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(const [
        SizedBox(height: 20),
        ListTile(
          title: Text("Custom Notifications"),
          leading: Icon(Icons.notification_add),
        ),
        ListTile(
          title: Text("Disappearing messages"),
          leading: Icon(Icons.message),
        ),
        ListTile(
          title: Text("Mute Notifications"),
          leading: Icon(Icons.mic_off),
        ),
        ListTile(title: Text("Media visibility"), leading: Icon(Icons.save)),
        // to fill up the rest of the space to enable scrolling
        SizedBox(height: 550),
      ]),
    );
  }
}
