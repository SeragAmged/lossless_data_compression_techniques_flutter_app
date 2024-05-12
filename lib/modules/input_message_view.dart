import 'package:compression/modules/analysis_screen.dart';
import 'package:compression/modules/techniques_list.dart';
import 'package:compression/shared/cubit/cubit.dart';
import 'package:compression/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputMessageView extends StatelessWidget {
  const InputMessageView({super.key});

  static final _messageController = TextEditingController();
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
              controller: _messageController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      AppCubit.get(context).compress(_messageController.text);
                    },
                    icon: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                      ),
                    )),
                hintText: "Input message",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (state is Loading)
              const CircularProgressIndicator(
                color: Colors.redAccent,
              )
            else if (AppCubit.get(context).model != null)
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.redAccent,
                      onPressed: () => AppCubit.get(context).changeScreen(
                        const TechniquesListView(),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Compress",
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
                        const AnalysisScreen(),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Analyze",
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
