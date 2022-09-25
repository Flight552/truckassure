import 'package:flutter/material.dart';
import 'package:truckassure/widgets/calculate_fee.dart';
import 'package:truckassure/widgets/default/drop_down_states.dart';
import 'package:truckassure/widgets/default/image_container.dart';
import 'package:truckassure/widgets/default/text_simple.dart';
import 'package:truckassure/widgets/default/title_container.dart';

class MembershipDetails extends StatefulWidget {
  String _text = "0";
  String _fee;
  String _deductible;

  void getDeductible(String amount) {
    _deductible = amount;
    calculateFee();
  }

  void getFee(String amount) {
    _fee = amount;
    calculateFee();
  }

  void calculateFee() {
    if (_fee != null && _deductible != null) {
      String limit = _fee;
      String deductible = _deductible;

      if (limit == "\$100,000" && deductible == "\$250") {
        _text = "\$1,100";
      } else if (limit == "\$100,000" && deductible == "\$500") {
        _text = "\$1,000";
      } else if (limit == "\$250,000" && deductible == "\$250") {
        _text = "\$2,200";
      } else if (limit == "\$250,000" && deductible == "\$500") {
        _text = "\$2,000";
      } else {
        _text = "unknown";
      }
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       padding: EdgeInsets.all(10),
  //       child: Column(
  //         children: [
  //           ImageContainer(),
  //           PageTitleContainer(
  //             title: "Membership Details",
  //           ),
  //           Expanded(
  //               child: Container(
  //                   alignment: Alignment.centerLeft,
  //                   padding: EdgeInsets.only(top: 50),
  //                   child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         SimpleText(
  //                           text: "Limit:",
  //                           size: 30,
  //                           weight: FontWeight.bold,
  //                         ),
  //                         DropDownItems(
  //                           choice: "limit",
  //                           getAmount: getFee,
  //                         ),
  //                         SizedBox(
  //                           height: 20,
  //                         ),
  //                         SimpleText(
  //                           text: "Deductible:",
  //                           size: 30,
  //                           weight: FontWeight.bold,
  //                         ),
  //                         DropDownItems(
  //                           choice: "deductible",
  //                           getAmount: getDeductible,
  //                         ),
  //                         SizedBox(
  //                           height: 30,
  //                         ),
  //                         SimpleText(
  //                           text: "Membership fee:",
  //                           size: 30,
  //                           weight: FontWeight.bold,
  //                         ),
  //                         SizedBox(
  //                           height: 20,
  //                         ),
  //                         StatefulBuilder(builder:
  //                             (BuildContext context, StateSetter setState) {
  //                           return SimpleText(
  //                             text: _text,
  //                             size: 30,
  //                             weight: FontWeight.bold,
  //                           );
  //                         }),
  //                       ]))),
  //           Container(
  //               alignment: Alignment.bottomCenter,
  //               margin: EdgeInsets.only(bottom: 20),
  //               child: ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                       elevation: 4,
  //                       primary: Colors.black,
  //                       minimumSize: Size.square(40)),
  //                   onPressed: () {
  //                     print("Purchase Now");
  //                   },
  //                   child: Text(
  //                     "Purchase Now",
  //                     style: TextStyle(color: Colors.white),
  //                   )))
  //         ],
  //       ));
  // }

  @override
  State<StatefulWidget> createState() => _MembershipDetailsState();
}

class _MembershipDetailsState extends State<MembershipDetails> {
  String _text = "0";
  String _fee;
  String _deductible;

  void getDeductible(String amount) {
    _deductible = amount;
    calculateFee();
  }

  void getFee(String amount) {
    _fee = amount;
    calculateFee();
  }

  void calculateFee() {
    if (_fee != null && _deductible != null) {
      String limit = _fee;
      String deductible = _deductible;
      setState(() {
        if (limit == "\$100,000" && deductible == "\$250") {
          _text = "\$1,100";
        } else if (limit == "\$100,000" && deductible == "\$500") {
          _text = "\$1,000";
        } else if (limit == "\$250,000" && deductible == "\$250") {
          _text = "\$2,200";
        } else if (limit == "\$250,000" && deductible == "\$500") {
          _text = "\$2,000";
        } else {
          _text = "unknown";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ImageContainer(),
            PageTitleContainer(
              title: "Membership Details",
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SimpleText(
                            text: "Limit:",
                            size: 30,
                            weight: FontWeight.bold,
                          ),
                          DropDownItems(
                            choice: "limit",
                            getAmount: getFee,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SimpleText(
                            text: "Deductible:",
                            size: 30,
                            weight: FontWeight.bold,
                          ),
                          DropDownItems(
                            choice: "deductible",
                            getAmount: getDeductible,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          SimpleText(
                            text: "Membership fee:",
                            size: 30,
                            weight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return SimpleText(
                              text: _text,
                              size: 30,
                              weight: FontWeight.bold,
                            );
                          }),
                        ]))),
            Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 4,
                        primary: Colors.black,
                        minimumSize: Size.square(40)),
                    onPressed: () {
                      print("Purchase Now");
                    },
                    child: Text(
                      "Purchase Now",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ));
  }
}
