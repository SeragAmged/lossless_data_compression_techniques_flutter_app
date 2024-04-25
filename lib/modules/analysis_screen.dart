import 'package:compression/models/analysis_model.dart';
import 'package:compression/modules/input_message_view.dart';
import 'package:compression/shared/cubit/cubit.dart';
import 'package:compression/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisScreen extends StatelessWidget {
  final AnalysisModel model;
  const AnalysisScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        const List<String> titles = [
          "Average Length",
          "bits Before Encoding",
          "Entropy",
        ];
        List<dynamic> values = [
          model.averageLength!,
          model.bitsBeforeEncoding!,
          model.entropy!,
        ];
        final probabilityOfOccurrenceValues =
            model.probabilityOfOccurrence!.values.toList();
        final probabilityOfOccurrenceKeys =
            model.probabilityOfOccurrence!.keys.toList();
        return Scaffold(
          appBar: AppBar(
            title: const Text("Message Analysis"),
            leading: IconButton(
              onPressed: () => cubit.changeScreen(const InputMessageView()),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                      titles.length,
                      (index) => Row(
                        children: [
                          Text(
                            titles[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${values[index]}",
                            style: const TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ) +
                    [
                      const SizedBox(height: 20),
                      const Text(
                        "Probability of occurrence",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: probabilityOfOccurrenceKeys.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (context, index) => Row(
                          children: [
                            Text(
                              probabilityOfOccurrenceKeys[index],
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "${probabilityOfOccurrenceValues[index]}",
                              style: const TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
              ),
            ),
          ),
        );
      },
    );
  }
}
