import 'package:compression/modules/analysis_screen.dart';
import 'package:compression/modules/techniques_list.dart';
import 'package:compression/shared/cubit/cubit.dart';
import 'package:compression/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputMessageView extends StatelessWidget {
  const InputMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Input message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Colors.redAccent,
                    onPressed: () => AppCubit.get(context).changeScreen(
                      AnalysisScreen(
                        model: AppCubit.get(context).analysisModel,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Analyze",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: MaterialButton(
                    onPressed: () => AppCubit.get(context).changeScreen(
                      TechniquesListView(
                          model: AppCubit.get(context).compressionModel),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Compress",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
