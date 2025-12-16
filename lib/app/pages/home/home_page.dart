import 'package:flutter/material.dart';
import 'package:news_hub/app/pages/home/home_page_controller.dart';
import 'package:news_hub/app/pages/home/home_page_state.dart';
import 'package:news_hub/app/pages/home/widgets/news_card.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            UserSilverAppBar(),
            SliverToBoxAdapter(child: const SizedBox(height: 20)),

            ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, state, child) {
                if (state is HomePageLoadedState) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 26),
                    sliver: SliverList.builder(
                      itemCount: state.news.length,
                      itemBuilder: (context, index) {
                        final newsItem = state.news[index];

                        return NewsCard(newsItem: newsItem);
                      },
                    ),
                  );
                }

                return SliverToBoxAdapter(child: SizedBox());
              },
            ),
          ],
        ),
      ),
    );
  }
}
