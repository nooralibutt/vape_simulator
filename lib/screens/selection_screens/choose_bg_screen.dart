import 'package:flutter/material.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/base_scaffold.dart';

class ChooseBgScreen extends StatelessWidget {
  const ChooseBgScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Column(
        children: [
          const VerticalSpacing(),
          Text(
            'Choose Background',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 28),
          ),
        ],
      ),
    );
  }
}
