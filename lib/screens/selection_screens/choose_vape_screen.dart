import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/base_scaffold.dart';
import 'package:vape_simulator/widgets/my_elevated_button.dart';

class ChooseVapeScreen extends StatefulWidget {
  const ChooseVapeScreen({Key? key}) : super(key: key);

  @override
  State<ChooseVapeScreen> createState() => _ChooseVapeScreenState();
}

class _ChooseVapeScreenState extends State<ChooseVapeScreen> {
  final controller = PageController();

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
                        children: List.generate(
                          3,
                          (index) => Image.asset(
                              'assets/images/vapes/${index + 1}.png'),
                        ),
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
      floatingActionButton: MyElevatedButton(title: 'Select', onPress: () {}),
    );
  }
}
