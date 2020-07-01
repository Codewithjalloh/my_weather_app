import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// get the weather icon function
Widget getWeatherIcon({String weatherDescription, Color color, double size}) {
  // switch that will return weather icons based on the case
  switch (weatherDescription) {

    // for clear with fontAwersome icon sun
    case "Clear":
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
      break;
  // for cloud with fontAwersome icon cloud
    case "Clouds":
      {
        return Icon(
          FontAwesomeIcons.cloud,
          color: color,
          size: size,
        );
      }
      break;
  // for rain with fontAwersome icon cloudRain
    case "Rain":
      {
        return Icon(
          FontAwesomeIcons.cloudRain,
          color: color,
          size: size,
        );
      }
      break;
  // for snow with fontAwersome icon snowman
    case "Clear":
      {
        return Icon(
          FontAwesomeIcons.snowman,
          color: color,
          size: size,
        );
      }
      break;
  // for default with fontAwersome icon sun
    default:
      {
        return Icon(
          FontAwesomeIcons.sun,
          color: color,
          size: size,
        );
      }
      break;

  }
}
