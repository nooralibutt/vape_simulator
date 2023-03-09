import 'package:flutter/material.dart';
import 'package:vape_simulator/models/items.dart';
import 'package:vape_simulator/utils/my_audio_player.dart';
import 'package:vape_simulator/widgets/custom_dialog.dart';

class PurchaseItemScreen extends StatelessWidget {
  static const String routeName = "/PurchaseItemScreen";
  const PurchaseItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900);
    final allFlavour = Item.allFlavour;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: const IconThemeData.fallback(),
        title: const Text('Items'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              physics: const BouncingScrollPhysics(),
              itemCount: allFlavour.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(allFlavour[index].flavour, style: style),
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
          ],
        ),
      ),
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

  void _dialogClose(BuildContext context) {
    Navigator.pop(context);
    MyAudioPlayer.instance.playButtonTapSound();
  }
}
