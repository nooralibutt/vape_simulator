import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vape_simulator/provider/purchase_item_provider.dart';

class FlavourJuiceContainer extends StatelessWidget {
  final double flavour;
  const FlavourJuiceContainer({required this.flavour, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<PurchaseItemProvider>(context).getItem;
    return Container(height: flavour, color: item.color.withOpacity(0.6));
  }
}
