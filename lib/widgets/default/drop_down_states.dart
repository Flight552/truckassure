import 'package:flutter/material.dart';
import 'package:truckassure/widgets/default/text_simple.dart';

class DropDownItems extends StatefulWidget {
  final String choice;
  final String hint;
  final Function(String) getAmount;

  DropDownItems({this.choice, this.hint, this.getAmount});

  State<StatefulWidget> createState() => new _DropDownState();
}

class _DropDownState extends State<DropDownItems> {
  String _select;

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
  static const _limit = ["\$100,000", "\$250,000"];
  static const _deductible = ["\$250", "\$500"];
  final String _choice = "Choose";

  final List<DropdownMenuItem<String>> _dropMenuItemsStates = _statesItems
      .map((value) => DropdownMenuItem<String>(
            key: ValueKey(value),
            value: value,
            child: SimpleText(text: value, size: 15, weight: null),
          ))
      .toList();

  final List<DropdownMenuItem<String>> _dropMenuItemsCountries = _countries
      .map((value) => DropdownMenuItem<String>(
            key: ValueKey(value),
            value: value,
            child: SimpleText(text: value, size: 15, weight: null),
          ))
      .toList();

  final List<DropdownMenuItem<String>> _dropMenuItemsTypes = _typeVehicle
      .map((value) => DropdownMenuItem<String>(
            key: ValueKey(value),
            value: value,
            child: SimpleText(text: value, size: 15, weight: null),
          ))
      .toList();

  final List<DropdownMenuItem<String>> _dropMenuItemsLimit =
      _limit.map((value) {
    return DropdownMenuItem<String>(
      key: ValueKey(value),
      value: value,
      child: SimpleText(text: value, size: 15, weight: null),
    );
  }).toList();

  final List<DropdownMenuItem<String>> _dropMenuItemsDeductible = _deductible
      .map((value) => DropdownMenuItem<String>(
            key: ValueKey(value),
            value: value,
            child: SimpleText(text: value, size: 15, weight: null),
          ))
      .toList();

  List<DropdownMenuItem<String>> getList(String _choice) {
    switch (_choice) {
      case "country":
        {
          return _dropMenuItemsCountries;
        }
        break;
      case "states":
        {
          return _dropMenuItemsStates;
        }
        break;
      case "types":
        {
          return _dropMenuItemsTypes;
        }
        break;
      case "limit":
        {
          return _dropMenuItemsLimit;
        }
        break;
      case "deductible":
        {
          return _dropMenuItemsDeductible;
        }
        break;
      default:
        {
          return [];
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10),
        child: DropdownButton(
            value: _select,
            hint: SimpleText(
                text: widget.hint != null ? widget.hint : _choice,
                size: 15,
                weight: null),
            onChanged: (values) {
              if (widget.getAmount != null) {
                widget.getAmount(values);
              }
              setState(() {
                _select = values;
              });
            },
            items: getList(widget.choice)));
  }
}
