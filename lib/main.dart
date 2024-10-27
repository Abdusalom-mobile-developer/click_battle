import 'package:click_battle/block/blue_clicker.dart';
import 'package:click_battle/block/red_clicker.dart';
import 'package:click_battle/screens/battle.dart';
import 'package:click_battle/screens/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const MyApp());

final GoRouter router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 700),
      child: const IntroScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.bounceIn).animate(animation),
        child: child,
      ),
    ),
  ),
  GoRoute(
    path: "/battle_screen",
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 700),
      child: const BattleScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.bounceIn).animate(animation),
        child: child,
      ),
    ),
  ),
]);

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final halfHeightOfCurrentDevice = MediaQuery.of(context).size.height / 2 -
        MediaQuery.of(context).size.width * 0.005;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BlueClicker(halfHeightOfCurrentDevice),
        ),
        BlocProvider(
          create: (context) => RedClicker(halfHeightOfCurrentDevice),
        )
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
