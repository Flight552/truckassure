import 'package:flutter/material.dart';

class CompanyWidget extends StatelessWidget {
  final _contact = TextEditingController();
  final _title = TextEditingController();
  final _phone = TextEditingController();
  final _fax = TextEditingController();
  final _email = TextEditingController();
  final _taxId = TextEditingController();
  final _fmcsa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          height: 200,
          child: Image.asset("assets/images/logo.png"),
        ),
        Container(
          child: Text(
            "Company Details",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Contact",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    controller: _contact,
                    autocorrect: false,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    controller: _title,
                    autocorrect: false,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "+1-555-xxx-xxx-x",
                        labelText: "Phone",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    controller: _phone,
                    autocorrect: false,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "+1-555-xxx-xxx-x",
                        labelText: "Fax",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    controller: _fax,
                    autocorrect: false,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    controller: _email,
                    autocorrect: false,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "9xx-xx-xxxx",
                        labelText: "Tax ID",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    controller: _taxId,
                    autocorrect: false,
                  )),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "FMCSA MC#",
                        labelText: "FMCSA MC#",
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                    controller: _fmcsa,
                    autocorrect: false,
                    onSubmitted: (value) {},
                  )),
            ],
          ),
        )),
        Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.black,
                    minimumSize: Size.square(40)),
                onPressed: () {},
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    ));
  }
}
