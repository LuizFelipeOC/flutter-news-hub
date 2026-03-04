import 'package:flutter/material.dart';

class UserAvatars extends StatelessWidget {
  final String userName;
  final VoidCallback? onTap;

  const UserAvatars({super.key, required this.userName, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;

    final firstLetter = userName[0].toUpperCase();

    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: colors.primary,
        child: Text(
          firstLetter,
          style: textStyles.bodyMedium?.copyWith(
            color: colors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
