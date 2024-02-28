import 'package:flutterweatherapp/domian/entity/forcast_entity.dart';
import 'package:flutterweatherapp/domian/entity/weather_entity.dart';
import 'package:either_dart/either.dart';

abstract class BaseRemoteDataSource {
  Future<Either<String, WeatherModel>> getWeatherInfoForCurrentCity(String cityName);
  Future<Either<String,List<Daily>>> getDailyForecast();
  Future<Either<String,WeatherModel>> saveCurrentCityWeatherData(WeatherModel weatherModel);
  Future<Either<String,List<WeatherModel>>> saveUserCityData(WeatherModel weatherModel);
  Future<Either<String, WeatherModel>> getWeatherForUserCity(String cityName);
  Future<Either<String,List<WeatherModel>>> getUserCitiesWithWeather();
  Future<Either<String,WeatherModel>> syncCitiesWeather(String cityName, bool isCurrentCity);
  Future<Either<String,WeatherModel>> getCurrentCityWeather();
}