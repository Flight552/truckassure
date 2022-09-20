// import 'package:flutter/material.dart';
// import 'package:truckassure/widgets/default/button_container.dart';
// import 'package:truckassure/widgets/default/image_container.dart';
// import 'package:truckassure/widgets/default/title_container.dart';
// import 'package:truckassure/widgets/default/text.dart';

// class CompanyWidget extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => new _CompanyWidget();
// }

// class _CompanyWidget extends State<CompanyWidget> {
//   String company;

//   final _company = TextEditingController();
//   final _zipcode = TextEditingController();
//   final _street = TextEditingController();
//   final _city = TextEditingController();
//   final _country = TextEditingController();
//   final _state = TextEditingController();
//   final _contact = TextEditingController();
//   final _title = TextEditingController();
//   final _phone = TextEditingController();
//   final _fax = TextEditingController();
//   final _email = TextEditingController();
//   final _taxId = TextEditingController();
//   final _fmcsa = TextEditingController();

//   bool _isButtonEnabled;

//   void _getResult(String result) {
//     print(result);
//     setState(() {
//       _isButtonEnabled = true;
//     });
//   }

//   void _onPress() {
//     print("Some action!");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       children: [
//         ImageContainer(),
//         PageTitleContainer(
//           title: "Company details",
//         ),
//         Expanded(
//             child: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextFieldWidget(
//                 hint: null,
//                 label: "Company name",
//                 keyboard: "text",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 hint: null,
//                 label: "Zip Code",
//                 keyboard: "number",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 hint: null,
//                 label: "Street",
//                 keyboard: "text",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 hint: null,
//                 label: "City",
//                 keyboard: "text",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 hint: null,
//                 label: "Country",
//                 keyboard: "text",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 hint: null,
//                 label: "State",
//                 keyboard: "text",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 label: "Contact",
//                 keyboard: "text",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 hint: null,
//                 label: "Title",
//                 keyboard: "text",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 hint: "+1-555-xxx-xxx-x",
//                 label: "Phone",
//                 keyboard: "number",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 hint: "+1-555-xxx-xxx-x",
//                 label: "Fax",
//                 keyboard: "number",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                 label: "Email",
//                 keyboard: "email",
//                 result: _getResult,
//               ),
//               TextFieldWidget(
//                   hint: "9xx-xx-xxxx", label: "Tax ID", keyboard: "number"),
//               TextFieldWidget(
//                 hint: "FMCSA MC#",
//                 label: "FMCSA MC#",
//                 keyboard: "text",
//                 result: _getResult,
//               )
//             ],
//           ),
//         )),
//         ButtonContainer(
//           onPress: _onPress,
//           isEnabled: _isButtonEnabled,
//         )
//       ],
//     ));
//   }
// }
