import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:git_repo_test_case/ui/base/base_screen.dart';
import 'package:git_repo_test_case/ui/components/input_text_field.dart';
import 'package:git_repo_test_case/ui/components/owner_avatar.dart';
import 'package:git_repo_test_case/ui/components/tappable.dart';
import 'package:git_repo_test_case/ui/screens/repository_details/repository_details_store.dart';
import 'package:git_repo_test_case/ext/ext.dart';
import 'package:mobx/mobx.dart';

class RepositoryDetailsScreen extends BaseScreen {
  @override
  State<StatefulWidget> createState() => _RepositoryDetailsScreenState();
}

class _RepositoryDetailsScreenState
    extends BaseScreenState<RepositoryDetailsScreen> {
  RepositoryDetailsStore _detailsStore;

  TextEditingController _nameTextController;
  TextEditingController _descriptionTextController;

  @override
  void inject() {
    super.inject();
    _detailsStore = context.inject();
  }

  @override
  void initState() {
    super.initState();
    _nameTextController = TextEditingController().disposeWith(this);
    _descriptionTextController = TextEditingController().disposeWith(this);

    _nameTextController.text = _detailsStore.args.repo.name ?? '';
    _descriptionTextController.text = _detailsStore.args.repo.description ?? '';

    when((_) => _detailsStore.isSaved, () {
      navigationStore.popRootNavigator();
    }).disposeWith(this);
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text(
              str.repoDetailsTitle,
              style: theme.toolbarTextStyle,
            ),
            Text(
              _detailsStore.isLocalRepo
                  ? str.repoLocalType
                  : str.repoRemoteType,
              style: theme.secondaryTextStyle,
            )
          ],
        ),
        leading: Tappable(
          child: Icon(
            Icons.arrow_back,
            color: theme.primaryTextColor,
          ),
          onTap: () => navigationStore.popRootNavigator(),
        ),
        centerTitle: true,
        backgroundColor: theme.whiteColor,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  OwnerAvatar(
                    size: 100,
                    url: _detailsStore.args.repo?.owner?.avatarUrl,
                  ),
                  SizedBox(width: 15),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _detailsStore.args.repo?.owner?.login ?? '',
                        style: theme.primaryTextStyle,
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Icon(Icons.star, size: 20, color: theme.accentColor),
                          SizedBox(width: 10),
                          Text(
                            _detailsStore.args.repo.score?.toString() ?? 'n/a',
                            style: theme.secondaryTextStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Icon(CupertinoIcons.eye_solid,
                              size: 20, color: theme.accentColor),
                          SizedBox(width: 10),
                          Text(
                            _detailsStore.args.repo.watcherCount?.toString() ??
                                'n/a',
                            style: theme.secondaryTextStyle,
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          Icon(Icons.share, size: 20, color: theme.accentColor),
                          SizedBox(width: 10),
                          Text(
                            _detailsStore.args.repo.forksCount?.toString() ??
                                'n/a',
                            style: theme.secondaryTextStyle,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(height: 1, color: theme.borderDividerColor),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InputTextField(
                    placeholder: str.repoDetailsNamePlaceholder,
                    emptyPlaceholder: str.repoDetailsNameEmptyPlaceholder,
                    controller: _nameTextController,
                    enabled: _detailsStore.args.repo.local ?? false),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: InputTextField(
                    placeholder: str.repoDetailsDescriptionPlaceholder,
                    emptyPlaceholder:
                        str.repoDetailsDescriptionEmptyPlaceholder,
                    controller: _descriptionTextController,
                    enabled: _detailsStore.args.repo.local ?? false),
              ),
              SizedBox(height: 15),
              _saveBtn(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _saveBtn() => Observer(
        builder: (context) {
          if (_detailsStore.isLocalRepo) {
            return SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 40,
              child: FlatButton(
                  color: theme.accentColor,
                  child: !_detailsStore.isLoading
                      ? Text(
                          str.repoDetailsBtnSave,
                          style: theme.buttonTextStyle,
                        )
                      : CupertinoActivityIndicator(radius: 12),
                  onPressed: () {
                    !_detailsStore.isLoading
                        ? _detailsStore.saveRepository(
                            _nameTextController.text,
                            _descriptionTextController.text,
                          )
                        : null;
                    FocusScope.of(context).requestFocus(FocusNode());
                  }),
            );
          } else {
            return Container();
          }
        },
      );
}
