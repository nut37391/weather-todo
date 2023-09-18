import 'package:flutter/material.dart';
import 'package:hellooooo/screen/addlocation.dart';
import 'package:hellooooo/screen/showweather.dart';
import 'package:hellooooo/widget/box.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/data_list_model.dart';
import '../model/model.dart';

class Weather_app extends StatefulWidget {
  const Weather_app({super.key});

  @override
  State<Weather_app> createState() => _Weather_appState();
}

class _Weather_appState extends State<Weather_app> {
  Future<void> showCustomDialog(cityName) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this city?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                setState(() {
                  cityList.remove(cityName);
                  saveCity();
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> showCustomDialogErr(String? cityName) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('City ${cityName ?? ''} not found. Please try again.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> fetchWeatherData(String city) async {
    try {
      final apiKey = '07d9da7b32cc179e45f35df721e37f7d';
      final apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey';

      final response = await Dio().get(apiUrl);

      response.statusCode == 200;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Show_weather(
            city: city,
            weatherData: WeatherData.fromJson(response.data),
          ),
        ),
      );
    } on DioException catch (e) {
      print(e);
      showCustomDialogErr(city);
    }
  }

  final myBox = Hive.box<DataList>('myBox');

  List<String> city = [];

  List<String> cityList = [];

  void initState() {
    super.initState();

    _openHiveBox();
  }

  Future<void> _openHiveBox() async {
    print('open hive');
    setState(() {
      print('test');
      if (myBox.get('weather') != null) {
        print(myBox.get('weather')?.city);
        cityList = myBox.get('weather')?.city ?? [];
      }
    });
  }

  saveCity() async {
    myBox.put('weather', DataList()..city = cityList);
    print(cityList);
    print(myBox.get('weather'));
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cityList.length,
              itemBuilder: (BuildContext context, int index) {
                return Sbox(
                    cityData: cityList[index],
                    showCustomDialog: showCustomDialog,
                    fetchWeatherData: fetchWeatherData);
              },
            ),
          ),
          Container(
              child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              SafeArea(
                child: ElevatedButton(
                  onPressed: () async {
                    final res = await showModalBottomSheet(
                      context: context,
                      builder: (context) => AddLocation(),
                    );

                    if (res != null) {
                      final newData = res;

                      setState(() {
                        cityList.add(newData);
                        saveCity();
                      });
                    }
                  },
                  child: Text('Add Location'),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
