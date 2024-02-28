part of 'get_daily_forecast_bloc.dart';

abstract class GetDailyForecastState extends Equatable {
  const GetDailyForecastState();
}

class GetDailyForecastInitial extends GetDailyForecastState {
  @override
  List<Object> get props => [];
}

class LoadingDailyForecast extends GetDailyForecastState{
  @override
  List<Object?> get props => [];

}

class DailyForecastLoaded extends GetDailyForecastState{
  final List<Daily> forecastList;

  const DailyForecastLoaded(this.forecastList);
  @override
  List<Object?> get props => [forecastList];




}
class DailyForcastLoadingError extends GetDailyForecastState{
  final String foreCastError;

  const DailyForcastLoadingError(this.foreCastError);

  @override
  List<Object?> get props => [foreCastError];

}
