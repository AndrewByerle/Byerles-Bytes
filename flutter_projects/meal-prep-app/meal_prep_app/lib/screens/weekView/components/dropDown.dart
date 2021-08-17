import 'package:flutter/material.dart';
import 'package:meal_prep_app/components/data/dayInfo.dart';

class DropDown extends StatefulWidget {
  final List<String> items;
  final String groupName;
  final String hint;
  const DropDown(this.groupName, this.items, this.hint);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButton<String>(
          value: _chosenValue,
          style: TextStyle(color: Colors.black),
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text(
            widget.hint,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          onChanged: (String value) {
            setState(() {
              _chosenValue = value;
              if (widget.hint == "Pick a Day") {
                tempInfo['day'] = _chosenValue;
                print(tempInfo['day']);
              } else {
                tempInfo['time'] = _chosenValue;
                print(tempInfo['time']);
              }
            });
          },
        ),
      ),
    );
  }
}
