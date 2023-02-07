// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:poolart/configs/configs.dart';
import 'package:poolart/models/project.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LatestProjectSliderMobile extends StatefulWidget {
  final Project project;
  const LatestProjectSliderMobile({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<LatestProjectSliderMobile> createState() =>
      _LatestProjectSliderMobileState();
}

class _LatestProjectSliderMobileState extends State<LatestProjectSliderMobile> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.size!.width * 0.68,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppTheme.c!.primary,
              height: AppDimensions.size!.height * 0.25,
            ),
          ),
          CarouselSlider(
            items: widget.project.images
                .asMap()
                .entries
                .map(
                  (e) => CachedNetworkImage(
                    imageUrl: e.value,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: false,
              disableCenter: true,
              autoPlay: false,
              viewportFraction: 0.7,
              autoPlayCurve: Curves.linearToEaseOut,
              autoPlayAnimationDuration: const Duration(
                milliseconds: 700,
              ),
              onPageChanged: (value, reason) {
                setState(() {
                  activeIndex = value;
                });
              },
              enlargeCenterPage: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: Space.all(0.7),
              child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: widget.project.images.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: AppTheme.c!.background!,
                  dotColor: Colors.grey.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
