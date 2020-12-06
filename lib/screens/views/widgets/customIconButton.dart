import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bank_ui_concept/resource/resource.dart';

class CustomIconButton extends StatelessWidget {
  final bool selected;
  final String title;
  final IconData icon;
  CustomIconButton({
    @required this.selected,
    @required this.icon,
    @required this.title,
});
  @override
  Widget build(BuildContext context) {
    final Duration duration = Duration(milliseconds: 300);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          children: [
            ClipRect(
              clipBehavior: Clip.hardEdge,
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: new AnimatedContainer(
                  duration: duration,
                  height: 60,
                  width: 60,
                  decoration: new BoxDecoration(
                      color: selected ? Resources.blueColor.withOpacity(.85) : Colors.grey.shade200.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: AnimatedContainer(
                duration: duration * 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    icon,
                    size: 30,
                    color: selected ? Colors.white : Resources.pinkish,
                  ),
                ),
              ),
            ),
          ],
        ),
        AnimatedContainer(
          duration: duration,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              fontSize: 18
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Icon(
            Icons.circle,
            size: 12,
            color: Resources.blueColor.withOpacity(.85),
          ),
          secondChild: SizedBox(),
          crossFadeState: selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: duration
        )
      ],
    );
  }
}
