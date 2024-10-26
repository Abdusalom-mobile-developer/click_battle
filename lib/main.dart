import 'package:click_battle/block/blue_clicker.dart';
import 'package:click_battle/block/red_clicker.dart';
import 'package:click_battle/screens/battle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final halfHeightOfCurrentDevice =
        MediaQuery.of(context).size.height / 2 - 2;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlueClicker(halfHeightOfCurrentDevice),
        ),
        BlocProvider(
          create: (context) => RedClicker(halfHeightOfCurrentDevice),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BattleScreen(),
      ),
    );
  }
}
