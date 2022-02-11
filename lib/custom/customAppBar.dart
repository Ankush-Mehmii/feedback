import 'package:flutter/material.dart';
import 'package:feedback/constants/textstyle.dart' as Style;
class CustomAppBar extends StatelessWidget implements PreferredSize {
  final bool? isCenterTile;
  final VoidCallback? onPressed;
  final String? title;
  const CustomAppBar(
      {Key? key,
      this.onPressed,
      this.isCenterTile,
      this.title,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }

  @override
  Widget get child => AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading:IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: onPressed)
 ,
        title: Text(title!, style: Style.appTextStyle1,),
        centerTitle: isCenterTile!? true : false,
        elevation: 1.0,
      );
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
