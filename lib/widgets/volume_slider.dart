import 'dart:async';

import 'package:flutter/material.dart';
import 'package:volume_control/volume_control.dart';

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({Key? key}) : super(key: key);

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double _val = 0.2;

  void initVolumeState() async {
    if (!mounted) return;
    _val = await VolumeControl.volume;
    setState(() {});
  }

  Timer timer = Timer(const Duration(milliseconds: 1), () {});
  @override
  void initState() {
    initVolumeState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Slider(
          value: _val,
          min: 0,
          max: 1,
          activeColor: Colors.white,
          thumbColor: Colors.grey,
          divisions: 100,
          onChanged: (val) {
            setState(() => _val = val);
            timer.cancel();
            timer = Timer(const Duration(milliseconds: 200), () {
              VolumeControl.setVolume(val);
            });
          }),
    );
  }
}
