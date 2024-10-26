import 'package:click_battle/block/blue_clicker.dart';
import 'package:click_battle/block/red_clicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BattleScreen extends StatelessWidget {
  const BattleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: BlocBuilder<BlueClicker, double>(
                builder: (context, state) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: BlocProvider.of<BlueClicker>(context).increment,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              color: Colors.blue[900],
                            ),
                          ),
                          SizedBox(
                            height: state,
                          ),
                        ],
                      ),
                    )),
          ),
          Expanded(
            child: BlocBuilder<RedClicker, double>(
                builder: (context, state) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: BlocProvider.of<RedClicker>(context).increment,
                      child: Column(
                        children: [
                          SizedBox(
                            height: state,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              color: Colors.red[900],
                            ),
                          ),
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
