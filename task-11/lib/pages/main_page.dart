import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../resources/svg_images.dart';
import '../styles/styles.dart';

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
        backgroundColor: appBarColor,
        title: const Text(
          'Business Card',
          style: textStyleBig,
        ),
      ),
      backgroundColor: backgroundColor,
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
      color: appBarColor,
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
                SvgImages.aboutDevExp,
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
      color: appBarColor,
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
                SvgImages.aboutHobbies,
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
      color: appBarColor,
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
                SvgImages.aboutWork,
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
      color: appBarColor,
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
                SvgImages.aboutMeIcon,
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
      backgroundColor: appBarColor,
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
        duration: const Duration(milliseconds: 800),
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
