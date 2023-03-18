import 'package:family_movie/application/app/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/image_constants.dart';
import '../../../../application/enums/category_type.dart';
import '../../../shared/listtile_widget.dart';
import '../home_viewmodel.dart';

class HomeDrawer extends HookViewModelWidget<HomeViewModel> {
  const HomeDrawer({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, HomeViewModel viewModel) {
    return Drawer(
      backgroundColor: CustomColors.dark,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.bgDrawer),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    ImageConstants.avatar,
                  ),
                  onBackgroundImageError: (exception, stackTrace) =>
                      Container(),
                ),
                Text(
                  'Family Movie',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                )
              ],
            ),
          ),
          ListTileWidget(
            label: 'Downloads',
            icon: Icons.cloud_download_rounded,
            onPressed: () {},
          ),
          ListTileWidget(
            label: 'Watchlist',
            icon: Icons.playlist_add_rounded,
            onPressed: () {},
          ),
          Divider(
            thickness: 2,
            indent: 15,
            endIndent: 15,
            color: CustomColors.neutral10.withOpacity(0.1),
          ),
          ListTileWidget(
            label: 'Help',
            icon: Icons.help_outline,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
