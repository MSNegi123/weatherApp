part of 'internate_connectivity_bloc.dart';

abstract class InternateConnectivityEvent extends Equatable {
  const InternateConnectivityEvent();
}
class ConnectedEvent extends InternateConnectivityEvent{
  @override
  List<Object?> get props => [];
}

class NotConnectedEvent extends InternateConnectivityEvent {
  @override
  List<Object?> get props => [];
}