import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterweatherapp/const/services.dart';
import 'package:flutterweatherapp/domian/entity/weather_entity.dart';
import 'package:flutterweatherapp/presentation/controller/HomeController/home_controller_bloc.dart';
import 'package:flutterweatherapp/presentation/controller/get_daily_forecast_controller/get_daily_forecast_bloc.dart';
import 'package:flutterweatherapp/presentation/controller/local_database/user_city_controller/user_city_controller_bloc.dart';
import 'package:flutterweatherapp/presentation/controller/save_current_city%20controller/save_current_city_bloc.dart';
import 'package:flutterweatherapp/routes/weather_routes.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:home_widget/home_widget.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import 'app_color.dart';
import 'app_strings.dart';

class AppUtils {
  static String convertTextToLower(String cityName) {
    return cityName.toLowerCase();
  }

  static String convertTextToUpper(String text) {
    return text.toUpperCase();
  }

  static String convertFirstTextToUpper(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  static String getFormattedDate() {
    DateTime now = DateTime.now();

    List<String> monthNames = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    String month = monthNames[now.month];
    String year = now.year.toString();

    return '$month $year';
  }

  Widget loadingSpinner = Center(
    child: SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(WeatherAppColor.redColor),
          strokeWidth: 3,
        )),
  );

  IconData getWeatherIcon(String weatherCode) {
    switch (weatherCode) {
      case "01d":
        return WeatherIcons.day_sunny;
      case "02d":
        return WeatherIcons.day_cloudy;
      case "03d":
        return WeatherIcons.cloud;
      case "04d":
        return WeatherIcons.cloudy;
      case "09d":
        return WeatherIcons.showers;
      case "10d":
        return WeatherIcons.rain;
      case "11d":
        return WeatherIcons.thunderstorm;
      case "13d":
        return WeatherIcons.snow;
      default:
        return WeatherIcons.refresh;
    }
  }


  String getWeatherIconURL(String weatherCode) {
    return WeatherAppServices.iconURL +
        weatherCode +
        WeatherAppServices.iconSize;
  }

  static List<String> getNextFourDays() {
    List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    DateTime currentDate = DateTime.now();
    int todayIndex = currentDate.weekday % 7;

    List<String> nextDays = [];
    for (int i = 1; i <= 4; i++) {
      DateTime nextDate = currentDate.add(Duration(days: i));
      String day = daysOfWeek[nextDate.weekday % 7];
      String dayWithNumber = '$day ${nextDate.day}';
      nextDays.add(dayWithNumber);
    }

    return nextDays;
  }

  static String formatDateTime(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);
    String formattedDateTime = DateFormat('M/d/yyyy h:mm a').format(dateTime);
    return formattedDateTime;
  }

  static void saveCity(
      WeatherModel cityWeatherInformation, BuildContext context) {
    final userCityBloc = BlocProvider.of<SaveCurrentCityBloc>(context);
    userCityBloc.add(SaveCurrentCityWeather(cityWeatherInformation));
  }

  static void saveUserCity(
      WeatherModel cityWeatherInformation, BuildContext context) {
    final userCityBloc = BlocProvider.of<UserCityControllerBloc>(context);
    userCityBloc.add(SaveUserCity(cityWeatherInformation));
  }

  static String extractTime(DateTime dateTime) {
    final formatter = DateFormat('HH:mm');
    final timeString = formatter.format(dateTime);
    return timeString;
  }

  static void updateHomeScreenWidget(WeatherModel weatherData) {
    HomeWidget.saveWidgetData<String>('city_name', weatherData.name);
    HomeWidget.saveWidgetData<String>(
        'temprature', (weatherData.main.temp).toString());
    HomeWidget.saveWidgetData<String>(
        'weather_icon_url',
        (WeatherAppServices.iconURL +
                weatherData.weather[0].icon +
                WeatherAppServices.iconSize)
            .toString());
    HomeWidget.saveWidgetData<String>(
        'last_update', AppUtils.extractTime(weatherData.updatedAt));
    HomeWidget.updateWidget(
      iOSName: WeatherAppString.iOSWidgetName,
      androidName: WeatherAppString.androidWidgetName,
    );
  }

  static void showToastMessage(String message, Toast length) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


}
