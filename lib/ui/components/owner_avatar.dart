import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:git_repo_test_case/ext/ext.dart';
import 'package:git_repo_test_case/ui/components/theme.dart';

class OwnerAvatar extends StatelessWidget {
  final String url;
  final double size;

  const OwnerAvatar({
    @required this.size,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: !url.isNullOrEmpty
          ? CachedNetworkImage(
              width: size,
              height: size,
              imageUrl: url,
              fit: BoxFit.contain,
              placeholder: (context, url) => SizedBox(
                width: 24,
                height: 24,
                child: CupertinoActivityIndicator(),
              ),
            )
          : Container(
              color: AppTheme.of(context).avatarPlaceholderColor,
              child: Icon(
                Icons.supervised_user_circle,
                color: AppTheme.of(context).whiteColor,
                size: size/1.5,
              ),
            ),
    );
  }
}
