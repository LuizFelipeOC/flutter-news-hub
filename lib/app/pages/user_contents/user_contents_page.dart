import 'package:flutter/material.dart';
import 'package:news_hub/app/data/models/users_contents/user_contents_paramerters.dart';

class UserContentsPage extends StatefulWidget {
  final UserContentsParamerters userContentsParamerters;

  const UserContentsPage({super.key, required this.userContentsParamerters});

  @override
  State<UserContentsPage> createState() => _UserContentsPageState();
}

class _UserContentsPageState extends State<UserContentsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: false,
              floating: true,
              pinned: false,
              snap: true,
              backgroundColor: Colors.transparent,
              foregroundColor: colors.primary,
              elevation: 0,
              scrolledUnderElevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                title: Text(
                  widget.userContentsParamerters.userName,
                  style: textStyles.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
