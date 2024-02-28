part of 'home_controller_bloc.dart';

abstract class HomeControllerEvent extends Equatable {
  const HomeControllerEvent();
}
class GetInitialEvent extends HomeControllerEvent{
  @override
  List<Object?> get props => [];

}

class GetCurrentCityWeatherInfo extends HomeControllerEvent{
  final String currentCityName;

  const GetCurrentCityWeatherInfo(this.currentCityName);

  @override
  List<Object?> get props => [currentCityName];
}


class GetHomeDailyForCast extends HomeControllerEvent{
  @override
  List<Object?> get props => [];

}