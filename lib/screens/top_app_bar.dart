import 'package:flutter/material.dart' ;
import 'package:flutter_svg/svg.dart';
import 'package:coco2/constants.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String leftIcon;
  final String title;
  final String rightIcon;

  TopAppBar({Key key, this.leftIcon, this.title, this.rightIcon}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(title,style: kAppBarTitleStyle),
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(leftIcon),
        onPressed: () {
          print("go back");
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            rightIcon,
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}