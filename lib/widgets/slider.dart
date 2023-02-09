import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PrefetchImageDemo extends StatefulWidget {
  const PrefetchImageDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  final List<String> images = [
    'https://res.cloudinary.com/dzsshr0iz/image/upload/v1608122048/karmilon%20images/advert-card-1_vkqqg4.png',
    'https://res.cloudinary.com/dzsshr0iz/image/upload/v1608122432/karmilon%20images/advert-card-2_xslyig.png',
    'https://res.cloudinary.com/dzsshr0iz/image/upload/v1608122440/karmilon%20images/advert-card-3_v5fgtc.png',
  ];

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      for (var imageUrl in images) {
        precacheImage(NetworkImage(imageUrl), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
    autoPlay: true,
    aspectRatio: 2.0,
    enlargeCenterPage: true,
    autoPlayCurve: Curves.fastOutSlowIn,
      ),
      itemBuilder: (context, int index, _) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(
            images[index],
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
      },
    );
  }
}
