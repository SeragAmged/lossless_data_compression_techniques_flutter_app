import 'dart:developer';

import 'package:compression/models/lossless_compression_model.dart';
import 'package:compression/modules/input_message_view.dart';
import 'package:compression/shared/api/dio_helper.dart';
import 'package:compression/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Widget currentScreen = const InputMessageView();

  void changeScreen(Widget newScreen) {
    currentScreen = newScreen;
    emit(ChangeScreenState());
  }

  LosslessCompressionModel? model;
  void compress(String message) {
    emit(Loading());
    DioHelper.post(path: "/compress", message: {"message": message})
        .then((value) {
      emit(Success());

      model = LosslessCompressionModel.fromJson(value.data);
      log('value: ${value.data}');
      return;
    });
  }
}
