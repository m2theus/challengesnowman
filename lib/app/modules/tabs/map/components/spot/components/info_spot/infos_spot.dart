import 'package:challengesnowman/app/modules/models/user_model.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/components/image_select.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/components/info_spot/components/add_comments.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/new_spot_controller.dart';
import 'package:challengesnowman/app/services/shared_preferences_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../tab_map_controller.dart';

class InfosSpot extends StatefulWidget {
  const InfosSpot({
    this.id,
    this.scrollController,
  });

  final String id;
  final ScrollController scrollController;

  @override
  _InfosSpotState createState() => _InfosSpotState();
}

class _InfosSpotState extends State<InfosSpot> {
  bool anonymous = false;
  final _spotController =
      Provider.of<NewSpotController>(Get.context, listen: false);
  final _tabMapController =
      Provider.of<TabMapController>(Get.context, listen: false);

  @override
  void initState() {
    _spotController.getSpotById(widget.id);
    UserModel userModel = sharedPreferences.getUser();
    anonymous = userModel.isAnonymous;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              margin: EdgeInsets.only(top: 24, left: 20, bottom: 10),
              width: 40,
              height: 40,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 25,
                  ),
                  onPressed: () =>
                      _tabMapController.setShowScrollableButton(false),
                ),
              ),
            )),
        buildContainer()
      ],
    );
  }

  buildContainer() {
    return Observer(
      builder: (_) {
        return Expanded(
          child: SingleChildScrollView(
              controller: widget.scrollController,
              child: _spotController.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.95,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          buildHeader(),
                          Container(
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width * 0.95,
                              height: MediaQuery.of(context).size.height * 0.75,
                              padding: EdgeInsets.only(top: 24),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    buildTitle(),
                                    Padding(
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: SmoothStarRating(
                                              allowHalfRating: false,
                                              onRatingChanged: (v) {},
                                              starCount: 5,
                                              rating:
                                                  _spotController.ratingMedium,
                                              size: 40.0,
                                              filledIconData: Icons.star,
                                              halfFilledIconData:
                                                  Icons.star_half,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderColor: Theme.of(context)
                                                  .primaryColor,
                                              spacing: 0.0)),
                                      padding:
                                          EdgeInsets.only(left: 16, right: 16),
                                    ),
                                    buildCategory(),
                                    Expanded(
                                      child: buildComments(),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ))),
        );
      },
    );
  }

  buildHeader() {
    return Observer(
      builder: (_) {
        return Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.20,
            child: _spotController.modelSelected?.photo != null
                ? Stack(
                    children: _spotController.modelSelected?.photo != null
                        ? <Widget>[
                            Positioned.fill(
                              child: Image(
                                image: _spotController.modelSelected?.photo !=
                                            null &&
                                        _spotController.modelSelected?.photo !=
                                            ''
                                    ? NetworkImage(
                                        _spotController.modelSelected?.photo)
                                    : AssetImage('assets/images/logo.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 15,
                              child: InkWell(
                                onTap: () => _spotController.removeImage(),
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
                : Stack(
                    children: _spotController.image != null
                        ? <Widget>[
                            Positioned.fill(
                              child: Image.file(_spotController.image,
                                  fit: BoxFit.cover),
                            ),
                            anonymous
                                ? Container()
                                : Positioned(
                                    top: 15,
                                    left: 15,
                                    child: InkWell(
                                      onTap: () async {
                                        await _spotController.removeImage();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.6),
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
                        : <Widget>[ImageSelect()]));
      },
    );
  }

  buildComments() {
    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ListTile(
                title: Text(
                  "Comments",
                  style: GoogleFonts.nunito(
                      textStyle: TextStyle(
                    fontSize: 14,
                    color: Hexcolor('#757685'),
                    fontWeight: FontWeight.bold,
                  )),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border:
                          Border.all(color: Theme.of(context).primaryColor)),
                  child: IconButton(
                    color: Colors.white,
                    icon: Icon(
                      Icons.mode_comment,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      anonymous
                          ? null
                          : showDialog(
                              context: context,
                              builder: (context) => AddComment());
                    },
                  ),
                ),
              ),
              _spotController.modelSelected.comments == null ||
                      _spotController.modelSelected.comments.length == 0
                  ? ListTile(
                      title: Text("Sem comentários",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                            fontSize: 14,
                            color: Hexcolor('#757685'),
                          ))),
                    )
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _spotController.modelSelected.comments.length,
                      itemBuilder: (context, index) {
                        final item =
                            _spotController.modelSelected.comments[index];
                        return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey[300]),
                              ),
                            ),
                            child: Padding(
                              child: ListTile(
                                subtitle: Text(
                                  "\"" + item.comment + "\"",
                                  style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Hexcolor('#757685'),
                                          fontStyle: FontStyle.italic)),
                                ),
                                title: Row(
                                  children: <Widget>[
                                    Text(item.user,
                                        style: GoogleFonts.nunito(
                                            textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Hexcolor('#757685'),
                                          fontWeight: FontWeight.bold,
                                        ))),
                                    Icon(
                                      Icons.star,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    Text(
                                        item.rating
                                            .toStringAsFixed(0)
                                            .toString(),
                                        style: GoogleFonts.nunito(
                                            textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ))),
                                  ],
                                ),
                              ),
                              padding: EdgeInsets.only(bottom: 20),
                            ));
                      },
                    ),
            ],
          ),
        );
      },
    );
  }

  buildCategory() {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(
            "Category",
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
              fontSize: 12,
              color: Hexcolor('#757685'),
              fontWeight: FontWeight.bold,
            )),
          ),
          subtitle: Text(
            _spotController.modelSelected.category.name,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
              fontSize: 14,
              color: Hexcolor('#757685'),
            )),
          ),
        );
      },
    );
  }

  buildTitle() {
    return Observer(
      builder: (_) {
        return ListTile(
          title: Text(
            _spotController.modelSelected?.title,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
              fontSize: 18,
              color: Hexcolor('#111236'),
              fontWeight: FontWeight.bold,
            )),
          ),
          trailing: anonymous
              ? null
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.pinkAccent)),
                  child: _spotController.isFavorite
                      ? IconButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.pinkAccent,
                          ),
                          onPressed: () {
                            _spotController.setIsFavorite(false);
                          },
                        )
                      : IconButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.pinkAccent,
                          ),
                          onPressed: () {
                            _spotController.setIsFavorite(true);
                          },
                        )),
          subtitle: Text(
            _spotController.modelSelected?.description,
            style: GoogleFonts.nunito(
                textStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey[350],
            )),
          ),
        );
      },
    );
  }
}
