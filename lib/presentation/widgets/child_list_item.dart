import 'package:flutter/material.dart';

import '../../core/model/child_model.dart';

class ChildListItem extends StatelessWidget {
  final Child child;
  final VoidCallback onStatusChanged;

  const ChildListItem({
    super.key,
    required this.child,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 75,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[400],
            maxRadius: 30,
            child: const Image(
              height: 40,
              width: 40,
              image: AssetImage('assets/kidIcon.png'),
              fit: BoxFit.cover,
            ),
          ),
          trailing: Container(
            width: 130,
            height: 30,
            decoration: BoxDecoration(
              color: (child.status == 'Nice')
                  ? const Color(0xFF9048A2)
                  : const Color(0xFFD84D56),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Center(
              child: Text(
                child.status,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          title: Text(
            child.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            child.country,
            style: const TextStyle(
              color: Color(0xFF979797),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () => onStatusChanged(),
        ),
      ),
    );
  }
}