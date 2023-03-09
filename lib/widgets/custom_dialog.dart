import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vape_simulator/models/items.dart';
import 'package:vape_simulator/provider/purchase_item_provider.dart';
import 'package:vape_simulator/utils/my_audio_player.dart';
import 'package:vape_simulator/utils/prefs.dart';
import 'package:vape_simulator/utils/size_config.dart';
import 'package:vape_simulator/widgets/constants.dart';
import 'package:vape_simulator/widgets/volume_slider.dart';

class MusicDialog extends StatelessWidget {
  final String text;
  const MusicDialog({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium!.copyWith(
        fontSize: 30, color: Colors.white, fontWeight: FontWeight.w900);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: ElevatedButton(
            onPressed: () => _dialogClose(context),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(5),
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            child: const Icon(Icons.cancel, size: 50),
          ),
        ),
        Text(text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.w900)),
        const VerticalSpacing(of: 100),
        Text('Volume', style: style),
        const VerticalSpacing(of: 30),
        const VolumeSlider()
      ],
    );
  }

  void _dialogClose(BuildContext context) {
    Navigator.pop(context);
    MyAudioPlayer.instance.playButtonTapSound();
  }
}

Future rewardedDialog(
    {required BuildContext context,
    required String title,
    required String message,
    required BuildContextCallback onTap}) {
  final style = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: 14.sp, color: Colors.blue, fontWeight: FontWeight.w900);
  // set up the button
  Widget okButton = TextButton(
    child: const Text("Watch Ad"),
    onPressed: () => onTap(context),
  );
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () => Navigator.of(context).pop(),
  );

  AlertDialog alert = AlertDialog(
    title: Text(title,
        style: style.copyWith(fontSize: 22, fontWeight: FontWeight.w500)),
    backgroundColor: Colors.grey.withOpacity(0.3),
    content: Text(message,
        style: style.copyWith(
            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
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

void buyItem(BuildContext context, Item item) {
  final score = Prefs.instance.getScore();
  Navigator.of(context).pop();
  if (score >= item.buy) {
    final provider = context.read<PurchaseItemProvider>();
    provider.item = item;
    provider.decrementPrice(item.buy);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("You Don't have Enough Points"),
    ));
  }
  Navigator.of(context).pop();
}
