import 'dart:async';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:challengesnowman/app/modules/models/spot_model.dart';
import 'package:challengesnowman/app/modules/shared/components/button.dart';
import 'package:challengesnowman/app/modules/shared/components/input_dropdown.dart';
import 'package:challengesnowman/app/modules/shared/components/input_field.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/components/image_select.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/models/model_spot_place.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/new_spot_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class NewSpotModal extends StatefulWidget {
  const NewSpotModal();

  @override
  _NewSpotModalState createState() => _NewSpotModalState();
}

class _NewSpotModalState extends State<NewSpotModal> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final _spotController =
      Provider.of<NewSpotController>(Get.context, listen: false);
  dynamic dropdownValue;
  PlaceSpot _locationSelected;

  Timer _throttle;
  @override
  void initState() {
    _spotController.getCategories();
    _locationController.addListener(_onSearchChanged);
  }

  _onSearchChanged() {
    if (_throttle?.isActive ?? false) _throttle.cancel();
    _throttle = Timer(const Duration(milliseconds: 500), () async {
      _spotController.getLocationResults(_locationController.text);
    });
  }

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey key = new GlobalKey<AutoCompleteTextFieldState<PlaceSpot>>();
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 2,
                            ),
                          ],
                          color: Colors.white),
                      margin: EdgeInsets.only(top: 24, left: 40),
                      width: 40,
                      height: 40,
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                            size: 25,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    )),
                AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    titlePadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.zero,
                    title: _titleModal(),
                    content: _contentModal())
              ],
            )));
  }

  _titleModal() {
    return Observer(
      builder: (_) {
        return _spotController.isLoading
            ? Container()
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: Colors.grey[400],
                ),
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.20,
                child: _spotController.isImageSelected
                    ? Stack(
                        children: _spotController.image != null
                            ? <Widget>[
                                Positioned.fill(
                                  child: Image.file(_spotController.image,
                                      fit: BoxFit.cover),
                                ),
                                Positioned(
                                  top: 15,
                                  left: 15,
                                  child: InkWell(
                                    onTap: () => _spotController
                                        .setIsImageSelected(false),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.6),
                                          shape: BoxShape.circle),
                                      width: 25,
                                      height: 25,
                                      child: Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            : <Widget>[ImageSelect()])
                    : ImageSelect());
      },
    );
  }

  _contentModal() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.60,
        child: Observer(
          builder: (_) {
            return _spotController.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: <Widget>[formContentModal()],
                    ),
                  );
          },
        ));
  }

  formContentModal() {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InputField(
              (value) => value.isEmpty ? "Campo obrigatório" : null, "Name",
              controller: _nameController),
          InputDropdown(_spotController.categories, "Categories", dropdownValue,
              (value) {
            if (value == null && dropdownValue == null) {
              return "Campo obrigatório";
            }
          }, (value) {
            setState(() {
              dropdownValue = value;
            });
          }),
          Padding(
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.grey[400]),
                    hintText: "Location",
                    labelText: "Location",
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400], width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[400], width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[400], width: 1.0)),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                  )),
              suggestionsCallback: (pattern) async {
                return await _spotController.getLocationResults(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion.description),
                );
              },
              onSuggestionSelected: (suggestion) {
                _locationSelected = suggestion;
                _locationController.text = suggestion.description;
              },
            ),
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          ),
          InputField(
            (value) => value.isEmpty ? "Campo obrigatório" : null,
            "Pin color",
            controller: _pinController,
            onTap: () => _colorPicker(context),
            isColorInput: true,
            colorInputCircle:
                _pinController.text != null && _pinController.text != ''
                    ? Hexcolor(_pinController.text)
                    : null,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ButtonCustom(
              onTap: () {
                if (validate()) {
                  _spotController.addSpot(
                      _locationSelected,
                      new SpotModel(
                          title: _nameController.text,
                          category: dropdownValue,
                          description: _nameController.text,
                          pinColor: _pinController.text));
                }
              },
              label: "Add spot",
              width: MediaQuery.of(context).size.width * 0.70,
              color: Colors.yellow[600],
              colorLabel: Theme.of(context).primaryColor,
              margin: EdgeInsets.only(top: 40),
            ),
          )
        ],
      ),
      key: formKey,
    );
  }

  bool validate() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else
      return false;
  }

  _colorPicker(context) {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: const Text('Got it'),
            onPressed: () {
              setState(() => _pinController.text =
                  "#${pickerColor.value.toRadixString(16).padLeft(6, '0')}");
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
