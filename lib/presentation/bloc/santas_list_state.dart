part of 'santas_list_bloc.dart';

abstract class SantasListState {}

class SantasListInitial extends SantasListState {}

class SantasListLoading extends SantasListState {}

class SantasListLoaded extends SantasListState {
  final List<Child> childrenList;

  SantasListLoaded({required this.childrenList});
}
