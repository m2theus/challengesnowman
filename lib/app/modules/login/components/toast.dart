import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Toast {
  Toast(this.titulo, this.subtitulo, this.type);
  var titulo;
  var subtitulo;
  var type;

  getSnack() {
    return type == "sucesso"
        ? Get.snackbar(titulo, subtitulo,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        overlayColor: Colors.white,
        backgroundColor: Colors.white,
        icon: new Icon(Icons.check,color: Colors.green,))
        : Get.snackbar(titulo, subtitulo,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        overlayColor: Colors.white,
        backgroundColor: Colors.white,
        icon: new Icon(Icons.error,color: Colors.red,));
  }
}
