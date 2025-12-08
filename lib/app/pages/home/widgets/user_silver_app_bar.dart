import 'package:flutter/material.dart';
import 'package:news_hub/app/data/domain/models/user_model.dart';
import 'package:news_hub/app/pages/login/login_page.dart';

class UserSilverAppBar extends StatelessWidget {
  final UserModel? user;

  const UserSilverAppBar({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return SliverAppBar(
      pinned: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      expandedHeight: 120,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        centerTitle: false,
        titlePadding: const EdgeInsets.only(left: 16, bottom: 12, right: 12),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (user != null) ...[
              Text('Olá, $user', style: textStyle.headlineLarge),
            ] else ...[
              Text('Bem-vindo ao\nNews Hub', style: textStyle.bodyLarge),
            ],

            GestureDetector(
              onTap: () {
                if (user == null) {
                  showModalBottomSheet(
                    isDismissible: false,
                    enableDrag: false,
                    context: context,
                    builder: (_) => const LoginPage(),
                    useSafeArea: false,
                    isScrollControlled: true,
                  );
                }
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: colorScheme.surface,
                child: user != null
                    ? Text('LF', style: textStyle.headlineLarge)
                    : Icon(Icons.person, color: colorScheme.onSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
