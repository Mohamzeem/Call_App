import 'package:call/Features/Contacts/data/models/contact_model.dart';
import 'package:call/Features/Voice_Call/presentation/view/widgets/body.dart';
import 'package:call/Features/Voice_Call/presentation/view_model/voice_call_cubit/voice_call_cubit.dart';
import 'package:flutter/material.dart';
import 'package:call/Core/Widgets/custom_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoiceCallView extends StatelessWidget {
  final ContactModel contactModel;
  const VoiceCallView({Key? key, required this.contactModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => VoiceCallCubit(),
        child: Scaffold(
          appBar: const CustomAppBar(
            isArrowBack: true,
            isProfile: true,
            //    title: 'Audio Calling ${userModel.name}',
          ),
          body: VoiceCallBody(
            photoUrl: contactModel.photo!,
            name: contactModel.name!,
          ),
        ),
      ),
    );
  }
}
