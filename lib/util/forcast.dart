import 'package:intl/intl.dart';

class Util {
  // openweathermap api key
  static String appId = "32a4171176f68f5d5c27383d8fc7c01d";

  // format the api date to normal human date convert
  static String getFormatedDate(DateTime dateTime) {
    return DateFormat("EEEE, MMM, d, y").format(dateTime);
  }
}