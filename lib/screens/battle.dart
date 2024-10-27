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
    // The width of the current Device.
    double screenWidth = MediaQuery.of(context).size.width;
    // Method that show the winner and helps to restart the game.
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
                style: TextStyle(
                    color: Colors.white, fontSize: screenWidth * 0.075),
              ),
              SizedBox(
                width: screenWidth * 0.028,
              ),
            ],
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Click restart to start over.",
                  style: TextStyle(
                      color: Colors.white, fontSize: screenWidth * 0.045)),
            ],
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: winner == "Blue" ? Colors.blue[800] : Colors.red[900]),
              child: TextButton(
                  onPressed: () {
                    // Restarting button which helps to start the game over.
                    BlocProvider.of<RedClicker>(context).restart();
                    BlocProvider.of<BlueClicker>(context).restart();
                    Navigator.pop(context);
                  },
                  child: Text("Restart",
                      style: TextStyle(
                          color: Colors.white, fontSize: screenWidth * 0.046))),
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
          // Blue Player's Side
          Expanded(
            child: BlocBuilder<BlueClicker, double>(
                builder: (context, state) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (state < screenWidth * 0.05) {
                          showAlertDialog("Blue");
                        }
                        BlocProvider.of<BlueClicker>(context).increment();
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
          // Line in the center of the Screen
          Divider(
            thickness: screenWidth * 0.015,
            color: Colors.black,
            height: screenWidth * 0.01,
          ),
          // Red Player's Side
          Expanded(
            child: BlocBuilder<RedClicker, double>(
                builder: (context, state) => GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        if (state < screenWidth * 0.05) {
                          showAlertDialog("Red");
                        }
                        BlocProvider.of<RedClicker>(context).increment();
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
