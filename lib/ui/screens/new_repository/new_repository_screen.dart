import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:git_repo_test_case/ui/base/base_screen.dart';
import 'package:git_repo_test_case/ext/ext.dart';
import 'package:git_repo_test_case/ui/components/input_text_field.dart';
import 'package:git_repo_test_case/ui/screens/new_repository/new_repository_store.dart';
import 'package:mobx/mobx.dart';

class NewRepositoryScreen extends BaseScreen {
  @override
  State<StatefulWidget> createState() => _NewRepositoryScreenState();
}

class _NewRepositoryScreenState extends BaseScreenState<NewRepositoryScreen> {
  TextEditingController _nameTextController;
  TextEditingController _descriptionTextController;

  NewRepositoryStore _newRepositoryStore;

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController().disposeWith(this);
    _descriptionTextController = TextEditingController().disposeWith(this);

    when((_) => _newRepositoryStore.isSaved, () {
      navigationStore.popRootNavigator();
    }).disposeWith(this);
  }

  @override
  void inject() {
    super.inject();
    _newRepositoryStore = context.inject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(str.addNewRepoTitle, style: theme.toolbarTextStyle),
        centerTitle: true,
        backgroundColor: theme.whiteColor,
        elevation: 1,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InputTextField(
              placeholder: str.repoDetailsNamePlaceholder,
              emptyPlaceholder: str.repoDetailsNameEmptyPlaceholder,
              controller: _nameTextController,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InputTextField(
              placeholder: str.repoDetailsDescriptionPlaceholder,
              emptyPlaceholder: str.repoDetailsDescriptionEmptyPlaceholder,
              controller: _descriptionTextController,
            ),
          ),
          SizedBox(height: 15),
          _saveBtn()
        ],
      ),
    );
  }

  Widget _saveBtn() => Observer(
        builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 40,
            child: FlatButton(
                color: theme.accentColor,
                child: !_newRepositoryStore.isLoading
                    ? Text(
                        str.repoDetailsBtnSave,
                        style: theme.buttonTextStyle,
                      )
                    : CupertinoActivityIndicator(radius: 12),
                onPressed: () {
                  !_newRepositoryStore.isLoading
                      ? _newRepositoryStore.saveRepository(
                          _nameTextController.text,
                          _descriptionTextController.text,
                        )
                      : { };
                  FocusScope.of(context).requestFocus(FocusNode());
                }),
          );
        },
      );
}
