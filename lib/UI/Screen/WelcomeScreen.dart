import 'package:flutter/material.dart';
import 'package:movegro/UI/Screen/OnBoarding.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Positioned(
                right: 0.0,
                top: 10.0,
                child: FlatButton(
                  child: Text(
                    'SKIP',
                    style: TextStyle(color: Colors.deepOrangeAccent),
                  ),
                  onPressed: () {},
                ),
              ),
              Column(children: [
                Expanded(
                  child: OnBoardingScreen(),
                ),
                Text('Ready to order from your nearest shop?'),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  color: Colors.deepOrangeAccent,
                  child: Text(
                    'Set Delivery Location',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                    onPressed: () {},
                    child: RichText(
                      text: TextSpan(
                          text: 'Already a customer ?',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: 'Login',
                                style: TextStyle(fontWeight: FontWeight.bold))
                          ]),
                    ))
              ])
            ],
          )),
    );
  }
}
