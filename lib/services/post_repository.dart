// import '../models/post.dart';

// class PostRepository {
//   Future<List<Post>> fetchPosts() async {
//     await Future.delayed(Duration(seconds: 2));

//     return List.generate(
//       10,
//       (index) => Post(
//         username: "user$index",
//         profileImage:
//             "https://i.pravatar.cc/150?img=$index",
//         images: [
//           "https://picsum.photos/500/500?random=$index",
//           "https://picsum.photos/500/500?random=${index + 10}"
//         ],
//         caption: "Beautiful moment $index",
//       ),
//     );
//   }
// }
import '../models/post.dart';

class PostRepository {
  Future<List<Post>> fetchPosts() async {

    await Future.delayed(const Duration(seconds: 2));

    return List.generate(
      10,
      (index) => Post(
        username: "user$index",

        profileImage:
            "https://randomuser.me/api/portraits/men/${index + 10}.jpg",

        images: [
          "https://picsum.photos/500/500?random=${index + 1}",
          "https://picsum.photos/500/500?random=${index + 20}"
        ],

        caption: "Enjoying this beautiful moment!",
      ),
    );
  }
}