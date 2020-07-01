import 'package:flutter/material.dart';
import 'package:myweatherapp/data/weather_forcast_model.dart';
import 'package:flutter/cupertino.dart';

Widget MidView(AsyncSnapshot<WeatherForcastModel> snapshot) {

  // declared variables from the weather data
  var forcastList = snapshot.data.list;
  var country = snapshot.data.city.name;
  var forcast = forcastList[0];
  var formattedDate = DateTime.fromMillisecondsSinceEpoch(forcast.dt * 1000);

}