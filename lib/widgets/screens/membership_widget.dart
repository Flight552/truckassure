import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'credit_card.dart';
import '../default/drop_down_states.dart';
import '../default/image_container.dart';
import '../default/scaffold_default.dart';
import '../../providers/state_notifier.dart';
import '../default/text_simple.dart';

class MembershipDetails extends StatefulWidget {
  static const ROUTE_NAME = "/membership";

  @override
  State<StatefulWidget> createState() => _MembershipDetailsState();
}

class _MembershipDetailsState extends State<MembershipDetails> {
  bool _isEnabled = false;
  String _fee;
  String _deductible;
  final _textNotifier = StateNotifier();

  void getDeductible(String amount) {
    _deductible = amount;
    calculateFee();
    enableButton();
  }

  void getFee(String amount) {
    _fee = amount;
    calculateFee();
    enableButton();
  }

  void calculateFee() {
    if (_fee != null && _deductible != null) {
      String limit = _fee;
      String deductible = _deductible;
      if (limit == "\$100,000" && deductible == "\$250") {
        _textNotifier.changeText("1,100");
      } else if (limit == "\$100,000" && deductible == "\$500") {
        _textNotifier.changeText("1,000");
      } else if (limit == "\$250,000" && deductible == "\$250") {
        _textNotifier.changeText("2,200");
      } else if (limit == "\$250,000" && deductible == "\$500") {
        _textNotifier.changeText("2,000");
      } else {
        _textNotifier.changeText("unknown");
      }
    }
  }

  void enableButton() {
    setState(() {
      _isEnabled = _textNotifier.myText == "0" ? false : true;
    });
  }

  @override
  void dispose() {
    _textNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldDefault(title: "Membership Details", widget: Column(
      children: [
        ImageContainer(),
        Expanded(
            child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SimpleText(
                        text: "Limit:",
                        size: 25,
                        weight: FontWeight.bold,
                      ),
                      DropDownItems(
                        choice: "limit",
                        getAmount: getFee,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SimpleText(
                        text: "Deductible:",
                        size: 25,
                        weight: FontWeight.bold,
                      ),
                      DropDownItems(
                        choice: "deductible",
                        getAmount: getDeductible,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SimpleText(
                        text: "Membership fee:",
                        size: 25,
                        weight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          child: AnimatedBuilder(
                            animation: _textNotifier,
                            builder: (_, __) => SimpleText(
                              text: "\$${_textNotifier.myText}",
                              size: 25,
                              weight: FontWeight.bold,
                            ),
                          ))
                    ]))),
        Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.black,
                    minimumSize: const Size.square(40)),
                onPressed: !_isEnabled ? null : () {
                  Navigator.of(context).pushNamed(CreditCard.ROUTE_NAME);
                },
                child: Text(
                  "Purchase Now",
                  style: const TextStyle(color: Colors.white),
                )))
      ],
    ));
  }
}
