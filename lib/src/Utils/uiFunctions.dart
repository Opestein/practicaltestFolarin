import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakanowpracticaltest/src/Utils/const.dart';

void showDialogSingleButton(BuildContext context, String title, String message,
    String buttonLabel, bool action) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(title),
        content: new Text(message),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text(buttonLabel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

//for this, th background view will not be blurred
void showSlideupView(BuildContext context) {
  showBottomSheet(
      context: context,
      builder: (context) {
        return new Container(
          child: new GestureDetector(
            onTap: () => Navigator.pop(context),
            child: new Text("Click me to close this non-modal bottom sheet"),
          ),
        );
      });
}

modalBottomSheet(BuildContext context, String message, bool status) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, top: 50.0, bottom: 60.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                SvgPicture.asset("assets/images/failed_slideup.svg"),
//                SizedBox(
//                  height: 15.0,
//                ),
                Text(
                  message,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ));
      });
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
