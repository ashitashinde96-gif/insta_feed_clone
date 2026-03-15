
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerStory extends StatelessWidget {
  const ShimmerStory({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),

      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,

        child: Column(
          children: [

            const CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
            ),

            const SizedBox(height: 6),

            Container(
              width: 50,
              height: 10,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}