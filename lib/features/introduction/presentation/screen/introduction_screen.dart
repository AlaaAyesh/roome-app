import 'package:flutter/material.dart';
import 'package:roome/features/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:roome/features/introduction/presentation/functions/button_functin.dart';
import 'package:roome/features/introduction/presentation/widget/build_page_indicator.dart';
import 'package:roome/features/introduction/presentation/widget/buttons/next_start_button.dart';
import 'package:roome/features/introduction/presentation/widget/buttons/skip_return_button.dart';
import 'package:roome/features/introduction/presentation/widget/introduction_body.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});
  static String id = 'Introduction Screen';

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: introductionBody(),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        if (i == _currentPage)
                          buildPageIndicator(true)
                        else
                          buildPageIndicator(false),
                    ],
                  ),
                  nextStartButton(_currentPage, _goToStart,_goToNextPage),
                  skipReturnButton(_currentPage, _returnPage,
                      _skipIntroduction),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
  void _goToStart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }
 void _goToNextPage() {
    if (_currentPage < introductionBody().length) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

 void _returnPage() {
    _pageController.jumpToPage(0);
  }

  void _skipIntroduction() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

}
