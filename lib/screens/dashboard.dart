import 'package:flutter/material.dart';
import 'package:flutter_app_locale/constants/constants.dart';
import 'package:flutter_app_locale/ui/widgets/audience.dart';
import 'package:flutter_app_locale/ui/widgets/header.dart';
import 'package:flutter_app_locale/ui/widgets/stats.dart';
import 'package:flutter_app_locale/utils/responsive.dart';

import '../constants.dart';


class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const  Header(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const Stats(),
                      const SizedBox(height: defaultPadding),
                      const Audience(),
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),
              ],
            )
          ],
        ),
      ),
    );
  }
}
