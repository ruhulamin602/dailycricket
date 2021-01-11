import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _buttonProps { icon, rotation }

class CustomBTN extends StatelessWidget {
  final Function onPressed;
  final IconData icon1;
  final IconData icon2;
  final bool isPresed;
  CustomBTN({this.onPressed, this.icon1, this.icon2, this.isPresed});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTween<_buttonProps>()
      ..add(_buttonProps.icon, ConstantTween(icon1), 500.milliseconds)
      ..add(_buttonProps.icon, ConstantTween(icon2), 500.milliseconds)
      ..add(_buttonProps.rotation, (3*pi / 2).tweenTo(0.0), 1.seconds);

    return CustomAnimation<MultiTweenValues<_buttonProps>>(
      control: isPresed
          ? CustomAnimationControl.PLAY
          : CustomAnimationControl.PLAY_REVERSE,
      startPosition: isPresed ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildSwitchBox,
    );
  }

  Widget _buildSwitchBox(context, child, MultiTweenValues<_buttonProps> value) {
    return Icon(value.get(_buttonProps.icon));
  }
}
