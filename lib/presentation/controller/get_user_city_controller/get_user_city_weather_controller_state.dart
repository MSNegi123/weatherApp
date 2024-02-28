part of 'get_user_city_weather_controller_bloc.dart';

abstract class GetUserCityWeatherControllerState extends Equatable {
  const GetUserCityWeatherControllerState();
}

class GetUserCityWeatherControllerInitial extends GetUserCityWeatherControllerState {
  @override
  List<Object> get props => [];
}


class UserCityWeatherLoading extends GetUserCityWeatherControllerState{
  @override
  List<Object?> get props => [];

}

class UserCityWeatherLoaded extends GetUserCityWeatherControllerState{
  final WeatherModel cityWeatherInformation;
  const UserCityWeatherLoaded(this.cityWeatherInformation);
  @override
  List<Object?> get props => [cityWeatherInformation];

}

class NewUserCityWeatherLoaded extends GetUserCityWeatherControllerState{
  final WeatherModel cityWeatherInformation;
  final String cityImageURL;

  const NewUserCityWeatherLoaded(this.cityWeatherInformation, this.cityImageURL);
  @override
  List<Object?> get props => [cityWeatherInformation, cityImageURL];

}

class UserCityWeatherLoadedSplashScreen extends GetUserCityWeatherControllerState{
  final WeatherModel cityWeatherInformation;
  final String cityImageURL;

  const UserCityWeatherLoadedSplashScreen(this.cityWeatherInformation, this.cityImageURL);
  @override
  List<Object?> get props => [cityWeatherInformation, cityImageURL];

}


class UserCityWeatherLoadingError extends GetUserCityWeatherControllerState{
  final String errorMessage;
  const UserCityWeatherLoadingError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];

}