import 'package:flutter/material.dart';
import 'package:news_hub/app/data/models/comments/comments_request_model.dart';
import 'package:news_hub/app/data/repository/comments/comments_repository.dart';
import 'package:news_hub/app/pages/new_content/new_content_controller.dart';
import 'package:news_hub/app/pages/new_content/new_content_state.dart';
import 'package:news_hub/app/pages/new_content/widgets/news_body.dart';
import 'package:news_hub/app/pages/new_content/widgets/news_content_shimmer.dart';
import 'package:news_hub/app/pages/new_content/widgets/post_comments/post_comments_widget.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatefulWidget {
  final String id;
  final String userId;

  const NewsPage({super.key, required this.id, required this.userId});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late NewContentController controller;
  late CommentsRepository repository;

  @override
  void initState() {
    controller = context.read<NewContentController>();
    repository = context.read<CommentsRepository>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchNewContentsById(userId: widget.userId, slug: widget.id);
      repository.getComments(
        request: CommentsRequestModel(slug: widget.id, userId: widget.userId),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<INewContentState>(
          valueListenable: controller,
          builder: (context, state, child) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  pinned: false,
                  snap: true,
                  backgroundColor: Colors.transparent,
                  foregroundColor: colors.primary,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(
                      left: 56,
                      bottom: 16,
                      right: 16,
                    ),
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),

                if (state is NewContentLoadingState) ...[
                  const SliverToBoxAdapter(child: NewsContentShimmer()),
                ],

                if (state is NewContentLoadedState) ...[
                  SliverToBoxAdapter(
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 400),
                      tween: Tween(begin: 0.0, end: 1.0),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, (1 - value) * 20),
                          child: Opacity(
                            opacity: value,
                            child: NewsBody(newsItem: state.newsItem),
                          ),
                        );
                      },
                    ),
                  ),

                  if (state.comments.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          'Comentários',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        final comment = state.comments[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 4.0,
                          ),
                          child: PostCommentsWidget(commentsModel: comment),
                        );
                      },
                      itemCount: state.comments.length,
                    ),
                  ],
                ],

                if (state is NewContentErrorState) ...[
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text('Comentários', style: textStyle.bodySmall),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64,
                              color: colors.error,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Erro ao carregar conteúdo',
                              style: textStyle.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.message,
                              style: textStyle.bodyMedium?.copyWith(
                                color: colors.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () => controller.fetchNewContentsById(
                                userId: widget.userId,
                                slug: widget.id,
                              ),
                              child: const Text('Tentar novamente'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  const SliverToBoxAdapter(child: SizedBox()),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
