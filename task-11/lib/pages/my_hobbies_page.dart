import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/pages/main_page.dart';

class AboutMyHobbiesPage extends StatelessWidget {
  const AboutMyHobbiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'My hobbies',
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
                'my hobbies are nintendo switch, board games with friends and beat saber with glasses oculus quest',
                style: textStyle,
              ),
              WhiteSpacer(),
              ImagesHobbyScrollWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagesHobbyScrollWidget extends StatelessWidget {
  const ImagesHobbyScrollWidget({
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
              'assets/images/switch.jpg',
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
              'assets/images/board_game.jpg',
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
              'assets/images/beat_saber.png',
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
