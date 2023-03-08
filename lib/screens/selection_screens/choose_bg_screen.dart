import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/base_scaffold.dart';
import 'package:vape_simulator/widgets/my_elevated_button.dart';

class ChooseBgScreen extends StatelessWidget {
  const ChooseBgScreen({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32.r)),
                    color: Colors.white.withOpacity(0.15)),
                child: Column(
                  children: [
                    const VerticalSpacing(of: 40),
                    Text(
                      'Select Background',
                      style:
                          theme.textTheme.titleMedium!.copyWith(fontSize: 22),
                    ),
                    const VerticalSpacing(of: 40),
                    const Expanded(child: BgImageListView()),
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

class BgImageListView extends StatelessWidget {
  const BgImageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(
        6,
        (index) => Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 500.h,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgrounds/${index + 1}.png'),
              fit: BoxFit.fitWidth,
            ),
            borderRadius: BorderRadius.all(Radius.circular(32.r)),
            border: Border.all(color: Colors.white, width: 4),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}