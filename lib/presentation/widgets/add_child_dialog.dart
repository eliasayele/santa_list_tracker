import 'package:flutter/material.dart';

import '../../core/model/child_model.dart';

class AddChildDialog extends StatelessWidget {
  final ValueChanged<Child> onAddChild;

  const AddChildDialog({super.key, required this.onAddChild});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController countryController = TextEditingController();

    return AlertDialog(
      title: const Text('Add New Kid'),
      content: SizedBox(
        height: 250,
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: countryController,
              decoration: const InputDecoration(labelText: 'Country'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final child = Child(
              name: nameController.text,
              country: countryController.text,
              status: "Nice",
            );
            onAddChild(child);
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
