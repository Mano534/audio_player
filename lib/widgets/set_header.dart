import 'package:flutter/material.dart';

class SetHeader extends StatelessWidget {
  const SetHeader({super.key, this.action = 'View more',required this.title});
  final String action;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),),
        Text(action, style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}