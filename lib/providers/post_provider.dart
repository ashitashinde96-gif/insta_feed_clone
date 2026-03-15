import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/post_repository.dart';

class PostProvider extends ChangeNotifier {

  final PostRepository repository = PostRepository();

  List<Post> posts = [];

  bool isLoading = false;
  bool hasMore = true;

  int page = 0;

  Future<void> loadPosts() async {

    if (isLoading || !hasMore) return;

    isLoading = true;
    notifyListeners();

    final newPosts = await repository.fetchPosts();

    if (newPosts.isEmpty) {
      hasMore = false;
    } else {
      posts.addAll(newPosts);
      page++;
    }

    isLoading = false;
    notifyListeners();
  }
}