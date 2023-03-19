import 'package:family_movie/ui/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_colors.dart';
import '../../../application/app/constants/image_constants.dart';
import '../../shared/custom_appbar.dart';
import '../../shared/menu_card.dart';
import 'profile_viewmodel.dart';

class ProfileView extends ViewModelBuilderWidget<ProfileViewModel> {
  const ProfileView({super.key});

  @override
  Widget builder(
      BuildContext context, ProfileViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: CustomAppBar.defaults(
        context: context,
        appBarTitle: 'Account',
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      ImageConstants.defaultAvatar,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Effendi Nugraha',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: CustomColors.neutral40,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '+62 85880768748',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: CustomColors.neutral40,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Membership'.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomColors.neutral40,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            MenuCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enjoy the biggest global and Indonesian hits',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: CustomColors.neutral10,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  CustomButton(
                    text: 'Subscribe now',
                    width: double.infinity,
                    trailingIcon: Icons.keyboard_arrow_right,
                    iconSize: 14,
                    buttonStyle: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.orange,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Text(
              'Account and security'.toUpperCase(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: CustomColors.neutral40,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            InkWell(
              onTap: () {},
              child: MenuCard(
                child: Text(
                  'Preferences',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColors.neutral40,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: MenuCard(
                child: Text(
                  'Log out',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColors.neutral40,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: MenuCard(
                child: Text(
                  'Log out All Devices',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CustomColors.neutral40,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => ProfileViewModel();
}
