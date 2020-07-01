import 'package:flutter/material.dart';
import 'package:myweatherapp/ui/forcast_card.dart';
import 'package:myweatherapp/data/weather_forcast_model.dart';

// widget function with weather model snapshot and buildcontext
Widget BottonView(
    AsyncSnapshot<WeatherForcastModel> snapshot, BuildContext context) {
  // variable to store forcastList to snapshot data list
  var forcastList = snapshot.data.list;

  // retunr a column
  return Column(
    // make the main axis aligment to left
    mainAxisAlignment: MainAxisAlignment.start,
    // included children of the return column
    children: [
      // text widget that is uppercase
      Text(
        "7-Day Weather Forcast".toUpperCase(),
        style: TextStyle(
            // size of the text to 14
            fontSize: 14,
            // color of the text to black
            color: Colors.black),
      ),
      Container(
        // container height 170
        height: 170,
        // padding insets symmetric
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: ListView.separated(
            // make the listView scroll direction horizontal
            scrollDirection: Axis.horizontal,
            //
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            //
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10)),
              //
              child: Container(
                //
                width: MediaQuery.of(context).size.width / 2.2,
                //
                height: 160,
                // container child that will hold the forcastcard
                child: forcastCard(snapshot, index),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff9661C3), Colors.white],
                    begin: Alignment.topLeft, end: Alignment.bottomLeft),
                ),
              ),
            ),
            // get length of the forcastList
            itemCount: forcastList.length),
        // child
      )
    ],
  );
}
