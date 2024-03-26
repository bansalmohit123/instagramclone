import 'package:flutter/material.dart';

import 'package:instagram_clone/utils/dimension.dart';
class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenlayout;
  final Widget mobileScreenlayout;

  const ResponsiveLayout({super.key, required this.webScreenlayout, required this.mobileScreenlayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints)
    {
      if(constraints.maxWidth>webScreensize){
        return webScreenlayout;
      }
      return mobileScreenlayout;
    });
  }
}