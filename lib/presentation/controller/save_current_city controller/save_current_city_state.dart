part of 'save_current_city_bloc.dart';

abstract class SaveCurrentCityState extends Equatable {
  const SaveCurrentCityState();
}

class SaveCurrentCityInitial extends SaveCurrentCityState {
  @override
  List<Object> get props => [];
}

class SavingCurrentCity extends SaveCurrentCityState{
  @override
  List<Object?> get props => [];

}

class CurrentCitySaved extends SaveCurrentCityState{
  final WeatherModel currentCityData;
  const CurrentCitySaved(this.currentCityData);
  @override
  List<Object?> get props => [currentCityData];

}

class CurrentCitySavingError extends SaveCurrentCityState{
  final String errorMessage;
  const CurrentCitySavingError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}