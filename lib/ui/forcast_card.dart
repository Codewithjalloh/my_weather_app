import 'package:myweatherapp/util/convert_icon.dart';
import 'package:myweatherapp/util/forcast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myweatherapp/data/weather_forcast_model.dart';

// forcastCard functions with snapshot and index param
Widget forcastCard(AsyncSnapshot<WeatherForcastModel> snapshot, int index) {

  // variable that holds the snapshot data list
  var forcastList = snapshot.data.list;

  // get the date from the model and split it just to have part of the date
  var dayOfWeek = "";
  DateTime date = DateTime.fromMicrosecondsSinceEpoch(forcastList[index].dt * 1000);
  var fullDate = Util.getFormatedDate(date);
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    // set the main and cross axis alignment to left
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,

    //
    children: [
      Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(dayOfWeek),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
              weatherDescription: forcastList[index].weather[0].main,
              color: Colors.pinkAccent),
          ),
          Column(
            children: [
              Padding(
                padding:EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("${forcastList[index].temp.min.toStringAsFixed(0)} ˚F"),
                    Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white, size: 17,),
                  ],
                ),
              ),
              Padding(
                padding:EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("${forcastList[index].temp.max.toStringAsFixed(0)} ˚F"),
                    Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white, size: 17,),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("Hum: ${forcastList[index].humidity.toStringAsFixed(0)} %"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("Win: ${forcastList[index].speed.toStringAsFixed(1)} mi/h"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ],
  );
}