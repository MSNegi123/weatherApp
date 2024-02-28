import 'package:either_dart/either.dart';
import 'package:flutterweatherapp/domian/entity/forcast_entity.dart';
import 'package:flutterweatherapp/domian/entity/weather_entity.dart';

abstract class BaseRemoteRepository{

  Future<Either<String, WeatherModel>> getWeatherForCurrentCity(String cityName);
  Future<Either<String,List<Daily>>> getDailyForecast();
  Future<Either<String,WeatherModel>> saveCurrentWeatherData(WeatherModel weatherModel);
  Future<Either<String,List<WeatherModel>>> saveUserCityData(WeatherModel weatherModel);
  Future<Either<String, WeatherModel>> getWeatherForUserCity(String cityName);
  Future<Either<String,List<WeatherModel>>> getUserCitiesWithWeather();
  Future<Either<String,WeatherModel>> syncCitiesWeather(String cityName, bool isCurrentCity);
  Future<Either<String,WeatherModel>> getCurrentCityWeather();
}