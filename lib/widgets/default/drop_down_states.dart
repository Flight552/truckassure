import 'package:flutter/material.dart';
import 'package:truckassure/widgets/default/text_simple.dart';

class DropDownItems extends StatefulWidget {
  final String choice;
  DropDownItems({this.choice});
  static const _statesItems = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming',
  ];

  static const _countries = [
    "US",
    "Canada",
  ];

  static const _typeVehicle = ["Car", "Tractor", "Truck"];
  final List<DropdownMenuItem<String>> _dropMenuItemsStates = _statesItems
      .map((value) => DropdownMenuItem<String>(
            value: value,
            child: SimpleText(text: value, size: 15, weight: null),
          ))
      .toList();

  final List<DropdownMenuItem<String>> _dropMenuItemsCountries = _countries
      .map((value) => DropdownMenuItem<String>(
            value: value,
            child: SimpleText(text: value, size: 15, weight: null),
          ))
      .toList();

  final List<DropdownMenuItem<String>> _dropMenuItemsTypes = _typeVehicle
      .map((value) => DropdownMenuItem<String>(
            value: value,
            child: SimpleText(text: value, size: 15, weight: null),
          ))
      .toList();

  State<StatefulWidget> createState() => new _DropDownState();
  String _select;
}

class _DropDownState extends State<DropDownItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10),
        child: DropdownButton(
            value: widget._select,
            hint: SimpleText(text: "Choose", size: 15, weight: null),
            onChanged: (values) {
              setState(() {
                widget._select = values;
              });
            },
            items: widget.choice == "country"
                ? widget._dropMenuItemsCountries
                : (widget.choice == "states"
                    ? widget._dropMenuItemsStates
                    : widget._dropMenuItemsTypes)));
  }
}
