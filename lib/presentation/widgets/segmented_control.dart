import 'package:flutter/cupertino.dart';

import '../theme/colors.dart';

class SegmentedControl extends StatefulWidget {
  final List<String> labels;
  final int? initialValue;
  final Function(int index)? onValueChanged;

  const SegmentedControl({
    super.key,
    required this.labels,
    this.initialValue,
    this.onValueChanged,
  });

  @override
  State<SegmentedControl> createState() => _SegmentedControlState();
}

class _SegmentedControlState extends State<SegmentedControl> {
  int _selectedValue = 0;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return CupertinoSlidingSegmentedControl<int>(
        groupValue: _selectedValue,
        backgroundColor: kGreyscale10,
        children: {
          for (int i = 0; i < widget.labels.length; i++)
            i: SizedBox(
              width: constraint.maxWidth,
              child: Text(
                widget.labels[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: _selectedValue == i ? kGreyscale80 : kGreyscale50,
                ),
              ),
            ),
        },
        onValueChanged: (value) {
          setState(() {
            _selectedValue = value!;
            widget.onValueChanged?.call(value);
          });
        },
      );
    });
  }
}
