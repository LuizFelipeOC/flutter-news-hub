import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/app/core/widgets/categories_filter/categories_filter.dart';
import 'package:news_hub/app/core/widgets/news_card/news_card_shimmer.dart';
import 'package:news_hub/app/pages/home/home_page_controller.dart';
import 'package:news_hub/app/pages/home/home_page_state.dart';
import 'package:news_hub/app/core/widgets/news_card/news_card.dart';
import 'package:news_hub/app/pages/home/widgets/user_silver_app_bar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageController controller;

  @override
  void initState() {
    controller = context.read<HomePageController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadNews();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                await controller.loadNews();
              },
            ),
            UserSilverAppBar(),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 64,
                  child: CategoriesFilter(
                    onCategorySelected: (value) {
                      controller.loadNewsByCategory(value.id);
                    },
                  ),
                ),
              ),
            ),

            ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, state, child) {
                // Shimmer loading state
                if (state is HomePageLoadingState) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 26),
                    sliver: SliverList.builder(
                      itemCount: 5, // Show 5 shimmer items
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: NewsCardShimmer(),
                        );
                      },
                    ),
                  );
                }

                // Loaded state with animation
                if (state is HomePageLoadedState) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 26),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (index >= state.news.length) {
                          return const Padding(
                            padding: EdgeInsets.all(24),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final newsItem = state.news[index];

                        return NewsCard(newsItem: newsItem);
                      }, childCount: state.news.length + (controller.hasMore ? 1 : 0)),
                    ),
                  );
                }

                // Error state
                if (state is HomePageErrorState) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Erro ao carregar notícias',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.message,
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () => controller.loadNews(),
                              child: const Text('Tentar novamente'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                // Empty state
                if (state is HomePageEmptyState) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.article_outlined,
                              size: 48,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Nenhuma notícia encontrada',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Não há notícias disponíveis no momento.',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                return const SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }
}
