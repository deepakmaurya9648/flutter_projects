import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thesocail/constant/Constantcolors%20(1).dart';
import 'package:thesocail/views/homepage/homepage.dart';

class AltProfilehelpers with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();

  Widget appBar(BuildContext context) {
    return AppBar(
      backgroundColor: constantColors.blueGreyColor.withOpacity(0.4),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  child: HomePage(), type: PageTransitionType.rightToLeft));
        },
      ),
      actions: [
        IconButton(
          icon: Icon(EvaIcons.moreVertical),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: HomePage(), type: PageTransitionType.rightToLeft));
          },
        ),
      ],
      centerTitle: true,
      title: RichText(
        text: TextSpan(
            text: 'The',
            style: TextStyle(
                color: constantColors.whiteColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: 'Socail',
                style: TextStyle(
                    color: constantColors.blueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ]),
      ),
    );
  }

  //?============================-------------Header profile------------------//
  Widget headerProfile(BuildContext context,
      AsyncSnapshot<DocumentSnapshot> snapshot, String userUid) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200,
            width: 180,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: constantColors.transperant,
                      backgroundImage: NetworkImage(
                        snapshot.data['userimage'],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(snapshot.data['username'],
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: constantColors.whiteColor)),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        EvaIcons.email,
                        color: constantColors.greenColor,
                        size: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(snapshot.data['useremail'],
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: constantColors.whiteColor)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: constantColors.darkColor,
                              borderRadius: BorderRadius.circular(15)),
                          height: 70,
                          width: 70,
                          child: Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: constantColors.whiteColor),
                              ),
                              Text(
                                'Followers',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: constantColors.whiteColor),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: constantColors.darkColor,
                              borderRadius: BorderRadius.circular(15)),
                          height: 70,
                          width: 70,
                          child: Column(
                            children: [
                              Text(
                                '0',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: constantColors.whiteColor),
                              ),
                              Text(
                                'Following',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: constantColors.whiteColor),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: constantColors.darkColor,
                          borderRadius: BorderRadius.circular(15)),
                      height: 70,
                      width: 70,
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: constantColors.whiteColor),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: constantColors.whiteColor),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

//?--------------------Divider-----------------------//
  Widget divider() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: 25,
          width: 350,
          child: Divider(
            color: constantColors.whiteColor,
          ),
        ),
      ),
    );
  }

  //?------------------------------------------------------Midle profile----------------

  Widget middleProfile(BuildContext context, dynamic snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                FontAwesomeIcons.userAstronaut,
                color: constantColors.yellowColor,
                size: 16,
              ),
              Text(
                'Recently Added',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: constantColors.whiteColor),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: constantColors.darkColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15)),
          ),
        )
      ],
    );
  }

//!=====================================----Footer profile---------------------//
  Widget footerProfile(BuildContext context, dynamic snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.53,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: constantColors.darkColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(5)),
        child: Image.asset(
          'assets/empty.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
