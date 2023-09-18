import 'package:flutter/material.dart';

class bmiCal extends StatefulWidget {
  const bmiCal({super.key});

  @override
  State<bmiCal> createState() => _bmiCalState();
}




  



class _bmiCalState extends State<bmiCal> {


  double height = 0; // ส่วนสูง (เซนติเมตร)
  double weight = 0; // น้ำหนัก (กิโลกรัม)
  double bmi = 0; // ค่า BMI
  String bmiState = ""; // สถานะ BMI


  void _calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
      bmiState = bmiCalState();
    });
  }

  String bmiCalState() {
    if (bmi >= 30) {
        return "$bmi Obese";

      } else if (bmi >= 25.0 && bmi <= 29.9) {
        return  "$bmi Overweight"; 

      } else if (bmi >= 23.0 && bmi <= 24.9) {
        return "$bmi Normal";

      } else if (bmi >= 18.6 && bmi <= 22.9) {
        return "$bmi Underweight";
        
      } else if (bmi <= 18.5) {
        return "$bmi Underweight";
 
      }
    return "$bmi";
  }

  TextEditingController textarea = TextEditingController();
  TextEditingController textarea2 = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 212, 222),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 50,
          ),

          Container(
            child: Center(
              child: Text(
                'Height',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: textarea,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  height = double.parse(value);
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your height in cm',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ),

          SizedBox(
            height: 10,
          ),

          Container(
            child: Center(
              child: Text(
                'Weight',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: textarea2,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  weight = double.parse(value);
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your weight in kg',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ),

          SizedBox(
            height: 10,
          ),

          Container(
            child: Center(
              child: Text(
                'BMI',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          Container(
            child: Center(
              child: Text(
                '$bmiState',
                
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          
          SizedBox(
            height: 10,
          ),

          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (
                      
                    ) {
                      _calculateBMI();
                    },
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (

                      
                    ) {
                      textarea.text = "";
                      textarea2.text = "";
                    }
                    ,
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
         
        ],
      ),
    );
  }
}

