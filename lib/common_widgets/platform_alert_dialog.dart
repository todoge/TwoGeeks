import 'package:twoGeeks/common_widgets/platform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PlatformAlertDialog extends PlatformWidget{
  final String title;
  final String content;
  final String defaultActionText;
  PlatformAlertDialog({@required this.title,@required this.content,@required this.defaultActionText})
  :assert(title != null),
  assert(content != null),
  assert(defaultActionText != null);

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context){
    return [
      PlatformAlertDialogAction(
        child: Text(defaultActionText),
        onPressed: () => Navigator.of(context).pop(),
      )
    ];
  }
}

class PlatformAlertDialogAction extends PlatformWidget{

  final Widget child;
  final VoidCallback onPressed;
  PlatformAlertDialogAction({this.child, this.onPressed});

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onPressed,
    );
  }
}