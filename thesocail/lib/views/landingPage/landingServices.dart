import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thesocail/constant/Constantcolors%20(1).dart';

class LandingService with ChangeNotifier {
  ConstantColors constantColors = ConstantColors();
  Widget passwordLessSignIn(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('allUsers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return new ListView(
                children:
                    snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
              return ListTile(
                trailing: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.trashAlt,
                    color: constantColors.redColor,
                  ),
                  onPressed: () {},
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage(documentSnapshot.data()['userimage']),
                ),
                subtitle: Text(
                  documentSnapshot.data()['useremail'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: constantColors.greenColor),
                ),
                title: Text(
                  documentSnapshot.data()['username'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: constantColors.greenColor),
                ),
              );
            }).toList());
          }
        },
      ),
    );
  }
}
