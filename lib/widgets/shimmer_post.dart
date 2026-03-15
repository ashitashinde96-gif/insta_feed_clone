// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';

// class ShimmerPost extends StatelessWidget {
//   const ShimmerPost({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//           ListTile(
//             leading: CircleAvatar(radius: 20, backgroundColor: Colors.white),
//             title: Container(
//               height: 10,
//               width: 100,
//               color: Colors.white,
//             ),
//           ),

//           Container(
//             height: 300,
//             width: double.infinity,
//             color: Colors.white,
//           ),

//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Container(
//               height: 10,
//               width: 200,
//               color: Colors.white,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
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