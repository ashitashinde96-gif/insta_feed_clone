// import 'package:flutter/material.dart';

// class StoryItem extends StatelessWidget {
//   final String imageUrl;
//   final String username;

//   const StoryItem({
//     super.key,
//     required this.imageUrl,
//     required this.username,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       child: Column(
//         children: [

//           Container(
//             padding: const EdgeInsets.all(3),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: const LinearGradient(
//                 colors: [
//                   Colors.purple,
//                   Colors.orange,
//                 ],
//               ),
//             ),
//             child: CircleAvatar(
//               radius: 28,
//               backgroundImage: NetworkImage(imageUrl),
//             ),
//           ),

//           const SizedBox(height: 4),

//           SizedBox(
//             width: 60,
//             child: Text(
//               username,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: const TextStyle(fontSize: 12),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {

  final String imageUrl;
  final String username;

  const StoryItem({
    super.key,
    required this.imageUrl,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),

      child: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(3),

            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.orange,
                ],
              ),
            ),

            child: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),

          const SizedBox(height: 4),

          SizedBox(
            width: 60,
            child: Text(
              username,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}