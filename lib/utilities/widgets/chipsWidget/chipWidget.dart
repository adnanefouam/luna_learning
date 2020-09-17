import 'package:flutter/material.dart';
import 'package:luna_learning/utilities/styles.dart';

class ChipWidget extends StatefulWidget {
  const ChipWidget(
      {Key key, @required this.isSelected2, this.onTap, this.title})
      : super(key: key);

  final bool isSelected2;
  final Function onTap;
  final String title;

  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      backgroundColor: Colors.black,
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          widget.title,
          style: !widget.isSelected2
              ? bigText.copyWith(
                  color: secondarycolor,
                  fontWeight: FontWeight.w600,
                  fontSize: 11)
              : smallText.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 11),
        ),
      ),
      labelStyle:
          TextStyle(color: widget.isSelected2 ? Colors.black : Colors.white),
      selected: widget.isSelected2,
      shape: !widget.isSelected2
          ? StadiumBorder(side: BorderSide(color: secondarycolor))
          : StadiumBorder(side: BorderSide(color: Colors.transparent)),
      onSelected: widget.onTap,
      selectedColor: secondarycolor,
    );
  }
}
