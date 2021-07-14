import 'package:flutter/material.dart';
import 'package:movegro/UI/Screen/OnBoarding.dart';

class WelcomeScreen extends StatelessWidget {
  bool _validPhoneNumber = false;

  @override
  Widget build(BuildContext context) {
    void showBottomSheet(context) {
      showModalBottomSheet(
          isScrollControlled: true,
          isDismissible: true,
          context: context,
          builder: (context) =>
              StatefulBuilder(builder: (context, StateSetter myState) {
                return DraggableScrollableSheet(
                    initialChildSize: 0.75, //set this as you want
                    maxChildSize: 0.75, //set this as you want
                    minChildSize: 0.75, //set this as you want
                    expand: true,
                    builder: (context, scrollController) {
                      return Container(
                          height: MediaQuery.of(context).size.height - 60,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text('LOGIN',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  Text('Enter your phone number to process',
                                      style: TextStyle(fontSize: 12)),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  TextField(
                                      decoration: InputDecoration(
                                          prefixText: '+62',
                                          labelText: '11 digit mobile number'),
                                      autofocus: true,
                                      keyboardType: TextInputType.phone,
                                      maxLength: 11,
                                      onChanged: (value) {
                                        if (value.length == 11) {
                                          myState(() {
                                            _validPhoneNumber = true;
                                          });
                                        } else {
                                          myState(() {
                                            _validPhoneNumber = false;
                                          });
                                        }
                                      }),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: AbsorbPointer(
                                          absorbing:
                                              _validPhoneNumber ? false : true,
                                          child: FlatButton(
                                              color: _validPhoneNumber
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.grey,
                                              onPressed: () {},
                                              child: Text(
                                                  _validPhoneNumber
                                                      ? 'CONTINUE'
                                                      : 'ENTER PHONE NUMBER',
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ));
                    });
              }));
    }

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
                  onPressed: () {
                    showBottomSheet(context);
                  },
                  child: RichText(
                    text: TextSpan(
                        text: 'Already a customer ?',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'LOGIN',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent))
                        ]),
                  ),
                ),
              ])
            ],
          )),
    );
  }
}
