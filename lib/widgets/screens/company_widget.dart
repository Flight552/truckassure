import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:truckassure/providers/company_details_provider.dart';
import 'package:truckassure/widgets/default/scaffold_default.dart';
import '../default/drop_down_states.dart';
import '../default/image_container.dart';
import '../default/text_simple.dart';
import '../default/text_field.dart';
import '../../utils/utils.dart';
import '../../models/company_details_data.dart';
import 'drivers_list_widget.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompanyWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CompanyWidgetState();
}

class _CompanyWidgetState extends State<CompanyWidget> {
  final _globalForm = GlobalKey<FormState>();
  bool _isDataValid = false;
  var _country = "";
  var _state = "";
  var _companyDetails = CompanyDetailsData(
    id: null,
    companyName: "",
    zipcode: -1,
    street: "",
    city: "",
    country: "",
    state: "",
    contact: "",
    title: "",
    phone: "",
    fax: "",
    email: "",
    taxId: "",
    fmcsa: ""
  );

  var phoneFormatter = new MaskTextInputFormatter(
      mask: '+# (###) ###-###-#',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  var taxFormatter = new MaskTextInputFormatter(
      mask: '###-##-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);


  @override
  void initState() {
    super.initState();
    _isDataValid = false;
  }

  void onChangeText(String value) {
    setState(() {
      if (value.isEmpty) {
        _isDataValid = false;
      }
    });
  }

  void _onSubmit() {
    final isValid = _globalForm.currentState.validate();
    if (isValid) {
      _globalForm.currentState.save();
      if (_companyDetails.id == null) {
        _companyDetails = CompanyDetailsData(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            companyName: _companyDetails.companyName,
            zipcode: _companyDetails.zipcode,
            street: _companyDetails.street,
            city: _companyDetails.city,
            country: _companyDetails.country,
            state: _companyDetails.state,
            contact: _companyDetails.contact,
            title: _companyDetails.title,
            phone: _companyDetails.phone,
            fax: _companyDetails.fax,
            email: _companyDetails.email,
            taxId: _companyDetails.taxId,
            fmcsa: _companyDetails.fmcsa);
        Provider.of<CompanyDetailsProvider>(context, listen: false)
            .addCompanyData(_companyDetails);
      } else {
        Provider.of<CompanyDetailsProvider>(context, listen: false)
            .updateCompany(_companyDetails.id, _companyDetails);
        _isDataValid = false;
      }
      _isDataValid = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CompanyDetailsProvider>(context);
    return ScaffoldDefault(title: "Company details", widget: Column(
      children: [
        ImageContainer(),
        Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _globalForm,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Company's name",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: null,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: value,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: _companyDetails.city,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: _companyDetails.title,
                            phone: _companyDetails.phone,
                            fax: _companyDetails.fax,
                            email: _companyDetails.email,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                      },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter company's name";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Zipcode",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: null,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        var zip = int.parse(value);
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: zip,
                            street: _companyDetails.street,
                            city: _companyDetails.city,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: _companyDetails.title,
                            phone: _companyDetails.phone,
                            fax: _companyDetails.fax,
                            email: _companyDetails.email,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                        },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter zip code";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Street",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: null,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: _companyDetails.city,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: _companyDetails.title,
                            phone: _companyDetails.phone,
                            fax: _companyDetails.fax,
                            email: _companyDetails.email,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                        },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter drivers name";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "City",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: null,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: value,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: _companyDetails.title,
                            phone: _companyDetails.phone,
                            fax: _companyDetails.fax,
                            email: _companyDetails.email,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                        },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter city";
                        }
                        return null;
                      },
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        alignment: Alignment.centerLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SimpleText(
                                text: "Country",
                                size: 15,
                                weight: FontWeight.bold,
                              ),
                              DropDownItems(
                                choice: "country",
                                hint: "Choose country",
                                getAmount: (value) {
                                  _country = value;
                                  _onSubmit();
                                },
                              )
                            ])),
                    Container(
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SimpleText(
                                text: "States",
                                size: 15,
                                weight: FontWeight.bold,
                              ),
                              DropDownItems(
                                choice: "states",
                                hint: "Choose state",
                                getAmount: (value) {
                                  _state = value;
                                  _onSubmit();
                                },
                              )
                            ])),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Contact",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: null,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: _companyDetails.city,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: value,
                            title: _companyDetails.title,
                            phone: _companyDetails.phone,
                            fax: _companyDetails.fax,
                            email: _companyDetails.email,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                        },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter contact";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Title",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: null,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: _companyDetails.city,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: value,
                            phone: _companyDetails.phone,
                            fax: _companyDetails.fax,
                            email: _companyDetails.email,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                        },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter title";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Phone",
                        hintText: "+1-555-xxx-xxx-x",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: [phoneFormatter],
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: _companyDetails.city,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: _companyDetails.title,
                            phone: value,
                            fax: _companyDetails.fax,
                            email: _companyDetails.email,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                        },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter phone";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Fax",
                        hintText: "+1-555-xxx-xxx-x",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: [phoneFormatter],
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: _companyDetails.city,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: _companyDetails.title,
                            phone: _companyDetails.phone,
                            fax: value,
                            email: _companyDetails.email,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                        },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter fax";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: null,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: _companyDetails.city,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: _companyDetails.title ,
                            phone: _companyDetails.phone,
                            fax: _companyDetails.fax,
                            email: value,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                        },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter title";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "Tax ID",
                        hintText: "9xx-xx-xxxx",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: [taxFormatter],
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: _companyDetails.city,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: _companyDetails.title,
                            phone: _companyDetails.phone,
                            fax: _companyDetails.fax,
                            email: _companyDetails.email,
                            taxId: value,
                            fmcsa: _companyDetails.fmcsa);
                      },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Enter fax";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 25),
                      decoration: InputDecoration(
                        labelText: "FMCSA MC#",
                        hintText: "FMCSA MC#",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                        errorStyle: TextStyle(color: Colors.red),
                      ),
                      inputFormatters: null,
                      keyboardType: TextInputType.text,
                      onSaved: (value) {
                        _companyDetails = CompanyDetailsData(
                            id: _companyDetails.id,
                            companyName: _companyDetails.companyName,
                            zipcode: _companyDetails.zipcode,
                            street: _companyDetails.street,
                            city: value,
                            country: _companyDetails.country,
                            state: _companyDetails.state,
                            contact: _companyDetails.contact,
                            title: _companyDetails.title,
                            phone: _companyDetails.phone,
                            fax: _companyDetails.fax,
                            email: _companyDetails.email,
                            taxId: _companyDetails.taxId,
                            fmcsa: _companyDetails.fmcsa);
                      },
                      onFieldSubmitted: (_) => _onSubmit(),
                      onEditingComplete: () {
                        setState(() {});
                      },
                      onChanged: (value) {
                        onChangeText(value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "FMCSA MC#";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            )),
        Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: Colors.black,
                    minimumSize: const Size.square(40)),
                onPressed: !_isDataValid
                    ? null
                    : () {
                  if (_isDataValid) {
                    _onSubmit();
                    Navigator.of(context).pushNamed(DriversList.ROUTE_NAME);
                  }
                },
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                )))
      ],
    ));
  }
}
