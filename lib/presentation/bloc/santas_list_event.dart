part of 'santas_list_bloc.dart';

abstract class SantasListEvent {}

class SantasListInitialEvent extends SantasListEvent {}

class AddNewChildEvent extends SantasListEvent {
  final Child child;

  AddNewChildEvent({required this.child});
}

class ChangeChildStatusEvent extends SantasListEvent {
  final int index;

  ChangeChildStatusEvent({required this.index});
}
