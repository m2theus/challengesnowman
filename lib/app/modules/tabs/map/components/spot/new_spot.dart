import 'dart:async';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:challengesnowman/app/modules/shared/components/button.dart';
import 'package:challengesnowman/app/modules/shared/components/input_dropdown.dart';
import 'package:challengesnowman/app/modules/shared/components/input_field.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/models/model_spot_place.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/new_spot_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:search_map_place/search_map_place.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:simple_autocomplete_search/simple_autocomplete_search.dart';

class NewSpotModal extends StatefulWidget {
  const NewSpotModal();

  @override
  _NewSpotModalState createState() => _NewSpotModalState();
}

class _NewSpotModalState extends State<NewSpotModal> {
  TextEditingController _categoriesController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _pinController = TextEditingController();
  final _spotController = NewSpotController();
  dynamic dropdownValue;
  PlaceSpot _locationSelected;

  Timer _throttle;
  List<String> _placesList = [];
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
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  color: Colors.grey[400],
                ),
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.20,
                child: Center(
                  child: Icon(
                    Icons.photo_camera,
                    color: Theme.of(context).primaryColor,
                    size: 40,
                  ),
                ),
              ),
              content: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                InputField(
                                    (value) => value.isEmpty
                                        ? "Campo obrigatório"
                                        : null,
                                    "Name",
                                    controller: _nameController),
                                InputDropdown(_spotController.categories,
                                    "Categories", dropdownValue, (value) {
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
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                            decoration: InputDecoration(
                                      hintStyle: TextStyle(color: Colors.grey),
                                      hintText: "Location",
                                      labelText: "Location",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[400],
                                            width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey[400],
                                            width: 1.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[400],
                                              width: 1.0)),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.0),
                                      ),
                                    )),
                                    suggestionsCallback: (pattern) async {
                                      return await _spotController
                                          .getLocationResults(pattern);
                                    },
                                    itemBuilder: (context, suggestion) {
                                      return ListTile(
                                        title: Text(suggestion.description),
                                      );
                                    },
                                    onSuggestionSelected: (suggestion) {
                                      print(suggestion);
                                    },
                                  ),
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                ),

//                            new AutoCompleteTextField<PlaceSpot>(
//                              itemBuilder: (context, suggestion) {
//                                return new Padding(
//                                    child: Container(
//                                      height: MediaQuery.of(context).size.width *
//                                          0.20,
//                                      child: ListTile(
//                                          title:
//                                          new Text(suggestion.description)),
//                                    ),
//                                    padding: EdgeInsets.all(8.0));
//                              },
//                              itemFilter: (suggestion, input) {
//                                return suggestion != null
//                                    ? suggestion.description
//                                    .toLowerCase()
//                                    .startsWith(input.toLowerCase())
//                                    : suggestion;
//                              },
//                              decoration: InputDecoration(
//                                hintStyle: TextStyle(color: Colors.grey),
//                                labelStyle: TextStyle(color: Colors.grey[400]),
//                                hintText: "Location",
//                                labelText: "Location",
//                                border: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.grey[400], width: 1.0),
//                                ),
//                                enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(
//                                      color: Colors.grey[400], width: 1.0),
//                                ),
//                                focusedBorder: OutlineInputBorder(
//                                    borderSide: BorderSide(
//                                        color: Colors.grey[400], width: 1.0)),
//                                errorBorder: OutlineInputBorder(
//                                  borderSide:
//                                  BorderSide(color: Colors.red, width: 1.0),
//                                ),
//                              ),
//                              controller: _locationController,
//                              clearOnSubmit: false,
//                              itemSorter: (a, b) => 1,
//                              suggestions:
//                              _spotController.predictionsAutoComplete,
//                              textSubmitted: (text) => setState(() {
//                                _locationController.text = text;
//                              }),
//                              itemSubmitted: (value) => setState(() {
//                                _locationSelected = value;
//                              }),
//                            ),

                                InputField(
                                  null,
                                  "Pin color",
                                  controller: _pinController,
                                  onTap: () => _colorPicker(context),
                                  isColorInput: true,
                                  colorInputCircle:
                                      _pinController.text != null &&
                                              _pinController.text != ''
                                          ? Hexcolor(_pinController.text)
                                          : null,
                                ),
                                ButtonCustom(
                                  onTap: () => null,
                                  label: "Add spot",
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  color: Colors.yellow[600],
                                  colorLabel: Theme.of(context).primaryColor,
                                  margin: EdgeInsets.only(top: 40),
                                )

//                              ColorPicker(
//                                pickerColor: pickerColor,
//                                onColorChanged: changeColor,
//                                showLabel: true,
//                                pickerAreaHeightPercent: 0.8,
//                              ),
//                              InputField(
//                                  (value) => value.isEmpty
//                                      ? "Campo obrigatório"
//                                      : null,
//                                  "Location",
//                                  controller: _locationController),
//                      CustomTextBox(
//                          controller: _nameController, label: 'Name'),
//                      CustomTextBox(
//                          controller: _categoriesController,
//                          label: 'Category'),
//                      CustomTextBox(
//                        controller: _locationController,
//                        label: 'Location',
//                        isLocationTextBox: true,
//                        onLocationBoxSubmitted: () =>
//                            _getLatLng(_locationController.text),
//                      ),
//                      CustomTextBox(
//                        controller: _pinController,
//                        label: 'Pin Color',
//                        onColorBoxTap: () => _colorPicker(),
//                        isColorPicker: true,
//                      ),
//                      CustomButton(
//                        onTap: () => _addMarker(),
//                        percentageWidth: 0.70,
//                        label: 'Add Spot',
//                      )
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  )),
            )));
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
