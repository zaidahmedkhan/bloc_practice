import 'package:bloc_practice/bloc/switch/switch_bloc.dart';
import 'package:bloc_practice/bloc/switch/switch_event.dart';
import 'package:bloc_practice/bloc/switch/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Switch Screen")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notifications"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: true,
                      onChanged: (newValue) {
                        context.read<SwitchBloc>().add(
                          EnableOrDisableNotification(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Container(
                  height: 20,
                  color: Colors.red.withOpacity(state.slider),
                );
              },
            ),

            const SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (newValue) {
                    context.read<SwitchBloc>().add(
                      SliderEvent(slider: newValue),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
