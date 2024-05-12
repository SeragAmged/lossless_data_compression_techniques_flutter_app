import 'package:compression/modules/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:compression/modules/input_message_view.dart';
import 'package:compression/shared/cubit/cubit.dart';
import 'package:compression/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechniquesListView extends StatelessWidget {
  const TechniquesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Message Compression Techniques"),
            leading: IconButton(
              onPressed: () =>
                  AppCubit.get(context).changeScreen(const InputMessageView()),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: AppCubit.get(context).model!.compressions!.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () => AppCubit.get(context).changeScreen(
                        ResultsScreen(
                            model: AppCubit.get(context)
                                .model!
                                .compressions![index]),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          AppCubit.get(context)
                                  .model!
                                  .compressions![index]
                                  .name ??
                              "",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  const Text(
                    "Best Algorithm is",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.redAccent,
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          AppCubit.get(context).model!.bestAlgorithm!,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
