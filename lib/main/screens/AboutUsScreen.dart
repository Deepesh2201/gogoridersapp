import 'package:flutter/material.dart';
import '../../main.dart';
import '../../main/utils/Colors.dart';
import '../../main/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../components/BodyCornerWidget.dart';
import '../utils/Common.dart';

class AboutUsScreen extends StatefulWidget {
  static String tag = '/AboutUsScreen';

  @override
  AboutUsScreenState createState() => AboutUsScreenState();
}

class AboutUsScreenState extends State<AboutUsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(language.aboutUs)),
      body: BodyCornerWidget(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/app_logo.jpg',height: 80,width: 80).cornerRadiusWithClipRRect(16),
              16.height,
              Text(mAppName, style: primaryTextStyle(size: 20)),
              8.height,
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    return Text('v${snap.data!.version.validate()}', style: secondaryTextStyle());
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: AppButton(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              color: colorPrimary,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.contact_support_outlined, color: Colors.white),
                  8.width,
                  Text(language.contactUs, style: boldTextStyle(color: white)),
                ],
              ),
              onTap: () {
                commonLaunchUrl('mailto:$mContactPref');
              },
            ),
          ),
          16.height,

        ],
      ).paddingAll(16),
    );
  }
}
