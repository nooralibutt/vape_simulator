import 'package:easy_service_manager/easy_service_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vape_simulator/provider/purchase_item_provider.dart';
import 'package:vape_simulator/screens/selection_screens/choose_flavour_screen.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/base_scaffold.dart';
import 'package:vape_simulator/widgets/my_elevated_button.dart';

class ChooseVapeScreen extends StatefulWidget {
  static const String routeName = "/ChooseVapeScreen";
  const ChooseVapeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseVapeScreen> createState() => _ChooseVapeScreenState();
}

class _ChooseVapeScreenState extends State<ChooseVapeScreen> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32.r)),
                    color: Colors.white.withOpacity(0.15)),
                child: Column(
                  children: [
                    const VerticalSpacing(),
                    Text(
                      'Select Vape',
                      style:
                          theme.textTheme.titleMedium!.copyWith(fontSize: 22),
                    ),
                    const VerticalSpacing(),
                    Expanded(
                      child: PageView(
                        controller: controller,
                        onPageChanged: (index) =>
                            context.read<GameProvider>().vapeImg = index + 1,
                        children: List.generate(
                          4,
                          (index) => Image.asset(
                              'assets/images/vapes/${index + 1}.png'),
                        ),
                      ),
                    ),
                    const VerticalSpacing(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.arrow_circle_left),
                          Icon(Icons.arrow_circle_right),
                        ],
                      ),
                    ),
                    const VerticalSpacing(of: 280),
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
          onPress: () {
            EasyServicesManager.instance.showCountedInterstitialAd();
            Navigator.pushReplacementNamed(
                context, ChooseFlavourScreen.routeName);
          }),
    );
  }
}
