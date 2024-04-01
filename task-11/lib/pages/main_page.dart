import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({
    super.key,
  });

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Business Card',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 50,
              fontFamily: 'Moskitoes'),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 133, 157, 168),
      body: const BusinessCardWidget(),
    );
  }
}

class BusinessCardWidget extends StatelessWidget {
  const BusinessCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          AvatarPhotoWidget(),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AboutMeWidget(),
              AboutMyWorkWidget(),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MyHobbiesWidget(),
              DevelopmentWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

const String aboutMeIcon = 'assets/images/about.svg';
const String aboutWork = 'assets/images/work.svg';
const String aboutHobbies = 'assets/images/hobbies.svg';
const String aboutDevExp = 'assets/images/dev.svg';

const textStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 30,
    fontFamily: 'Moskitoes');

class DevelopmentWidget extends StatelessWidget {
  const DevelopmentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void developmentButton() {
      Navigator.of(context).pushNamed('/development');
    }

    return Material(
      color: Colors.indigo,
      child: InkWell(
        onTap: developmentButton,
        child: SizedBox(
          width: 150,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Development',
                style: textStyle,
              ),
              SvgPicture.asset(
                aboutDevExp,
                width: 25,
                height: 25,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHobbiesWidget extends StatelessWidget {
  const MyHobbiesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void hobbiesButton() {
      Navigator.of(context).pushNamed('/hobbies');
    }

    return Material(
      color: Colors.indigo,
      child: InkWell(
        onTap: hobbiesButton,
        child: SizedBox(
          width: 150,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'My Hobbies',
                style: textStyle,
              ),
              SvgPicture.asset(
                aboutHobbies,
                width: 25,
                height: 25,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutMyWorkWidget extends StatelessWidget {
  const AboutMyWorkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void aboutWorkButton() {
      Navigator.of(context).pushNamed('/aboutWork');
    }

    return Material(
      color: Colors.indigo,
      child: InkWell(
        onTap: aboutWorkButton,
        child: SizedBox(
          width: 150,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'My Work',
                style: textStyle,
              ),
              SvgPicture.asset(
                aboutWork,
                width: 25,
                height: 25,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void aboutMeButton() {
      Navigator.of(context).pushNamed('/aboutMe');
    }

    return Material(
      ///
      /// [Material] for splash in [InkWell] button
      ///
      color: Colors.indigo,
      child: InkWell(
        onTap: aboutMeButton,
        child: SizedBox(
          width: 150,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'About Me',
                style: textStyle,
              ),
              SvgPicture.asset(
                aboutMeIcon,
                width: 25,
                height: 25,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AvatarPhotoWidget extends StatefulWidget {
  const AvatarPhotoWidget({
    super.key,
  });

  @override
  State<AvatarPhotoWidget> createState() => _AvatarPhotoWidgetState();
}

class _AvatarPhotoWidgetState extends State<AvatarPhotoWidget> {
  var tapped = false;

  void changeSize() {
    tapped = !tapped;
    setState(() {});
  }

  void avatarMessage() {
    var snack = SnackBar(
      backgroundColor: Colors.indigo,
      showCloseIcon: true,
      duration: const Duration(seconds: 2),
      content: tapped
          ? const Text(
              'S o   b i g',
              style: textStyle,
            )
          : const Text(
              'S o   s m a l l',
              style: textStyle,
            ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeSize,
      child: AnimatedContainer(
        foregroundDecoration: BoxDecoration(
          border: Border.all(width: 5, color: Colors.indigo),
          shape: BoxShape.circle,
        ),
        onEnd: avatarMessage,
        clipBehavior: Clip.hardEdge,
        width: tapped ? 350 : 200,
        height: tapped ? 350 : 200,
        duration: const Duration(seconds: 2),
        decoration: const BoxDecoration(
          color: Colors.indigo,
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          'assets/images/avatar.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ToBeContWidget extends StatelessWidget {
  const ToBeContWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'To be continued...',
          style: textStyle,
        ),
      ],
    );
  }
}

class WhiteSpacer extends StatelessWidget {
  const WhiteSpacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 5,
        width: 500,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    );
  }
}

class WhiteVerticalSpacer extends StatelessWidget {
  final double widgetHeight;

  const WhiteVerticalSpacer({
    super.key,
    required this.widgetHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: widgetHeight,
        width: 5,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    );
  }
}
