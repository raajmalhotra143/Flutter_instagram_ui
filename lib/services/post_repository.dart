import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post_model.dart';
import '../models/story_model.dart';
import '../models/user_model.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) => PostRepository());

class PostRepository {
  // Using picsum and other placeholder images
  final List<UserModel> _mockUsers = const [
    UserModel(id: 'u1', username: 'joshua_l', profileImageUrl: 'assets/images/profile_joshua.png', location: 'Tokyo, Japan'),
    UserModel(id: 'u2', username: 'craig_love', profileImageUrl: 'assets/images/profile_craig.png', location: 'New York, USA'),
    UserModel(id: 'u3', username: 'karennne', profileImageUrl: 'assets/images/profile_karen.png', location: 'London, UK'),
    UserModel(id: 'u4', username: 'martini_rond', profileImageUrl: 'assets/images/profile_joshua.png', location: 'Paris, France'),
    UserModel(id: 'u5', username: 'maxjacobson', profileImageUrl: 'assets/images/profile_craig.png'),
  ];

  late final List<PostModel> _allPosts;

  PostRepository() {
    _allPosts = List.generate(20, (index) {
      final userIndex = index % _mockUsers.length;
      final user = _mockUsers[userIndex];
      
      // Alternate between desert and mountain
      final assetName = index % 2 == 0 ? 'post_desert.png' : 'post_mountain.png';
      
      return PostModel(
        id: 'post_$index',
        user: user,
        imageUrls: ['assets/images/$assetName'],
        caption: '${user.username} The game in Japan was amazing and I want to share some photos. What do you guys think? #$index #photography',
        likesCount: 44686 + (index * 13),
        commentsCount: 120 + index,
        createdAt: DateTime.now().subtract(Duration(hours: index * 2)),
        isLiked: index % 4 == 0,
        isSaved: index % 5 == 0,
        likedBy: [_mockUsers[(userIndex + 1) % _mockUsers.length]],
      );
    });
  }

  Future<List<StoryModel>> fetchStories() async {
    // Artificial delay
    await Future.delayed(const Duration(milliseconds: 1000));
    
    return [
      StoryModel(id: 's_me', user: const UserModel(id: 'me', username: 'Your Story', profileImageUrl: 'assets/images/profile_joshua.png'), imageUrl: '', isSeen: true),
      ...List.generate(8, (index) {
        final user = _mockUsers[index % _mockUsers.length];
        return StoryModel(
          id: 'story_$index',
          user: user,
          imageUrl: 'assets/images/${index % 2 == 0 ? "post_desert.png" : "post_mountain.png"}',
          isSeen: index > 3,
          isLive: index == 1,
        );
      }),
    ];
  }

  Future<List<PostModel>> fetchFeed({int page = 0, int limit = 5}) async {
    // 1.5s delay as requested
    await Future.delayed(const Duration(milliseconds: 1500));
    
    final startIndex = page * limit;
    if (startIndex >= _allPosts.length) {
      return [];
    }
    
    final endIndex = (startIndex + limit > _allPosts.length) ? _allPosts.length : startIndex + limit;
    return _allPosts.sublist(startIndex, endIndex);
  }
}
