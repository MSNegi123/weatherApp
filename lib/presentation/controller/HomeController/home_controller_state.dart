part of 'home_controller_bloc.dart';

abstract class HomeControllerState extends Equatable {
  const HomeControllerState();
}

class HomeControllerInitial extends HomeControllerState {
  @override
  List<Object> get props => [];
}



class CurrentCityWeatherInfoLoading extends HomeControllerState{
  @override
  List<Object?> get props => [];

}

class CurrentCityDataLoaded extends HomeControllerState{
  final WeatherModel currentCityData;
  const  CurrentCityDataLoaded(this.currentCityData);
  @override
  List<Object?> get props => [currentCityData];

}

class CurrentCityWeatherInfoLoadingError extends HomeControllerState{
  final String errorMessage;
  const CurrentCityWeatherInfoLoadingError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class ForCastDataLoading extends HomeControllerState{
  @override
  List<Object?> get props => [];

}

class ForCastDataLoaded extends HomeControllerState{
  final List<Daily> forecastList;

  const ForCastDataLoaded(this.forecastList);
  @override
  List<Object?> get props => [forecastList];

}

class ForCastDataLoadingError extends HomeControllerState{
  final String errorMessage;

  const ForCastDataLoadingError(this.errorMessage);

  @override
  List<Object?> get props => [];

}
