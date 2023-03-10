import 'package:easy_service_manager/easy_service_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vape_simulator/provider/purchase_item_provider.dart';
import 'package:vape_simulator/screens/game/components/FlavourJuiceContainer.dart';
import 'package:vape_simulator/screens/selection_screens/choose_flavour_screen.dart';
import 'package:vape_simulator/utils/my_audio_player.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/base_scaffold.dart';
import 'package:vape_simulator/widgets/custom_dialog.dart';
import 'package:vape_simulator/widgets/smoke.dart';

class GameScreen extends StatelessWidget {
  static const String routeName = "/GameScreen";
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<GameProvider>();
    return Scaffold(
      body: BgImage(
        imagePath: 'assets/images/backgrounds/${provider.backgroundImg}.png',
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset('assets/images/dollar.png', height: 50),
                    const HorizontalSpacing(),
                    Selector<GameProvider, int>(
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
                bottom: 80,
                left: 20,
                child: GestureDetector(
                    onTap: () => soundControlsDialog(context),
                    child:
                        Image.asset('assets/images/settings.png', height: 50)),
              ),
              Positioned(
                bottom: 180,
                right: 20,
                child: GestureDetector(
                  onTap: () {
                    rewardedDialog(
                        context: context,
                        title: 'Earn Points',
                        message:
                            'Would you like to watch a Video Ad to earn 200 extra Vape points',
                        onTap: (context) =>
                            context.read<GameProvider>().earnMoney(context));
                  },
                  child: Image.asset('assets/images/ads.png', height: 50),
                ),
              ),
              Positioned(
                bottom: 80,
                right: 20,
                child: GestureDetector(
                  onTap: () => moveToCartScreen(context),
                  child: Image.asset('assets/images/cart.png', height: 50),
                ),
              ),
              Positioned(
                left: 0.38.sw,
                height: 1800.h,
                bottom: 250.h,
                child: VapeWidget(provider),
              ),
              Selector<GameProvider, bool>(
                selector: (_, provider) => provider.smoke,
                builder: (_, isShowSmoke, __) {
                  if (isShowSmoke) {
                    return Positioned(
                      top: -115,
                      left: 0,
                      right: 0,
                      child: SmokeParticles(
                        size: MediaQuery.of(context).size,
                        color: provider.getItem.color,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: EasyServicesManager.instance.showBannerAd())
            ],
          ),
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

class VapeWidget extends StatelessWidget {
  final GameProvider provider;
  const VapeWidget(this.provider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/vapes/${provider.vapeImg}.png'),
        Positioned(
          bottom: 1200.h,
          width: 200,
          child: Selector<GameProvider, double>(
            selector: (_, provider) => provider.flavour,
            builder: (_, flavour, __) {
              return FlavourJuiceContainer(flavour: flavour.h);
            },
          ),
        ),
        Positioned(
          bottom: 500.h,
          left: 0,
          right: 0,
          child: GestureDetector(
            onLongPressStart: (_) => onTap(context),
            onLongPressEnd: (_) => provider.onEnd(),
            child: Image.asset('assets/images/power_btn.png', height: 60),
          ),
        ),
      ],
    );
  }

  void onTap(BuildContext context) async {
    if (provider.isflavourFinished()) {
      Navigator.pushNamed(context, ChooseFlavourScreen.routeName);
    } else {
      provider.onPress();
    }
  }
}
