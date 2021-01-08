import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum _buttonProps { icon, rotation }

class CustomBTN extends StatelessWidget {
  final bool pressed;
  final Function onPressed;

  CustomBTN({this.pressed, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var tween = MultiTween<_buttonProps>()
      ..add(
          _buttonProps.icon, ConstantTween(Icons.arrow_left), 500.milliseconds)
      ..add(_buttonProps.icon, ConstantTween(Icons.arrow_upward_outlined),
          500.milliseconds)
      ..add(_buttonProps.rotation, (-pi / 2).tweenTo(0.0), 1.seconds);

    return CustomAnimation<MultiTweenValues<_buttonProps>>(
      control: pressed
          ? CustomAnimationControl.PLAY
          : CustomAnimationControl.PLAY_REVERSE,
      startPosition: pressed ? 1.0 : 0.0,
      duration: tween.duration * 1.2,
      tween: tween,
      curve: Curves.easeInOut,
      builder: _buildSwitchBox,
    );
  }

  Widget _buildSwitchBox(context, child, MultiTweenValues<_buttonProps> value) {
    return  Icon(value.get(_buttonProps.icon));
  }
}
