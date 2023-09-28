import 'package:call/Core/Utils/app_strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:call/Features/Register/data/models/user_model.dart';

part 'stream_state.dart';

class StreamCubit extends Cubit<StreamState> {
  StreamCubit() : super(StreamInitialState());
  List<UserModel> listOfStream = [];
  Future<void> getStream() async {
    emit(const StreamLoadingState());
    FirebaseFirestore.instance
        .collection(AppStrings.usersCollection)
        .doc(AppStrings.profileDocument)
        .collection(AppStrings.profileDetailsCollection)
        .orderBy('isOnline', descending: true)
        .snapshots()
        .listen((event) {
      listOfStream.clear();
      for (var result in event.docs) {
        listOfStream.add(UserModel.fromJson(result.data()));
      }
      emit(StreamSuccessState(streamList: listOfStream));
    });
  }

  // Future<void> getStream() async {
  //   emit(const StreamLoadingState());
  //   FirebaseFirestore.instance
  //       .collection(AppStrings.usersCollection)
  //       .doc(AppStrings.profileDocument)
  //       .collection(AppStrings.profileDetailsCollection)
  //       .withConverter(
  //           fromFirestore: UserModel.fromFirestore,
  //           toFirestore: (UserModel user, options) => user.toFirestore())
  //       .orderBy('isOnline', descending: true)
  //       .snapshots()
  //       .listen((event) {
  //     // listOfStream.clear();
  //     // for (var result in event.docs) {
  //     //   listOfStream.add(UserModel.fromJson(result.data()));
  //     // }
  //     emit(StreamSuccessState(streamList: listOfStream));
  //   });
  // }
}
