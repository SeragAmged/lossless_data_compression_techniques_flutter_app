import 'package:compression/models/lossless_compression_model.dart';
import 'package:compression/modules/techniques_list.dart';
import 'package:compression/shared/cubit/cubit.dart';
import 'package:compression/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsScreen extends StatelessWidget {
  final Compression model;
  const ResultsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        Map<String, dynamic> values = {
          "Encoded message": model.encodedMessage,
          "Encoded value": model.encodedValue,
          "Golomb encoded": model.golombEncoded,
          "m": model.m,
          "n": model.n,
          "Bits after compression": model.bitsAfterCompression,
          "Bits before compression": model.bitsBeforeCompression,
          "Average length": model.averageLength,
          "Compression ratio": model.compressionRatio,
          "Efficiency": model.efficiency,
        };

        return Scaffold(
          appBar: AppBar(
            title: Text(model.name!),
            leading: IconButton(
              onPressed: () => cubit.changeScreen(const TechniquesListView()),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: values.entries.map((entry) {
                return entry.value != null
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Text(
                              entry.key,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(height: 20),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                entry.value.toString(),
                                style: const TextStyle(fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox();
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
