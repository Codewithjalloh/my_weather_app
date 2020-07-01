import 'package:http/http.dart';
import 'dart:convert';
import 'package:myweatherapp/data/weather_forcast_model.dart';
import 'package:myweatherapp/util/forcast.dart';


class Network {
  // get json data from openweather url link
  Future<WeatherForcastModel> getWeatherForcast({String cityName}) async {
    // url variable that that combine openweather url, city, and appId
    var finalURL = "https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+"&appid="+Util.appId+"&units=imperial";

    // get the response of the url using await and encode it
    final response = await get(Uri.encodeFull(finalURL));

    // check if the response connection status is 200
    if (response.statusCode == 200) {
      // get the actual mapped model (dart object)
      print("weather data: ${response.body}");

      // return model json decode
      return WeatherForcastModel.fromJson(json.decode(response.body));
    } else {
      // throw an error if response is not 200
      throw Exception("Error getting weather forcast");
    }
  }
}
