
import 'package:dio/dio.dart';
import 'package:wtf_healthify/Api/api_key_strings.dart';
import 'package:wtf_healthify/api/api_end-points.dart';
import 'package:wtf_healthify/api/dio_http_client.dart';
import 'package:wtf_healthify/models/List_of_cities.dart';
import 'package:wtf_healthify/models/PopularLocations.dart';
import 'package:wtf_healthify/models/nearest_gym.dart';


class NearestGymService {
  DioHttpClient httpClient = DioHttpClient();


  Future<NearestGym> getNearestGym(int page,int limit,double lat,double long) async {

    Map<String,dynamic> queries ={
      ApiKeyStrings.page: page,
      ApiKeyStrings.limit:limit,
      ApiKeyStrings.lat:lat,
      ApiKeyStrings.long:long
    };

    final response = await httpClient.getRequest(ApiEndPoints.getNearestGyms, queries);
    if(response.statusCode == 200){
      final incomingData = NearestGym.fromJson(response.data);
      return incomingData;
    }
    throw Exception('Some arbitrary error');
  }

  Future<List<PopularLocations>> getCityList() async {

    final response = await httpClient.getRequest(ApiEndPoints.getListOfCities,null,Options(
      headers: {
        'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI0cTYwTWs3R0poeXg5IiwibmFtZSI6Ik5hcmVzaCIsImlhdCI6MTY2Mzc1MjEzNCwiZXhwIjoxNjY2MzQ0MTM0fQ.CtfnZC3Y58YcoLCD29v8Fjz24kQUeUfViDx6ukGJPFw',
      },
    ));
    if(response.statusCode == 200){
      final incomingData =  ListOfCities.fromJson(response.data);
      if(incomingData.data!=null&&incomingData.data!.isNotEmpty){
        return incomingData.data![0].popularLocations!;
      }
    }
    throw Exception('Some arbitrary error');
  }
}