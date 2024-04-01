import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/pages/main_page.dart';

class AboutMyWorkPage extends StatelessWidget {
  const AboutMyWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'My work',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 50,
              fontFamily: 'Moskitoes'),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 133, 157, 168),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WhiteSpacer(),
              Text(
                'nine years of building the largest icebreakers in the world',
                style: textStyle,
              ),
              WhiteSpacer(),
              ImagesWorkScrollWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagesWorkScrollWidget extends StatelessWidget {
  const ImagesWorkScrollWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 300,
            height: 200,
            child: Image.asset(
              'assets/images/ship1.jpg',
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 10,
        ),
        const WhiteSpacer(),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 300,
            height: 200,
            child: Image.asset(
              'assets/images/ship2.jpg',
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 10,
        ),
        const WhiteSpacer(),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 300,
            height: 200,
            child: Image.asset(
              'assets/images/ship3.jpg',
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 10,
        ),
        const WhiteSpacer(),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
            width: 300,
            height: 200,
            child: Image.asset(
              'assets/images/ship4.jpeg',
              fit: BoxFit.cover,
            )),
        const SizedBox(
          width: 10,
        ),
        const WhiteSpacer(),
      ],
    );
  }
}
