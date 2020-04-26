import 'package:challengesnowman/app/modules/shared/components/button.dart';
import 'package:challengesnowman/app/modules/tabs/map/components/spot/new_spot_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageSelect extends StatefulWidget {
  @override
  _ImageSelectState createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
  final _imageProvider =
      Provider.of<NewSpotController>(Get.context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(
          Icons.camera_alt,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () async => await showDialog(
          context: context,
          builder: (context) => SizedBox(height: 150, child: _picker()),
        ),
      ),
    );
  }

  _picker() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.20,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          title: Text(
            "Which option do you want?",
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
          content: Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              ButtonCustom(
                  label: "Camera",
                  onTap: () => _openCamera(),
                  width: MediaQuery.of(context).size.width * 0.20),
              ButtonCustom(
                  label: "Gallery",
                  onTap: () => _openGallery(),
                  width: MediaQuery.of(context).size.width * 0.20),
            ],
          ),
        ));
  }

  _openCamera() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((image) {
      _imageProvider.setImage(image);
      Navigator.pop(context);
    });
  }

  _openGallery() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      _imageProvider.setImage(image);
      Navigator.pop(context);
    });
  }
}
