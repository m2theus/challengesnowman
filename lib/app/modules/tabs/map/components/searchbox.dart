import 'package:challengesnowman/app/modules/tabs/map/components/spot/new_spot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              padding: EdgeInsets.only(left: 6, right: 6),
              child: TextField(
                onTap: () => () {},
                decoration: InputDecoration(
                  hintText: "Search here",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                controller: _searchController,
                style: GoogleFonts.nunito(
                  textStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                cursorColor: Colors.black,
              ),
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
  }
}
