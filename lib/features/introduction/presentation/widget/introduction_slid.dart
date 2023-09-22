import 'package:flutter/material.dart';
class IntroSlid extends StatelessWidget {
  const IntroSlid({
    super.key,
    required this.introImage,
    required this.introTitle,
    required this.introSubTitle,
  });
  final String introImage;
  final String introTitle;
  final String introSubTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.60,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(introImage), fit: BoxFit.fitWidth),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
            ),
            color: Colors.blue,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
          height: MediaQuery.of(context).size.height * 0.20,
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                introTitle,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                introSubTitle,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 42,
              )
            ]),
          ),
        ),
      ],
    );
  }
}
