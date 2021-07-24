import 'package:flutter/material.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';
import 'package:lost_children_frontend/utils/requests/requestLostImages.dart';
import 'package:lost_children_frontend/widgets/atoms/Headline.dart';
import 'package:lost_children_frontend/widgets/molecules/ImagesGrid.dart';
import 'package:lost_children_frontend/widgets/templates/StandardTemplate.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

class LostListPage extends StatelessWidget {
  static const String route = '/';
  final String title;

  const LostListPage({
    Key? key,
    this.title = 'Lost Children',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    requestLostImages(context);
    return ReduxSelector<AppState, dynamic>(
      selector: (_, AppState state) => <dynamic>[state.faceImages],
      builder: (BuildContext context, _, AppState state, __, ___, ____) =>
          StandardTemplate(
        title: title,
        body: Column(
          children: <Widget>[
            const Headline(text: 'Lost Kids'),
            state.faceImages.isEmpty
                ? const Text('No Images')
                : ImagesGrid(images: state.faceImages),
          ],
        ),
      ),
    );
  }
}
