import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseproject/assets/assets.dart';
import 'package:firebaseproject/constants/colors.dart';
import 'package:firebaseproject/screens/email_auth/login_screen.dart';
import 'package:firebaseproject/widgets/weather_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaysScreen extends StatefulWidget {
  final dailyForecastWeather;

  const DaysScreen({super.key, required this.dailyForecastWeather});

  @override
  State<DaysScreen> createState() => _DaysScreenState();
}

class _DaysScreenState extends State<DaysScreen> {
  final Constants _constants = Constants();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var weatherData = widget.dailyForecastWeather;

    //function to get weather
    Map getForecastWeather(int index) {
      int maxWindSpeed = weatherData[index]["day"]["maxwind_kph"].toInt();
      int avgHumidity = weatherData[index]["day"]["avghumidity"].toInt();
      int chanceOfRain =
          weatherData[index]["day"]["daily_chance_of_rain"].toInt();

      var parsedDate = DateTime.parse(weatherData[index]["date"]);
      var forecastDate = DateFormat('EEEE, d MMMM').format(parsedDate);

      String weatherName = weatherData[index]["day"]["condition"]["text"];
      String weatherIcon =
          weatherName.replaceAll(' ', '').toLowerCase() + ".png";

      int minTemperature = weatherData[index]["day"]["mintemp_c"].toInt();
      int maxTemperature = weatherData[index]["day"]["maxtemp_c"].toInt();

      var forecastData = {
        'maxWindSpeed': maxWindSpeed,
        'avgHumidity': avgHumidity,
        'chanceOfRain': chanceOfRain,
        'forecastDate': forecastDate,
        'weatherName': weatherName,
        'weatherIcon': weatherIcon,
        'minTemperature': minTemperature,
        'maxTemperature': maxTemperature
      };
      return forecastData;
    }

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Forecasts'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                logOut();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/" + getForecastWeather(0)["weatherIcon"],
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                getForecastWeather(0)["weatherName"],
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Container(
              width: size.width * .8,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherItem(
                    value: getForecastWeather(0)["maxWindSpeed"],
                    unit: "km/h",
                    imageUrl: "assets/images/windspeed.png",
                  ),
                  WeatherItem(
                    value: getForecastWeather(0)["avgHumidity"],
                    unit: "%",
                    imageUrl: "assets/images/humidity.png",
                  ),
                  WeatherItem(
                    value: getForecastWeather(0)["chanceOfRain"],
                    unit: "%",
                    imageUrl: "assets/images/lightrain.png",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getForecastWeather(0)["maxTemperature"].toString(),
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'o',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  Text(
                    "Weather Forecast for 7 days",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 400,
              width: size.width * .9,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    final weatherData = getForecastWeather(index);

                    // children: [
                    return Card(
                      elevation: 3.0,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  weatherData["forecastDate"],
                                  style: const TextStyle(
                                    color: Color(0xff6696f5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          getForecastWeather(
                                                  0)["maxTemperature"]
                                              .toString(),
                                          style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'o',
                                          style: TextStyle(
                                            color: AppColors.blackColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/' +
                                          getForecastWeather(0)["weatherIcon"],
                                      width: 30,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      getForecastWeather(0)["weatherName"],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      getForecastWeather(0)["chanceOfRain"]
                                              .toString() +
                                          "%",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      AppAssets.images.lightrain,
                                      width: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    // Navigator.pushReplacement(context, AppRouter.loginPage);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
