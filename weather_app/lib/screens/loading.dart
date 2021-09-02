import 'package:flutter/material.dart';
import 'package:weather_app/data/my_location.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weather_screen.dart';

const apikey = 'edb1444e12fdd67bdd48498689e36735';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');
    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(
        parseWeatherData: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: null,
          child: Text(
            'Get my location',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
        ),
      ),
    );
  }
}
