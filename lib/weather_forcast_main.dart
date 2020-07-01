import 'package:flutter/material.dart';
import 'package:myweatherapp/data/weather_forcast_model.dart';
import 'package:myweatherapp/network.dart';
import 'package:myweatherapp/ui/mid_view.dart';
import 'package:myweatherapp/ui/bottom_view.dart';

class WeatherForcast extends StatefulWidget {
  @override
  _WeatherForcastState createState() => _WeatherForcastState();
}

class _WeatherForcastState extends State<WeatherForcast> {

  Future<WeatherForcastModel> forcastObject;
  String _cityName = "London";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forcastObject = getWeather(cityName: _cityName);

    forcastObject.then((weather) {
      print(weather.list[0].weather[0].main);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForcastModel>(
              future: forcastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForcastModel> snapshot) {

                if (snapshot.hasData) {
                  return Column(
                    children: [
                      // call the midView widget
                      MidView(snapshot),
                      // call the bottomView widget
                      BottonView(snapshot, context),
                    ],
                  );
                } else {
                  // return a progress indicator if error found
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // custom textField widget
  Widget textFieldView() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            icon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            // set state value will equal city name
            setState(() {
              _cityName = value;
              forcastObject = getWeather(cityName: _cityName);
            });
          },
        ),
      ),

    );
  }

  // future get weather function with city name param
  Future<WeatherForcastModel> getWeather({String cityName}) {
    // allow user to input a city name from the get weather forcast api
    Network().getWeatherForcast(cityName: _cityName);
  }
}


