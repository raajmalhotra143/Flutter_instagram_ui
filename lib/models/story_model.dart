import 'user_model.dart';

class StoryModel {
  final String id;
  final UserModel user;
  final String imageUrl; // For simplicity, using one image per story node
  final bool isSeen;
  final bool isLive;

  const StoryModel({
    required this.id,
    required this.user,
    required this.imageUrl,
    this.isSeen = false,
    this.isLive = false,
  });
}
