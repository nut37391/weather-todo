import 'package:flutter/material.dart';

// import '../screen/weather.dart';

class Sbox extends StatelessWidget {
  const Sbox(
      {super.key,
      required this.cityData,
      required this.showCustomDialog,
      required this.fetchWeatherData});

  final String cityData;

  final Function showCustomDialog;

  final Function fetchWeatherData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        fetchWeatherData(cityData);
      },
      child: Container(
          height: 80,
          width: 100,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromRGBO(37, 37, 37, 1),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 176, 166, 166).withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cityData,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  showCustomDialog(cityData);
                },
                icon: Icon(Icons.delete),
              )
            ],
          )),
    );
  }
}
