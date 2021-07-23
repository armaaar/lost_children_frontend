import 'package:flutter/material.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';
import 'package:lost_children_frontend/widgets/atoms/Headline.dart';
import 'package:lost_children_frontend/widgets/atoms/StandardButton.dart';
import 'package:lost_children_frontend/widgets/molecules/CheckboxList.dart';

class CheckboxListForm<T> extends StatefulWidget {
  final Map<String, T> values;
  final String title;
  final String buttonText;
  final void Function(List<T>) onSubmit;

  const CheckboxListForm({
    Key? key,
    required this.values,
    required this.title,
    required this.buttonText,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _CheckboxListFormState<T> createState() => _CheckboxListFormState<T>();
}

class _CheckboxListFormState<T> extends State<CheckboxListForm<T>> {
  List<T> checkedList = <T>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Headline(text: widget.title),
        CheckboxList<T>(
          values: widget.values,
          onChange: (List<T> newList) {
            checkedList = newList;
          },
        ),
        const SizedBox(height: ThemeSettings.spaceSection),
        StandardButton(
          text: widget.buttonText,
          onPressed: () {
            widget.onSubmit(checkedList);
          },
        )
      ],
    );
  }
}
