class CommentsModel {
  final String id;
  final String body;
  final String createdAt;
  final String ownerUsername;
  final List<CommentsModel> children;

  CommentsModel({
    required this.id,
    required this.body,
    required this.createdAt,
    required this.ownerUsername,
    required this.children,
  });

  factory CommentsModel.fromJson(Map<String, dynamic> json) {
    return CommentsModel(
      id: json['id'],
      body: json['body'],
      createdAt: json['created_at'],
      ownerUsername: json['owner_username'],
      children: (json['children'] as List<dynamic>? ?? [])
          .map((child) => CommentsModel.fromJson(child))
          .toList(),
    );
  }
}
