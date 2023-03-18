import 'dart:developer' as developer;
import 'dart:developer';

import 'package:dio/dio.dart';
// import 'package:stacked_services/stacked_services.dart';

// import '../../application/app/app.locator.dart';
// import '../../application/app/app.router.dart';
// import '../../application/app/constants/common.dart';
// import '../../application/app/constants/image_constants.dart';
// import '../ui/views/shared/custom_loader.dart';

class ApiInterceptor extends InterceptorsWrapper {
  // final _bottomSheetService = locator<BottomSheetService>();
  // final _navigationService = locator<NavigationService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('============================================================\n');
    log('==============================================onRequest=====\n');
    developer.log(options.baseUrl, name: 'baseUrl');
    developer.log(options.path, name: 'path');
    developer.log(options.headers.toString(), name: 'headers');
    developer.log(options.queryParameters.toString(), name: 'queryParameters');
    developer.log(options.data.toString(), name: 'data');
    log('============================================================\n');

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    developer.log(err.toString(), name: err.requestOptions.path);

    // if (err.response!.statusCode == Common.sessionExpiredStatusCode) {
    //   showSessionExpiredBottomSheet();
    // } else if (err.response!.statusCode == Common.badGatewayStatusCode) {
    //   showServiceUnavailableBottomSheet();
    //   return;
    // } else if (err.response!.statusCode == Common.invalidCredentialStatusCode) {
    //   showInvalidCredentialBottomSheet();
    //   return;
    // } else if (err.response!.statusCode == Common.serviceUnavailable) {
    //   showServiceUnavailableBottomSheet();
    //   return;
    // }

    super.onError(err, handler);
  }

  // Future showServiceUnavailableBottomSheet() async {
  //   CustomLoader.hideLoader();

  //   await _bottomSheetService.showCustomSheet(
  //     variant: BottomSheetType.generalError,
  //   );
  // }

  // Future showInvalidCredentialBottomSheet() async {
  //   CustomLoader.hideLoader();
  //   await _bottomSheetService.showCustomSheet(
  //     variant: BottomSheetType.base,
  //     imageUrl: ImageConstants.generalError,
  //     title: 'Sesi Anda sudah habis',
  //     description:
  //         'Anda akan kembali ke Beranda. Harap ulangi buka tabungan untuk mendapatkan akses kembali ya!',
  //     barrierDismissible: false,
  //     data: {
  //       'showCornerClearButton': false,
  //     },
  //     mainButtonTitle: 'Oke',
  //   );

  //   if (_userService.isFromRayaApps) {
  //     onCloseWebview();
  //   } else {
  //     _navigationService.clearStackAndShow(Routes.landingView);
  //   }
  // }

  Future showSessionExpiredBottomSheet() async {
    // await _bottomSheetService.showCustomSheet(
    //   variant: BottomSheetType.base,
    //   imageUrl: ImageConstants.unauthorized,
    //   title: 'Sesi kamu habis',
    //   description:
    //       'Akun dikeluarkan secara otomatis karena tidak ada aktivitas. Login lagi untuk masuk ke akunmu ya!',
    //   mainButtonTitle: 'Oke',
    //   data: {
    //     'showCornerClearButton': true,
    //   },
    // );

    // SharedPrefHelper.removeKeys();
    // LocatorHelper.unregThenRegViewModels();

    // _navigationService.clearStackAndShow(Routes.welcomeBackView);
  }

  Future showSystemMaintenanceBottomSheet() async {
    // await _bottomSheetService.showCustomSheet(
    //   variant: BottomSheetType.base,
    //   imageUrl: ImageConstants.systemMaintenance,
    //   title: 'Lagi pemeliharaan sistem Raya',
    //   description:
    //       'Demi kenyamanan kamu menggunakan aplikasi Raya, saat ini tim kami sedang melakukan pemeliharaan sistem. Kembali lagi nanti, ya!',
    //   data: {
    //     'showCornerClearButton': true,
    //   },
    //   mainButtonTitle: 'Oke',
    // );
  }
}
