import 'package:flutter/material.dart';

class CheckboxList<T> extends StatefulWidget {
  final Map<String, T> values;
  final void Function(List<T>) onChange;

  const CheckboxList({
    Key? key,
    required this.values,
    required this.onChange,
  }) : super(key: key);

  @override
  _CheckboxListState<T> createState() => _CheckboxListState<T>();
}

class _CheckboxListState<T> extends State<CheckboxList<T>> {
  List<T> checkedList = <T>[];

  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.values.entries
            .map<CheckboxListTile>(
              (MapEntry<String, T> entry) => CheckboxListTile(
                title: Text(entry.key),
                value: checkedList.contains(entry.value),
                onChanged: (bool? isChecked) async {
                  setState(() {
                    if (isChecked != null && isChecked) {
                      checkedList.add(entry.value);
                    } else {
                      checkedList.remove(entry.value);
                    }
                    widget.onChange(checkedList);
                  });
                },
              ),
            )
            .toList());
  }
}
