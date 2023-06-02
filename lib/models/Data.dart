import 'PopularLocations.dart';

class Data {
  Data({
      this.id,
      this.uid, 
      this.city, 
      this.dateAdded, 
      this.status, 
      this.popularLocations, 
      this.image, 
      this.lastUpdated,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    uid = json['uid'];
    city = json['city'];
    dateAdded = json['date_added'];
    status = json['status'];
    if (json['popular_locations'] != null) {
      popularLocations = [];
      json['popular_locations'].forEach((v) {
        popularLocations?.add(PopularLocations.fromJson(v));
      });
    }
    image = json['image'];
    lastUpdated = json['last_updated'];
  }
  String? id;
  String? uid;
  String? city;
  String? dateAdded;
  String? status;
  List<PopularLocations>? popularLocations;
  String? image;
  dynamic lastUpdated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uid'] = uid;
    map['city'] = city;
    map['date_added'] = dateAdded;
    map['status'] = status;
    final popularLocations = this.popularLocations;
    if (popularLocations != null) {
      map['popular_locations'] = popularLocations.map((v) => v.toJson()).toList();
    }
    map['image'] = image;
    map['last_updated'] = lastUpdated;
    return map;
  }

}