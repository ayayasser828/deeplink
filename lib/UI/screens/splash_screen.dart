import 'package:deeplink/constant/routes.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

import 'homepage_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  Future<void> initDynamicLinks() async {
    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;
    print(deepLink);
    dynamicLinks.onLink.listen((dynamicLinkData) {
      if (dynamicLinkData.link.path != null) {
        print("deepLink ${dynamicLinkData.link}");
        print(dynamicLinkData.link);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePageScreen(code: dynamicLinkData.link.query,)));
      } else {
        print("deepLink == null");
      }
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }


  @override
  void initState() {
    initDynamicLinks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.purple,
      body: Center(child: Text('Welcome',style: TextStyle(fontSize: 30,color: Colors.white),)),
    );
  }
}
