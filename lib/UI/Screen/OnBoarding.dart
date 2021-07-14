import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:movegro/config/Constant.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

final _controller = PageController(
  initialPage: 0,
);

int _currentPage = 0;

List<Widget> _pages = [
  Column(
    children: [
      Expanded(child: Image.asset('assets/image/enteraddress.png')),
      Text(
        'set Your Delevery Location',
        style: kPageViewTextStyle,
        textAlign: TextAlign.center,
      )
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('assets/image/orderfood.png')),
      Text(
        'Order online from Your Favourite Store',
        style: kPageViewTextStyle,
        textAlign: TextAlign.center,
      )
    ],
  ),
  Column(
    children: [
      Expanded(child: Image.asset('assets/image/deliverfood.png')),
      Text(
        'Quick Deliver to yout Door Step',
        style: kPageViewTextStyle,
        textAlign: TextAlign.center,
      )
    ],
  )
];

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        SizedBox(height: 20),
        DotsIndicator(
          dotsCount: _pages.length,
          position: _currentPage.toDouble(),
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeColor: Colors.deepOrangeAccent),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
