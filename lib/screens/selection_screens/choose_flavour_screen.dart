import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/base_scaffold.dart';
import 'package:vape_simulator/widgets/my_elevated_button.dart';

class ChooseFlavourScreen extends StatelessWidget {
  static const String routeName = "/ChooseFlavourScreen";
  const ChooseFlavourScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final flavourNames = [
      'Strawberry',
      'Apple',
      'Blue Berry',
      'Guava',
      'Mint',
      'Chocolate',
    ];

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
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20,
                        ),
                        children: List.generate(
                          6,
                          (index) => Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                    'assets/images/flavours/${index + 1}.png'),
                              ),
                              const VerticalSpacing(of: 20),
                              Text(flavourNames[index]),
                            ],
                          ),
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
