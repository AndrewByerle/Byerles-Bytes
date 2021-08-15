import 'package:flutter/material.dart';

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
    return Row(
      children: [
        Text(widget.groupName),
        SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.all(0.0),
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
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            onChanged: (String value) {
              setState(() {
                _chosenValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
