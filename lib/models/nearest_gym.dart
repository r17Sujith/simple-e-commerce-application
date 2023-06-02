class NearestGym {
  NearestGym({
    List<Pagination>? pagination,
    bool? status,
    String? message,
    List<Data>? data,}){
    _pagination = pagination;
    _status = status;
    _message = message;
    _data = data;
  }

  NearestGym.fromJson(dynamic json) {
    if (json['pagination'] != null) {
      _pagination = [];
      json['pagination'].forEach((v) {
        _pagination?.add(Pagination.fromJson(v));
      });
    }
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Pagination>? _pagination;
  bool? _status;
  String? _message;
  List<Data>? _data;

  List<Pagination>? get pagination => _pagination;
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pagination != null) {
      map['pagination'] = _pagination?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
    dynamic seoContent,
    String? pocName,
    String? pocMobile,
    String? userId,
    String? gymName,
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? latitude,
    String? longitude,
    String? pin,
    String? country,
    String? name,
    String? distance,
    dynamic addonCategory,
    dynamic addonCatId,
    dynamic offerType,
    dynamic offerValue,
    String? distanceText,
    String? durationText,
    String? duration,
    num? rating,
    dynamic text1,
    dynamic text2,
    dynamic planName,
    dynamic planDuration,
    dynamic planPrice,
    dynamic planDescription,
    String? coverImage,
    List<Gallery>? gallery,
    List<Benefits>? benefits,
    String? type,
    String? description,
    String? status,
    String? slug,
    String? categoryId,
    num? totalRating,
    String? isPartial,
    int? isCash,
    String? categoryName,
    List<dynamic>? offerDetails,
    num? wtfShare,
    int? isDiscount,}){
    _seoContent = seoContent;
    _pocName = pocName;
    _pocMobile = pocMobile;
    _userId = userId;
    _gymName = gymName;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _state = state;
    _latitude = latitude;
    _longitude = longitude;
    _pin = pin;
    _country = country;
    _name = name;
    _distance = distance;
    _addonCategory = addonCategory;
    _addonCatId = addonCatId;
    _offerType = offerType;
    _offerValue = offerValue;
    _distanceText = distanceText;
    _durationText = durationText;
    _duration = duration;
    _rating = rating;
    _text1 = text1;
    _text2 = text2;
    _planName = planName;
    _planDuration = planDuration;
    _planPrice = planPrice;
    _planDescription = planDescription;
    _coverImage = coverImage;
    _gallery = gallery;
    _benefits = benefits;
    _type = type;
    _description = description;
    _status = status;
    _slug = slug;
    _categoryId = categoryId;
    _totalRating = totalRating;
    _isPartial = isPartial;
    _isCash = isCash;
    _categoryName = categoryName;
    _offerDetails = offerDetails;
    _wtfShare = wtfShare;
    _isDiscount = isDiscount;
  }

  Data.fromJson(dynamic json) {
    _seoContent = json['seo_content'];
    _pocName = json['poc_name'];
    _pocMobile = json['poc_mobile'];
    _userId = json['user_id'];
    _gymName = json['gym_name'];
    _address1 = json['address1'];
    _address2 = json['address2'];
    _city = json['city'];
    _state = json['state'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _pin = json['pin'];
    _country = json['country'];
    _name = json['name'];
    _distance = json['distance'];
    _addonCategory = json['addon_category'];
    _addonCatId = json['addon_cat_id'];
    _offerType = json['offer_type'];
    _offerValue = json['offer_value'];
    _distanceText = json['distance_text'];
    _durationText = json['duration_text'];
    _duration = json['duration'];
    _rating = json['rating'];
    _text1 = json['text1'];
    _text2 = json['text2'];
    _planName = json['plan_name'];
    _planDuration = json['plan_duration'];
    _planPrice = json['plan_price'];
    _planDescription = json['plan_description'];
    _coverImage = json['cover_image'];
    if (json['gallery'] != null) {
      _gallery = [];
      json['gallery'].forEach((v) {
        _gallery?.add(Gallery.fromJson(v));
      });
    }
    if (json['benefits'] != null) {
      _benefits = [];
      json['benefits'].forEach((v) {
        _benefits?.add(Benefits.fromJson(v));
      });
    }
    _type = json['type'];
    _description = json['description'];
    _status = json['status'];
    _slug = json['slug'];
    _categoryId = json['category_id'];
    _totalRating = json['total_rating'];
    _isPartial = json['is_partial'];
    _isCash = json['is_cash'];
    _categoryName = json['category_name'];
    if (json['offer_details'] != null) {
      _offerDetails = [];
      json['offer_details'].forEach((v) {
        _offerDetails?.add((v));
      });
    }
    _wtfShare = json['wtf_share'];
    _isDiscount = json['is_discount'];
  }
  dynamic _seoContent;
  String? _pocName;
  String? _pocMobile;
  String? _userId;
  String? _gymName;
  String? _address1;
  String? _address2;
  String? _city;
  String? _state;
  String? _latitude;
  String? _longitude;
  String? _pin;
  String? _country;
  String? _name;
  String? _distance;
  dynamic _addonCategory;
  dynamic _addonCatId;
  dynamic _offerType;
  dynamic _offerValue;
  String? _distanceText;
  String? _durationText;
  String? _duration;
  num? _rating;
  dynamic _text1;
  dynamic _text2;
  dynamic _planName;
  dynamic _planDuration;
  dynamic _planPrice;
  dynamic _planDescription;
  String? _coverImage;
  List<Gallery>? _gallery;
  List<Benefits>? _benefits;
  String? _type;
  String? _description;
  String? _status;
  String? _slug;
  String? _categoryId;
  num? _totalRating;
  String? _isPartial;
  int? _isCash;
  String? _categoryName;
  List<dynamic>? _offerDetails;
  num? _wtfShare;
  int? _isDiscount;

  dynamic get seoContent => _seoContent;
  String? get pocName => _pocName;
  String? get pocMobile => _pocMobile;
  String? get userId => _userId;
  String? get gymName => _gymName;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get city => _city;
  String? get state => _state;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get pin => _pin;
  String? get country => _country;
  String? get name => _name;
  String? get distance => _distance;
  dynamic get addonCategory => _addonCategory;
  dynamic get addonCatId => _addonCatId;
  dynamic get offerType => _offerType;
  dynamic get offerValue => _offerValue;
  String? get distanceText => _distanceText;
  String? get durationText => _durationText;
  String? get duration => _duration;
  num? get rating => _rating;
  dynamic get text1 => _text1;
  dynamic get text2 => _text2;
  dynamic get planName => _planName;
  dynamic get planDuration => _planDuration;
  dynamic get planPrice => _planPrice;
  dynamic get planDescription => _planDescription;
  String? get coverImage => _coverImage;
  List<Gallery>? get gallery => _gallery;
  List<Benefits>? get benefits => _benefits;
  String? get type => _type;
  String? get description => _description;
  String? get status => _status;
  String? get slug => _slug;
  String? get categoryId => _categoryId;
  num? get totalRating => _totalRating;
  String? get isPartial => _isPartial;
  int? get isCash => _isCash;
  String? get categoryName => _categoryName;
  List<dynamic>? get offerDetails => _offerDetails;
  num? get wtfShare => _wtfShare;
  int? get isDiscount => _isDiscount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['seo_content'] = _seoContent;
    map['poc_name'] = _pocName;
    map['poc_mobile'] = _pocMobile;
    map['user_id'] = _userId;
    map['gym_name'] = _gymName;
    map['address1'] = _address1;
    map['address2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['pin'] = _pin;
    map['country'] = _country;
    map['name'] = _name;
    map['distance'] = _distance;
    map['addon_category'] = _addonCategory;
    map['addon_cat_id'] = _addonCatId;
    map['offer_type'] = _offerType;
    map['offer_value'] = _offerValue;
    map['distance_text'] = _distanceText;
    map['duration_text'] = _durationText;
    map['duration'] = _duration;
    map['rating'] = _rating;
    map['text1'] = _text1;
    map['text2'] = _text2;
    map['plan_name'] = _planName;
    map['plan_duration'] = _planDuration;
    map['plan_price'] = _planPrice;
    map['plan_description'] = _planDescription;
    map['cover_image'] = _coverImage;
    if (_gallery != null) {
      map['gallery'] = _gallery?.map((v) => v.toJson()).toList();
    }
    if (_benefits != null) {
      map['benefits'] = _benefits?.map((v) => v.toJson()).toList();
    }
    map['type'] = _type;
    map['description'] = _description;
    map['status'] = _status;
    map['slug'] = _slug;
    map['category_id'] = _categoryId;
    map['total_rating'] = _totalRating;
    map['is_partial'] = _isPartial;
    map['is_cash'] = _isCash;
    map['category_name'] = _categoryName;
    if (_offerDetails != null) {
      map['offer_details'] = _offerDetails?.map((v) => v.toJson()).toList();
    }
    map['wtf_share'] = _wtfShare;
    map['is_discount'] = _isDiscount;
    return map;
  }

}

class Benefits {
  Benefits({
    int? id,
    String? uid,
    String? gymId,
    String? name,
    String? breif,
    String? image,
    String? status,
    String? dateAdded,
    String? lastUpdated,
    String? images,}){
    _id = id;
    _uid = uid;
    _gymId = gymId;
    _name = name;
    _breif = breif;
    _image = image;
    _status = status;
    _dateAdded = dateAdded;
    _lastUpdated = lastUpdated;
    _images = images;
  }

  Benefits.fromJson(dynamic json) {
    _id = json['id'];
    _uid = json['uid'];
    _gymId = json['gym_id'];
    _name = json['name'];
    _breif = json['breif'];
    _image = json['image'];
    _status = json['status'];
    _dateAdded = json['date_added'];
    _lastUpdated = json['last_updated'];
    _images = json['images'];
  }
  int? _id;
  String? _uid;
  String? _gymId;
  String? _name;
  String? _breif;
  String? _image;
  String? _status;
  String? _dateAdded;
  String? _lastUpdated;
  String? _images;

  int? get id => _id;
  String? get uid => _uid;
  String? get gymId => _gymId;
  String? get name => _name;
  String? get breif => _breif;
  String? get image => _image;
  String? get status => _status;
  String? get dateAdded => _dateAdded;
  String? get lastUpdated => _lastUpdated;
  String? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uid'] = _uid;
    map['gym_id'] = _gymId;
    map['name'] = _name;
    map['breif'] = _breif;
    map['image'] = _image;
    map['status'] = _status;
    map['date_added'] = _dateAdded;
    map['last_updated'] = _lastUpdated;
    map['images'] = _images;
    return map;
  }

}

class Gallery {
  Gallery({
    int? id,
    String? uid,
    String? gymId,
    String? categoryId,
    String? images,
    String? status,
    String? dateAdded,
    String? lastUpdated,
    String? type,}){
    _id = id;
    _uid = uid;
    _gymId = gymId;
    _categoryId = categoryId;
    _images = images;
    _status = status;
    _dateAdded = dateAdded;
    _lastUpdated = lastUpdated;
    _type = type;
  }

  Gallery.fromJson(dynamic json) {
    _id = json['id'];
    _uid = json['uid'];
    _gymId = json['gym_id'];
    _categoryId = json['category_id'];
    _images = json['images'];
    _status = json['status'];
    _dateAdded = json['date_added'];
    _lastUpdated = json['last_updated'];
    _type = json['type'];
  }
  int? _id;
  String? _uid;
  String? _gymId;
  String? _categoryId;
  String? _images;
  String? _status;
  String? _dateAdded;
  String? _lastUpdated;
  String? _type;

  int? get id => _id;
  String? get uid => _uid;
  String? get gymId => _gymId;
  String? get categoryId => _categoryId;
  String? get images => _images;
  String? get status => _status;
  String? get dateAdded => _dateAdded;
  String? get lastUpdated => _lastUpdated;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uid'] = _uid;
    map['gym_id'] = _gymId;
    map['category_id'] = _categoryId;
    map['images'] = _images;
    map['status'] = _status;
    map['date_added'] = _dateAdded;
    map['last_updated'] = _lastUpdated;
    map['type'] = _type;
    return map;
  }

}

class Pagination {
  Pagination({
    int? pagination,
    int? limit,
    int? pages,}){
    _pagination = pagination;
    _limit = limit;
    _pages = pages;
  }

  Pagination.fromJson(dynamic json) {
    _pagination = json['pagination'];
    _limit = json['limit'];
    _pages = json['pages'];
  }
  int? _pagination;
  int? _limit;
  int? _pages;

  int? get pagination => _pagination;
  int? get limit => _limit;
  int? get pages => _pages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pagination'] = _pagination;
    map['limit'] = _limit;
    map['pages'] = _pages;
    return map;
  }

}