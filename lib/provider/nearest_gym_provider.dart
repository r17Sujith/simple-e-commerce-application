import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wtf_healthify/enums/wtf_category_enum.dart';
import 'package:wtf_healthify/models/PopularLocations.dart';
import 'package:wtf_healthify/models/nearest_gym.dart';
import 'package:wtf_healthify/services/nearest_gym_service.dart';
import 'package:wtf_healthify/utils/shared_preference.dart';
import 'package:wtf_healthify/utils/utility_methods.dart';


class NearestGymProvider extends ChangeNotifier {
  int _page = 1;
  int get page => _page;

  final getNearestGym = NearestGymService();
  bool isLoading = false;
  bool isCityLoading = false;
  String _city="";
  String _address="";

  List<Data> _data = <Data>[];
  List<PopularLocations> _listOfCities = <PopularLocations>[];
  List<WTFCategoryEnum> _category = WTFCategoryEnum.values;
  WTFCategoryEnum _selectedCategory = WTFCategoryEnum.all;
  String _searchQuery = "";

  List<Data> get data => _data;
  List<PopularLocations> get listOfCities => _listOfCities;
  List<WTFCategoryEnum> get category => _category;
  WTFCategoryEnum get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  String get city => _city;
  String get address => _address;

  Future<void> callGetNearestGym({bool refresh = false}) async {
    if (isLoading) return;

    if (_page > 1 && !refresh) {
      isLoading = true;
      notifyListeners();
    }

    if (refresh) {
      _page = 1;
      _data.clear();
      notifyListeners();
    }
    double latitude=0.0;
    double longitude=0.0;
    if(sharedPrefs.selectedLocation==null||sharedPrefs.selectedLocation!.isEmpty){
      await UtilityMethods.checkLocationPermission();
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

         latitude = position.latitude;
         longitude = position.longitude;

      } catch (e) {
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    } else {
      try {
        List<Location> locations = await locationFromAddress(sharedPrefs.selectedLocation!);
        latitude = locations.first.latitude;
        longitude = locations.first.longitude;

      } catch (e) {
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    }
    await getNearestGym.getNearestGym(_page, 10,latitude,longitude).then((response) {
      if (response.status!) {
        if (response.pagination![0].pages! > _page) {
          _page = _page + 1;
        }
        _data.addAll(response.data!);
        _city = _data.first.city!;
        _address = _data.first.address2!;
      } else{
        if (kDebugMode) {
          print("Error ${response.message}");
        }
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void setCategory(WTFCategoryEnum category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<Data> getFilteredData() {
    return _data.where((gym) {
      bool matchesCategory = _selectedCategory.value == "All" || gym.categoryName == _selectedCategory.value;
      bool matchesSearch = _searchQuery.isEmpty ||
          (gym.gymName?.toLowerCase().contains(_searchQuery.toLowerCase()) ?? false);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  Future<void> callGetCities({bool refresh = false}) async {
    if(_listOfCities.isNotEmpty) return;
    if (isCityLoading) return;

    await getNearestGym.getCityList().then((response) {
      _listOfCities.addAll(response);
    });
    isCityLoading = false;
    notifyListeners();
  }
}
