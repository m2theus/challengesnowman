class PlaceSpot {
  String description;
  String id;
  String placeId;
  String reference;
  List<String> types;

  PlaceSpot(
      {this.description,
        this.id,
        this.placeId,
        this.reference,
        this.types});

  PlaceSpot.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    placeId = json['place_id'];
    reference = json['reference'];
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['id'] = this.id;
    data['place_id'] = this.placeId;
    data['reference'] = this.reference;
    data['types'] = this.types;
    return data;
  }
}
