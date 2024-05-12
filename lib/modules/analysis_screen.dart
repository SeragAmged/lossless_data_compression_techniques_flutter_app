import 'package:compression/modules/input_message_view.dart';
import 'package:compression/shared/cubit/cubit.dart';
import 'package:compression/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        const List<String> titles = [
          "bits Before Encoding",
          "Entropy",
        ];
        List<dynamic> values = [
          cubit.model!.analysis!.bits,
          cubit.model!.analysis!.entropy,
        ];
        final probabilityOfOccurrenceValues =
            cubit.model!.analysis!.probabilities!.values.toList();
        final probabilityOfOccurrenceKeys =
            cubit.model!.analysis!.probabilities!.keys.toList();
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
                      (index) {
                        if (values[index] != null) {
                          return Row(
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
                          );
                        }
                        return const SizedBox();
                      },
                    ) +
                    [
                      const SizedBox(height: 20),
                      const Text(
                        "Probability of occurrence",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: probabilityOfOccurrenceKeys.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemBuilder: (context, index) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.redAccent,
                                child: Text(
                                  probabilityOfOccurrenceKeys[index],
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "${probabilityOfOccurrenceValues[index]}",
                                style: const TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
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
