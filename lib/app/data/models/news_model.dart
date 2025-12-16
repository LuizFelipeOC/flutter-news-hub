class NewsModel {
  final String id;
  final String ownerId;
  final String slug;
  final String title;
  final String status;
  final String? sourceUrl;
  final String createdAt;
  final String updatedAt;
  final int tabCoins;
  final num tabCoinsDebit;
  final String ownerUsername;

  NewsModel({
    required this.id,
    required this.ownerId,
    required this.slug,
    required this.title,
    required this.status,
    required this.sourceUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.tabCoins,
    required this.tabCoinsDebit,
    required this.ownerUsername,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'ownerId': ownerId,
      'slug': slug,
      'title': title,
      'status': status,
      'sourceUrl': sourceUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'tabCoins': tabCoins,
      'tabCoinsDebit': tabCoinsDebit,
      'ownerUsername': ownerUsername,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      id: map['id'] as String,
      ownerId: map['owner_id'] as String,
      slug: map['slug'] as String,
      title: map['title'] as String,
      status: map['status'] as String,
      sourceUrl: map['source_url'] != null ? map['source_url'] as String : null,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
      tabCoins: map['tabcoins'] as int,
      tabCoinsDebit: map['tabcoins_debit'] as num,
      ownerUsername: map['owner_username'] as String,
    );
  }
}
