import 'package:flutter/material.dart';

extension Nav on BuildContext {
  void push(Widget target) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => target));
  }

  void pushAndRemoveUntil(Widget target) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (_) => target),
      (route) => false,
    );
  }
}