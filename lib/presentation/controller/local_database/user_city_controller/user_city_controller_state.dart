part of 'user_city_controller_bloc.dart';

abstract class UserCityControllerState extends Equatable {
  const UserCityControllerState();
}

class UserCityControllerInitial extends UserCityControllerState {
  @override
  List<Object> get props => [];
}

class UserCityLoading extends UserCityControllerState{
  @override
  List<Object?> get props => [];

}

class UserCitySaveSuccess extends UserCityControllerState{
  final List<WeatherModel> weatherModel;

  const UserCitySaveSuccess(this. weatherModel);
  @override
  List<Object?> get props => [ weatherModel];

}

class UserCityDeleteSuccess extends UserCityControllerState{
  final String successMessage;

  const UserCityDeleteSuccess(this.successMessage);
  @override
  List<Object?> get props => [successMessage];

}

class UserCityUpdateSuccess extends UserCityControllerState{
  final String successMessage;

  const UserCityUpdateSuccess(this.successMessage);
  @override
  List<Object?> get props => [successMessage];
}


class UserCityLoaded extends UserCityControllerState{
final List<WeatherModel> usermodel;
  const UserCityLoaded(this.usermodel);
  @override
  List<Object?> get props => [usermodel];

}


class UserCitySavingError extends UserCityControllerState{
  final String errorMessage;

  const UserCitySavingError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];

}

class UserCityFetchingError extends UserCityControllerState{
  final String errorMessage;

  const UserCityFetchingError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];

}

class CityWeatherLoaded extends UserCityControllerState{
  final WeatherModel usermodel;
  const CityWeatherLoaded(this.usermodel);
  @override
  List<Object?> get props => [usermodel];

}



