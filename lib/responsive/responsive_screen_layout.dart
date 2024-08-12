import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';

import 'package:instagram_clone/utils/global_variable.dart';
import 'package:provider/provider.dart';
class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenlayout;
  final Widget mobileScreenlayout;

  const ResponsiveLayout({super.key, required this.webScreenlayout, required this.mobileScreenlayout});

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }
  void addData() async{
    UserProvider _userProvider=Provider.of(context,listen: false);
    await _userProvider.refreshUser();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints)
    {
      if(constraints.maxWidth>webScreenSize){
        return widget.webScreenlayout;
      }
      return widget.mobileScreenlayout;
    });
  }
}