class PopularLocations {
  PopularLocations({
      this.location, 
      this.address2, 
      this.pin, 
      this.country,});

  PopularLocations.fromJson(dynamic json) {
    location = json['location'];
    address2 = json['address2'];
    pin = json['pin'];
    country = json['country'];
  }
  String? location;
  String? address2;
  String? pin;
  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location'] = location;
    map['address2'] = address2;
    map['pin'] = pin;
    map['country'] = country;
    return map;
  }

}