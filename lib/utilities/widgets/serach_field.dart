import 'package:flutter/material.dart';

import '../styles.dart';

class SearchFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.white.withOpacity(0.1)),
          color: Color(0XFF353535),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: TextField(
            cursorColor: glassyColor,
            decoration: InputDecoration(
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(height: 20,width: 1,color: glassyColor.withOpacity(0.3),),
                  Icon(
                    Icons.mic_none,
                    color: glassyColor.withOpacity(0.3),
                    size: 20,

                  ),
                ],
              ),
              icon: Icon(

                Icons.search,
                color: glassyColor.withOpacity(0.3),
                size: 20,

              ),
              border: InputBorder.none,
              hintText: "Search ...",
              hintStyle: description.copyWith(fontSize: 15,color: glassyColor.withOpacity(0.3)),

            ),
            style: description.copyWith(fontSize: 18,),
            onChanged: (txt) {
              print(txt);
            },
          ),
        ),
      ),
    );
  }
}