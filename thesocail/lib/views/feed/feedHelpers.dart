import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesocail/constant/Constantcolors%20(1).dart';
import 'package:thesocail/utils/uploadPost.dart';

class FeedHelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: constantColors.darkColor.withOpacity(0.6),
      actions: [
        IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color: constantColors.greenColor,
            ),
            onPressed: () {
              Provider.of<UploadPost>(context, listen: false)
                  .selectPostImageType(context);
            })
      ],
      centerTitle: true,
      title: RichText(
        text: TextSpan(
            text: 'Social',
            style: TextStyle(
                color: constantColors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: 'Feed',
                style: TextStyle(
                    color: constantColors.blueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
    );
  }

  Widget feedBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: constantColors.darkColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18))),
        ),
      ),
    );
  }
}
