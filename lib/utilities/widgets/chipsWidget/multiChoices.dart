import 'package:flutter/material.dart';
import 'package:luna_learning/utilities/widgets/chipsWidget/chipWidget.dart';



class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final List<String> selectedReportList;

  final Function(List<String>) onSelectionChanged;
  MultiSelectChip(this.reportList ,{this.onSelectionChanged,this.selectedReportList});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}



class _MultiSelectChipState extends State<MultiSelectChip> {

  _buildChoiceList() {
    List<Widget> choices = [];


    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.only(right: 12,top: 0,bottom: 4),
        child: ChipWidget(isSelected2: widget.selectedReportList.contains(item),title: item,onTap: (selected) {
          setState(() {


            for(int i=0;i<widget.reportList.length;i++){
              if(  widget.selectedReportList.contains(item)){
                widget.selectedReportList.clear();
                widget.selectedReportList.add(item);



              }else{
                widget.selectedReportList.add(item);
              }
            }



            widget.onSelectionChanged( widget.selectedReportList);
          });
        },),

      ));
    });

    return choices;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,

      children: _buildChoiceList(),
    );
  }
}