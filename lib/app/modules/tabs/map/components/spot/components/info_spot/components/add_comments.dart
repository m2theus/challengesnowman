import 'package:challengesnowman/app/modules/shared/components/button.dart';
import 'package:challengesnowman/app/modules/shared/components/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../../tab_map_controller.dart';
import '../../../new_spot_controller.dart';

class AddComment extends StatefulWidget {
  const AddComment();

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  double _rating = 0;

  TextEditingController _commentController = TextEditingController();
  final _spotController =
      Provider.of<NewSpotController>(Get.context, listen: false);

  final _tabMapController = Provider.of<TabMapController>(Get.context);
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(child: Observer(
        builder: (_) {
          return Container(
              height: MediaQuery.of(context).size.height * 0.80,
              width: MediaQuery.of(context).size.width,
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
                              Icons.close,
                              color: Colors.grey,
                              size: 25,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                              _rating = 0;
                              _commentController.text = '';
                              await _spotController.getSpotById(
                                  _tabMapController.markerIdSelected);
                            },
                          ),
                        ),
                      )),
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    title: _spotController.isLoading
                        ? Container()
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 15,
                                  child: Text(
                                    'New Review',
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        color: Colors.grey[300],
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    content: _spotController.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.50,
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                                child: Form(
                              key: formKey,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: SmoothStarRating(
                                        allowHalfRating: false,
                                        onRatingChanged: (v) {
                                          setState(() {
                                            _rating = v;
                                          });
                                        },
                                        starCount: 5,
                                        rating: _rating,
                                        size: 40.0,
                                        filledIconData: Icons.star,
                                        halfFilledIconData: Icons.star_half,
                                        color: Theme.of(context).primaryColor,
                                        borderColor:
                                            Theme.of(context).primaryColor,
                                        spacing: 0.0),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    child: InputField(
                                      (value) => value.isEmpty
                                          ? "Campo obrigatório"
                                          : null,
                                      "Comment",
                                      controller: _commentController,
                                      maxLines: 5,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: ButtonCustom(
                                      onTap: () {
                                        if (validate()) {
                                          _spotController.addComment(
                                              _rating, _commentController.text);
                                        }
                                      },
                                      label: "Comment",
                                      width: MediaQuery.of(context).size.width *
                                          0.70,
                                      color: Colors.yellow[600],
                                      colorLabel:
                                          Theme.of(context).primaryColor,
                                      margin: EdgeInsets.only(top: 40),
                                    ),
                                  )
                                ],
                              ),
                            )),
                          ),
                  ),
                ],
              ));
        },
      )),
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
}
