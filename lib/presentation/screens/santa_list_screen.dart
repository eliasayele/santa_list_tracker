import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/santas_list_bloc.dart';
import '../widgets/add_child_dialog.dart';
import '../widgets/child_list_item.dart';

class SantasListScreen extends StatefulWidget {
  const SantasListScreen({super.key});

  @override
  SantasListScreenState createState() => SantasListScreenState();
}

class SantasListScreenState extends State<SantasListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text('Santa\'s List Tracker'),
        elevation: 0,
      ),
      body: BlocBuilder<SantasListBloc, SantasListState>(
        builder: (context, state) {
          if (state is SantasListLoaded) {
            return Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.childrenList.length,
                    itemBuilder: (context, index) {
                      return ChildListItem(
                        child: state.childrenList[index],
                        onStatusChanged: () =>
                            _changeChildStatus(context, index),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => _addNewChild(context),
        label: const Text('Add New Kid'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _addNewChild(BuildContext context) {
    // since the app is small, I don't want to use service locator
    final blocCtx = context;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddChildDialog(onAddChild: (child) {
          BlocProvider.of<SantasListBloc>(blocCtx)
              .add(AddNewChildEvent(child: child));
        });
      },
    );
  }

  void _changeChildStatus(BuildContext context, int index) {
    // since the app is small, I don't want to use service locator
    final blocCtx = context;

    BlocProvider.of<SantasListBloc>(blocCtx).add(
      ChangeChildStatusEvent(index: index),
    );
  }
}
