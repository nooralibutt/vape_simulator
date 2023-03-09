import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vape_simulator/models/items.dart';
import 'package:vape_simulator/screens/game/game_screen.dart';
import 'package:vape_simulator/utils/my_audio_player.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/base_scaffold.dart';
import 'package:vape_simulator/widgets/custom_dialog.dart';
import 'package:vape_simulator/widgets/my_elevated_button.dart';

class ChooseFlavourScreen extends StatelessWidget {
  static const String routeName = "/ChooseFlavourScreen";
  const ChooseFlavourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final allFlavour = Item.allFlavour;
    final style = Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 14, color: Colors.white, fontWeight: FontWeight.w900);

    return Scaffold(
      body: BgImage(
        child: Column(
          children: [
            const VerticalSpacing(of: 60),
            Text(
              'Choose',
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 28),
            ),
            const VerticalSpacing(of: 40),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32.r)),
                    color: Colors.white.withOpacity(0.15)),
                child: Column(
                  children: [
                    const VerticalSpacing(),
                    Text(
                      'Select Flavour',
                      style:
                          theme.textTheme.titleMedium!.copyWith(fontSize: 22),
                    ),
                    const VerticalSpacing(),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20.0),
                        physics: const BouncingScrollPhysics(),
                        itemCount: allFlavour.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12.0,
                                mainAxisSpacing: 25.0),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              child: Container(
                                width: 250,
                                height: 350,
                                color: Colors.grey.withOpacity(0.4),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(allFlavour[index].flavour,
                                          style: style),
                                      Container(
                                          width: 50,
                                          height: 70,
                                          color: allFlavour[index].color),
                                      Text('Buy For \$${allFlavour[index].buy}',
                                          style: style),
                                    ]),
                              ),
                              onTap: () async {
                                MyAudioPlayer.instance.playButtonTapSound();
                                await purchaseConfirmDialogbox(
                                    context,
                                    'Shopping',
                                    'Would you like to Equip ${allFlavour[index].flavour}',
                                    allFlavour[index]);
                              });
                        },
                      ),
                    ),
                    const VerticalSpacing(of: 300),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: MyElevatedButton(
          title: 'Select',
          onPress: () =>
              Navigator.pushReplacementNamed(context, GameScreen.routeName)),
    );
  }

  Future purchaseConfirmDialogbox(
      BuildContext context, String title, String message, Item item) {
    final style = Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w900);
    // set up the button
    Widget okButton = TextButton(
      child: const Text("Yes"),
      onPressed: () => buyItem(context, item),
    );
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () => Navigator.of(context).pop(),
    );

    AlertDialog alert = AlertDialog(
      title: Text(title, style: style.copyWith(fontSize: 30)),
      backgroundColor: Colors.grey.withOpacity(0.3),
      content: Text(message,
          style: style.copyWith(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white)),
      actions: [okButton, cancelButton],
    );

    return showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.6),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
