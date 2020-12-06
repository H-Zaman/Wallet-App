import 'package:flutter/material.dart';
import 'package:mobile_bank_ui_concept/resource/resource.dart';

class CustomNavRailItem extends StatelessWidget {
  final bool selected;
  final String label;
  CustomNavRailItem({
    @required this.selected,
    @required this.label
});
  @override
  Widget build(BuildContext context) {
    final Duration duration = Duration(milliseconds: 300);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: duration,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                  color: selected ? Colors.black : Colors.grey[400]
                ),
              ),
            ),
            SizedBox(height: 2.5,),
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
        ),
      ),
    );
  }
}
