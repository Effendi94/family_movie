import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../application/app/constants/custom_colors.dart';

class CustomAppBar extends AppBar {
  CustomAppBar.plain({
    Key? key,
    required BuildContext context,
    bool isLoading = false,
  }) : super(
          key: key,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        );

  CustomAppBar.defaults({
    Key? key,
    required BuildContext context,
    required String appBarTitle,
    bool automaticallyImplyLeading = false,
    bool centerTitle = false,
  }) : super(
          key: key,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: Text(
            appBarTitle,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: CustomColors.white,
                  fontSize: 14,
                ),
          ),
          centerTitle: centerTitle,
        );

  CustomAppBar.search({
    Key? key,
    required BuildContext context,
    required String appBarTitle,
    required SearchDelegate searchDelegate,
    bool isLoading = false,
  }) : super(
          key: key,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent, // Android
            statusBarIconBrightness: Brightness.light, // Android
            statusBarBrightness: Brightness.light, // iOS
          ),
          backgroundColor: CustomColors.dark,
          iconTheme: const IconThemeData(
            size: 20,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(
            appBarTitle,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  color: CustomColors.white,
                  fontSize: 14,
                ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: searchDelegate,
                );
              },
              icon: const Icon(
                Icons.search,
              ),
            )
          ],
        );
}
