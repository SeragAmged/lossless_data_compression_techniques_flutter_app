import 'package:compression/models/compression_model.dart';
import 'package:flutter/material.dart';
import 'package:compression/modules/input_message_view.dart';
import 'package:compression/shared/cubit/cubit.dart';
import 'package:compression/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechniquesListView extends StatelessWidget {
  final CompressionsModel model;
  const TechniquesListView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Message Analysis"),
            leading: IconButton(
              onPressed: () =>
                  AppCubit.get(context).changeScreen(const InputMessageView()),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(18.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {},
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
                      model.techniques![index].name!,
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
        );
      },
    );
  }
}
