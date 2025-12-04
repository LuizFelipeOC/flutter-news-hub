import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_hub/app/core/constants/app_images.dart';
import 'package:news_hub/app/core/theme/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppImages.onboardingImage,
                      width: MediaQuery.of(context).size.width * .45,
                    ),
                    SizedBox(height: 26),
                    Text.rich(
                      TextSpan(
                        text: 'Fique por dentro das ',
                        style: Theme.of(context).textTheme.headlineMedium,
                        children: [
                          TextSpan(
                            text: 'notícias, artigos, novidades e discussões',
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.green400,
                            ),
                          ),
                          const TextSpan(text: ' da comunidade de tecnologia.'),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 52,
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text('Explorar notícias')),
            ),
          ],
        ),
      ),
    );
  }
}
