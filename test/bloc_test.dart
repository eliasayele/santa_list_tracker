import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:santas_list_tracker/core/model/child_model.dart';
import 'package:santas_list_tracker/presentation/bloc/santas_list_bloc.dart';

void main() {
  group('SantasListBloc', () {
    blocTest<SantasListBloc, SantasListState>(
      'emits [SantasListInitial] when SantasListInitialEvent is added',
      build: () => SantasListBloc(),
      act: (bloc) => bloc.add(SantasListInitialEvent()),
      expect: () => [isA<SantasListInitial>()],
    );

    blocTest<SantasListBloc, SantasListState>(
      'emits [SantasListLoaded] when AddNewChildEvent is added',
      build: () => SantasListBloc(),
      act: (bloc) {
        bloc.add(AddNewChildEvent(
            child: Child(
                name: 'Mykhailo Mudryk', country: 'Ukraine', status: 'Nice')));
      },
      expect: () => [isA<SantasListLoaded>()],
    );

    blocTest<SantasListBloc, SantasListState>(
      'emits [SantasListLoaded, SantasListLoaded] when ChangeChildStatusEvent is added',
      build: () => SantasListBloc(),
      act: (bloc) async {
        bloc.add(AddNewChildEvent(
            child: Child(
                name: 'Mykhailo Mudryk', country: 'Ukraine', status: 'Nice')));
        await Future.delayed(const Duration(milliseconds: 300));
        bloc.add(ChangeChildStatusEvent(index: 0));
      },
      wait: const Duration(milliseconds: 300),
      expect: () => [
        isA<SantasListLoaded>(),
        isA<SantasListLoaded>(),
      ],
    );
  });
}
