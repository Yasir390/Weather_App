import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_apps/screens/location_screen.dart';
import 'package:weather_apps/services/location.dart';
import 'package:weather_apps/services/networking.dart';
import 'package:weather_apps/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  initState() {
    super.initState();
    getLocationData();

  }


  void getLocationData() async {

   WeatherModel weatherModel = WeatherModel();
   var weatherData = await weatherModel.getLocationWeather();
   Navigator.push(context, MaterialPageRoute(builder: (context){return LocationScreen(locationWeather:weatherData);}));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  SpinKitWaveSpinner(
          color: Colors.red,
          size: 100.0,
          waveColor: Colors.yellow,
          trackColor:  Colors.greenAccent,
        ),
      ),
    );
  }
}





