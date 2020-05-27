import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_repo_test_case/ui/components/theme.dart';

class InputTextField extends StatelessWidget {
  final String placeholder;
  final String emptyPlaceholder;
  final TextEditingController controller;
  final bool enabled;

  const InputTextField({
    this.placeholder,
    this.emptyPlaceholder,
    this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppTheme.of(context).listItemBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: Text(placeholder)),
              Visibility(
                visible: !enabled,
                child: Icon(
                  Icons.lock,
                  color: AppTheme.of(context).redColor,
                  size: 12,
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          CupertinoTextField(
            padding: EdgeInsets.zero,
            decoration: null,
            placeholder: emptyPlaceholder,
            controller: controller,
            placeholderStyle:
                AppTheme.of(context).inputPlaceholderTextStyle.copyWith(fontSize: 14),
            style: AppTheme.of(context).inputAllFieldTextStyle,
            expands: true,
            maxLines: null,
            minLines: null,
            enabled: enabled,
          )
        ],
      ),
    );
  }
}
