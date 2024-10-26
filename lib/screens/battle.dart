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
    void showAlertDialog(String winner) {
      showDialog(
        barrierColor: Colors.black26,
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${winner == "Blue" ? "🔵" : "🔴"} Wins!",
                style: const TextStyle(color: Colors.white, fontSize: 29),
              ),
            ],
          ),
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Click restart to start over.",
                  style: TextStyle(color: Colors.white, fontSize: 17)),
            ],
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: winner == "Blue" ? Colors.blue[800] : Colors.red[900]),
              child: TextButton(
                  onPressed: () {
                    BlocProvider.of<RedClicker>(context).restart();
                    BlocProvider.of<BlueClicker>(context).restart();
                    Navigator.pop(context);
                  },
                  child: const Text("Restart",
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE8E9F3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: BlocBuilder<BlueClicker, double>(
                builder: (context, state) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        BlocProvider.of<BlueClicker>(context).increment();
                        if (state == 0) {
                          showAlertDialog("Blue");
                        }
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              color: Colors.blue[800],
                            ),
                          ),
                          SizedBox(
                            height: state,
                          ),
                        ],
                      ),
                    )),
          ),
          const Divider(
            thickness: 6,
            color: Colors.black,
            height: 4,
          ),
          Expanded(
            child: BlocBuilder<RedClicker, double>(
                builder: (context, state) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        BlocProvider.of<RedClicker>(context).increment();
                        if (state == 0) {
                          showAlertDialog("Red");
                        }
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: state,
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              color: Colors.red[700],
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
