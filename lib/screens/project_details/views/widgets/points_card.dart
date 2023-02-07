import 'package:flutter/material.dart';

import 'package:poolart/configs/configs.dart';

class PointsCard extends StatelessWidget {
  final String header;
  final List<String> points;

  const PointsCard({
    Key? key,
    required this.header,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: MediaQuery.of(context).size.width <= 600
              ? AppText.h3b!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )
              : AppText.h2b!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
        ),
        Space.y1!,
        ...points.map(
          (e) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.y2!,
              const Icon(Icons.check),
              Space.x!,
              Expanded(
                child: Text(
                  e,
                  style: MediaQuery.of(context).size.width <= 600
                      ? AppText.l1!.copyWith(
                          color: Colors.black,
                        )
                      : AppText.h2b!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
