import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/model/child_model.dart';

part 'santas_list_event.dart';

part 'santas_list_state.dart';

class SantasListBloc extends Bloc<SantasListEvent, SantasListState> {
  List<Child> childrenList = [];

  SantasListBloc() : super(SantasListInitial()) {
    on<SantasListEvent>((event, emit) {
      if (event is SantasListInitialEvent) {
        /// initially load empty list
        emit(SantasListInitial());
      } else if (event is AddNewChildEvent) {
        /// add new child to list with default Nice status
        childrenList.add(event.child);
        emit(SantasListLoaded(childrenList: List.from(childrenList)));
      } else if (event is ChangeChildStatusEvent) {
        /// change child status from Nice to Naughty and vice versa
        childrenList[event.index].status =
            (childrenList[event.index].status == 'Nice') ? 'Naughty' : 'Nice';
        emit(SantasListLoaded(childrenList: List.from(childrenList)));
      }
    });
  }
}
