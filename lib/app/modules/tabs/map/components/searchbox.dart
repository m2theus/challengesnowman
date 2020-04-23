import 'package:challengesnowman/app/modules/models/spot_model.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/new_spot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../tab_map_controller.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _searchController = TextEditingController();
  final _tabMapController =
      Provider.of<TabMapController>(Get.context, listen: false);
  SpotModel _locationSelected;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          padding: EdgeInsets.only(left: 10),
          height: MediaQuery.of(context).size.height * 0.08,
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 1.0),
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Icon(Icons.search, color: Colors.grey, size: 25),
              ),
              Flexible(
                flex: 7,
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: "Search here",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return await _tabMapController.getSpotsByDesc(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.description),
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(suggestion.photo != null
                            ? suggestion.photo
                            : "https://www.google.com/imgres?imgurl=https%3A%2F%2Fassets.zoom.us%2Fimages%2Fen-us%2Fdesktop%2Fgeneric%2Fvideo-not-working.PNG&imgrefurl=https%3A%2F%2Fsupport.zoom.us%2Fhc%2Fen-us%2Farticles%2F208362326-Video-Not-Working-on-Lenovo-Devices&tbnid=41e5r-P6yyBzIM&vet=12ahUKEwirnLu4jv_oAhUPQFMKHXdXDqAQMygEegUIARCDAg..i&docid=oKSIqWQGnXLQeM&w=640&h=328&q=image%20not%20image&ved=2ahUKEwirnLu4jv_oAhUPQFMKHXdXDqAQMygEegUIARCDAg"),
                        backgroundColor: Colors.transparent,
                      ),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    _locationSelected = suggestion;
                    _searchController.text = suggestion.description;
                    _tabMapController.movePosition(
                        suggestion.lat, suggestion.long);
                  },
                ),
              ),
              Container(
                width: 1.5,
                height: MediaQuery.of(context).size.height * 0.05,
                color: Colors.grey[200],
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.grey, size: 25),
                  onPressed: () => showDialog(
                      context: context, builder: (context) => NewSpotModal()),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
