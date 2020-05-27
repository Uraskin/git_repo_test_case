import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:git_repo_test_case/data/api/a_http_client.dart';
import 'package:git_repo_test_case/data/models/error_models.dart';
import 'package:git_repo_test_case/data/models/repo_models.dart';
import 'package:git_repo_test_case/domain/github_repo_store.dart';
import 'package:git_repo_test_case/ui/base/base_screen.dart';
import 'package:git_repo_test_case/ui/components/debouncer.dart';
import 'package:git_repo_test_case/ext/ext.dart';
import 'package:git_repo_test_case/ui/components/images.dart';
import 'package:git_repo_test_case/ui/components/owner_avatar.dart';
import 'package:git_repo_test_case/ui/components/tappable.dart';
import 'package:git_repo_test_case/ui/screens/repository_details/repository_details_store.dart';
import 'package:git_repo_test_case/utils/toast.dart';
import 'package:mobx/mobx.dart';

class MainScreen extends BaseScreen {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends BaseScreenState<MainScreen> {
  TextEditingController _searchController;
  Debouncer _debouncer;
  GithubRepoStore _githubRepoStore;

  @override
  void initState() {
    super.initState();

    _searchController = TextEditingController().disposeWith(this);

    _debouncer = Debouncer().disposeWith(this);
    _searchController.addListener(() {
      _debouncer.run(() {
        _githubRepoStore.searchRepositories(_searchController.text);
      });
    });

    reaction((_) => _githubRepoStore.error, (error) {
      if (error is ApiError || error is ServerError) {
        showErrorToast(context, str.errorServer);
      } else if (error is NetworkError) {
        showErrorToast(context, str.errorConnection);
      } else if (error is Exception) {
        showErrorToast(context, str.errorUnexpected);
      }
    });
  }

  @override
  void inject() {
    super.inject();
    _githubRepoStore = context.inject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.whiteColor,
      appBar: AppBar(
        backgroundColor: theme.whiteColor,
        centerTitle: true,
        title: Column(
          children: <Widget>[
            Image.asset(Images.gitLogo),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Text(str.appName),
          SizedBox(height: 15),
          _searchField(),
          SizedBox(height: 15),
          Divider(height: 1, color: theme.borderDividerColor),
          Expanded(child: _repoList())
        ],
      ),
      floatingActionButton: Observer(
        builder: (context) => Visibility(
          visible: _githubRepoStore.noSearch,
          child: FloatingActionButton(
            backgroundColor: theme.accentColor,
            child: Icon(Icons.add),
            onPressed: () => navigationStore.navigateNewRepo(),
          ),
        ),
      ),
    );
  }

  Widget _searchField() => Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        height: 35,
        padding: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(
            color: theme.borderDividerColor,
            width: 0.5,
          ),
        ),
        child: CupertinoTextField(
          decoration: null,
          autofocus: false,
          clearButtonMode: OverlayVisibilityMode.editing,
          placeholder: str.searchRepoPlaceholder,
          controller: _searchController,
          placeholderStyle:
              theme.inputPlaceholderTextStyle.copyWith(fontSize: 14),
          style: theme.inputAllFieldTextStyle,
          prefix: Icon(
            Icons.search,
            size: 24,
            color: theme.inputPlaceholderTextColor,
          ),
        ),
      );

  Widget _repoList() {
    return Observer(
      builder: (context) {
        if (_githubRepoStore.repositories.isNullOrEmpty &&
            !_githubRepoStore.isLoading) {
          return Center(
            child: Text(str.emptyRepository),
          );
        } else if (_githubRepoStore.isLoading) {
          return CupertinoActivityIndicator();
        }
        return ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              _repoItem(_githubRepoStore.repositories[index]),
          separatorBuilder: (_, __) => SizedBox(height: 10),
          itemCount: _githubRepoStore.repositories.length,
        );
      },
    );
  }

  Widget _repoItem(GithubRepo item) => Tappable(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: theme.listItemBackground,
          ),
          child: Row(
            children: <Widget>[
              OwnerAvatar(size: 40, url: item?.owner?.avatarUrl),
              SizedBox(width: 15),
              Expanded(
                child: Text(item.name, style: theme.primaryTextStyle),
              ),
            ],
          ),
        ),
        onTap: () => navigationStore
            .navigateRepositoryDetails(RepositoryDetailsArguments(item)),
      );
}
