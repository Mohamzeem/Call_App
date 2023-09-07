import 'package:call/Core/Utils/app_strings.dart';
import 'package:call/Features/Register/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class RegisterApi {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
//register user in firebase
  Future<UserCredential> register(
      {required String email, required String password}) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: "${email.trim()}${AppStrings.defaultEmail}",
      password: password.trim(),
    );
    return userCredential;
  }

//add user data in firebase
  addUserDatatoFirebase(
    String id,
    String name,
    String email,
  ) async {
    String? token = await FirebaseMessaging.instance.getToken();
    final userModel = UserModel(
      id: id,
      name: name,
      email: email,
    );
    await firestore
        .collection('Users')
        .doc(id)
        .collection('Profile')
        .doc('profileDetails')
        .set(userModel.toJson(id: id, tokenFcm: token!));
  }

  // addUserProfile(
  //   String id,
  //   String name,
  //   String email,
  //   String job,
  //   String role,
  // ) async {
  //   String? token = await FirebaseMessaging.instance.getToken();

  //   UserDetailsModel userModel = UserDetailsModel(
  //       id: id, name: name, email: email, job: job, role: role);

  //   NotificationListModel notification = const NotificationListModel();

  //   await FirebaseFirestore.instance
  //       .collection(AppStrings.profileCollection)
  //       .doc(id)
  //       .set(userModel.toJson(id: id, tokenFcm: token!));
  //   await FirebaseFirestore.instance
  //       .collection(AppStrings.notificationsCollection)
  //       .doc(id)
  //       .set(notification.toJson());
  //   if (role == 'Coach') {
  //     await FirebaseFirestore.instance
  //         .collection(AppStrings.coachesCollection)
  //         .doc(id)
  //         .set(userModel.toJson(id: id, tokenFcm: token));
  //   }
  //   if (role == 'Employee') {
  //     await FirebaseFirestore.instance
  //         .collection('Employees')
  //         .doc(id)
  //         .set(userModel.toJson(id: id, tokenFcm: token));
  //   }
  // }
}
