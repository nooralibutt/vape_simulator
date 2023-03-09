import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vape_simulator/provider/purchase_item_provider.dart';
import 'package:vape_simulator/screens/selection_screens/choose_flavour_screen.dart';
import 'package:vape_simulator/utils/my_audio_player.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/base_scaffold.dart';
import 'package:vape_simulator/widgets/custom_dialog.dart';

class GameScreen extends StatelessWidget {
  static const String routeName = "/GameScreen";
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImage(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset('assets/images/dollar.png', height: 50),
                  const HorizontalSpacing(),
                  Selector<PurchaseItemProvider, int>(
                    selector: (context, provider) => provider.saveScore,
                    builder: (_, score, __) {
                      return Text(
                        score.toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              child: GestureDetector(
                  onTap: () => soundControlsDialog(context),
                  child: Image.asset('assets/images/settings.png', height: 50)),
            ),
            Positioned(
              bottom: 50,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  moveToCartScreen(context);
                  // rewardedDialog(
                  //   context: context,
                  //   title: 'Earn Points',
                  //   message:
                  //       'Would you like to watch a Video Ad to earn 200 extra Vape points',
                  //   onTap: (context) => context
                  //       .read<PurchaseItemProvider>()
                  //       .earnMoney(context));
                },
                child: Image.asset('assets/images/cart.png', height: 50),
              ),
            ),
            Positioned(
              left: 0.35.sw,
              right: 0.35.sw,
              bottom: 200.h,
              child: Image.asset('assets/images/vapes/2.png'),
            ),
            Positioned(
              bottom: 700.h,
              left: 0.35.sw,
              right: 0.35.sw,
              child: GestureDetector(
                  onTap: () => soundControlsDialog(context),
                  child:
                      Image.asset('assets/images/power_btn.png', height: 50)),
            ),
          ],
        ),
      ),
    );
  }

  void soundControlsDialog(BuildContext context) {
    MyAudioPlayer.instance.playButtonTapSound();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const MusicDialog(text: 'Sound Controls'));
  }

  void moveToCartScreen(BuildContext context) {
    MyAudioPlayer.instance.playButtonTapSound();
    Navigator.pushReplacementNamed(context, ChooseFlavourScreen.routeName);
  }
}
