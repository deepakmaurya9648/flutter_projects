import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesocail/services/authentication.dart';
import 'package:thesocail/views/landingPage/landingutils.dart';

class FirebaseOperations with ChangeNotifier {
  Future uploadUserAvatar(BuildContext context) async {
    UploadTask imageUploadTask;
    Reference imageReference = FirebaseStorage.instance.ref().child(
        'userProfileAvatar/${Provider.of<LandingUtils>(context, listen: false).getUserAvatar.path}/${TimeOfDay.now()}');

    imageUploadTask = imageReference.putFile(
        Provider.of<LandingUtils>(context, listen: false).getUserAvatar);
    await imageUploadTask.whenComplete(() => print('Image uploaded!'));
    imageReference.getDownloadURL().then((url) =>
        Provider.of<LandingUtils>(context, listen: false).userAvatarUrl =
            url.toString());
    print(
        'the user profile url=>${Provider.of<LandingUtils>(context, listen: false).userAvatarUrl}');
    notifyListeners();
  }

  Future createUserCollection(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<Authentication>(context, listen: false).getuserUid)
        .set(data);
  }
}
