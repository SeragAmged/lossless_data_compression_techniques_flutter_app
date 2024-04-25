import 'package:compression/models/analysis_model.dart';
import 'package:compression/models/compression_model.dart';
import 'package:compression/modules/input_message_view.dart';
import 'package:compression/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  AnalysisModel analysisModel = AnalysisModel(
      averageLength: 4.5,
      bitsBeforeEncoding: 16,
      entropy: 3.5,
      probabilityOfOccurrence: {
        "a": 0.5,
        "b": 0.25,
        "c": 0.25,
      });
  CompressionsModel compressionModel = CompressionsModel(
    techniques: [
      Technique.fromJson(
        {
          "name": "LZW",
          "bitsAfterEncoding": 0.25,
          "compressionRatio": 0.25,
          "efficiency": 0.25,
        },
      ),
      Technique.fromJson(
        {
          "name": "Huffman",
          "bitsAfterEncoding": 0.25,
          "compressionRatio": 0.25,
          "efficiency": 0.25,
        },
      ),
      Technique.fromJson(
        {
          "name": "Golomb",
          "bitsAfterEncoding": 0.25,
          "compressionRatio": 0.25,
          "efficiency": 0.25,
        },
      ),
      Technique.fromJson(
        {
          "name": "T3",
          "bitsAfterEncoding": 0.25,
          "compressionRatio": 0.25,
          "efficiency": 0.25,
        },
      ),
      Technique.fromJson(
        {
          "name": "T4",
          "bitsAfterEncoding": 0.25,
          "compressionRatio": 0.25,
          "efficiency": 0.25,
        },
      )
    ],
  );

  Widget currentScreen = const InputMessageView();

  void changeScreen(Widget newScreen) {
    currentScreen = newScreen;
    emit(ChangeScreenState());
  }
}
