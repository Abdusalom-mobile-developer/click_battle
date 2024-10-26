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
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 27),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: winner == "Blue" ? Colors.blue[800] : Colors.red[900],
                ),
                child: Text(
                  winner,
                  style: const TextStyle(color: Colors.white, fontSize: 29),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              const Text(
                "Wins 🎉",
                style: TextStyle(color: Colors.white, fontSize: 29),
              ),
            ],
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.width / 6,
          ),
          actions: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle,  color: winner == "Blue" ? Colors.blue[800] : Colors.red[900]),
              child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<RedClicker>(context).restart();
                    BlocProvider.of<BlueClicker>(context).restart();
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.refresh_outlined,
                      size: MediaQuery.of(context).size.width / 10,
                      color:
                         Colors.white)),
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
                        if (state < 1) {
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
          Expanded(
            child: BlocBuilder<RedClicker, double>(
                builder: (context, state) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        BlocProvider.of<RedClicker>(context).increment();
                        if (state < 1) {
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
