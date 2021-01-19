import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'login.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SignInScreen()),
    );
  }

  /*Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 256.0),
      alignment: Alignment.bottomCenter,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Order Newspaper & Magazine",
          body:
          "Instead of having to buy an same newspaper for month, User can order different company's newspaper on daily basis",
          image: Image(image: AssetImage('assets/newspaper.png'),height: 100, width: 100,),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Profile based recommendation",
          body:"Articles and Magazines are displayed according to the user taste",
          image: Image(image: AssetImage('assets/article.png'),),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Manage Profiles",
          body:
          "User can manage their profiles and get profile based recommendations",
          image: Image(image: AssetImage('assets/man.png'),),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Search",
          body:
          "User can search news, articles and magazines through text, voice, image annotation and QR Scan",
          image: Image(image: AssetImage('assets/seo.png'),),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator
        (
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}