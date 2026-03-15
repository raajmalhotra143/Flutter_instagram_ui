import 'user_model.dart';

class PostModel {
  final String id;
  final UserModel user;
  final List<String> imageUrls;
  final String caption;
  final int likesCount;
  final int commentsCount;
  final DateTime createdAt;
  final bool isLiked;
  final bool isSaved;
  final List<UserModel> likedBy; // E.g. to show "Liked by user1 and 44,686 others"

  const PostModel({
    required this.id,
    required this.user,
    required this.imageUrls,
    required this.caption,
    required this.likesCount,
    required this.commentsCount,
    required this.createdAt,
    this.isLiked = false,
    this.isSaved = false,
    this.likedBy = const [],
  });

  PostModel copyWith({
    bool? isLiked,
    bool? isSaved,
    int? likesCount,
  }) {
    return PostModel(
      id: id,
      user: user,
      imageUrls: imageUrls,
      caption: caption,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount,
      createdAt: createdAt,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
      likedBy: likedBy,
    );
  }
}
