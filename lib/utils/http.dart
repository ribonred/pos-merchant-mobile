import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../pages/pages.dart';
import '../services/services.dart';

Future<Request> accessTokenInterceptor(Request<dynamic> request) async {
  final DatabaseService db = Get.find();

  String? accessToken = db.getAccessToken();
  if (accessToken == null) return request;

  request.headers['Authorization'] = 'Bearer $accessToken';
  return request;
}

Future<Response> debugInterceptor(Request request, Response response) async {
  if (kDebugMode) {
    print('Sending ${request.method.capitalize} ${request.url}');
    print('- headers: ${request.headers}');
    print('- body: ${await request.bodyBytes.bytesToString()}');
    print('And received HTTP ${response.statusCode}');
    print('- headers: ${response.headers}');
    print('- body: ${response.bodyString}');
  }

  return response;
}

extension ResponseHandler on Response {
  void handleResponse({
    required void Function(dynamic result) onSuccess,
    String errorTitle = 'Error',
    String errorMessage = 'Something went wrong',
    bool handle401 = true,
  }) {
    final DatabaseService db = Get.find();
    final NotificationService notification = Get.find();

    if (body == null) {
      notification.showErrorSnackbar('No response');
      return;
    }

    if (hasError) {
      switch (statusCode) {
        case 401:
          if (!handle401) continue skip401;

          notification.showErrorSnackbar(
            'Please sign in again',
            title: 'Expired session',
          );

          db.clearSession().then((_) {
            return Get.offAllNamed(SignInPage.routeName);
          });

          break;
        case 403:
          notification.showErrorSnackbar(
            'You are not authorized to perform this action',
            title: 'Forbidden',
          );
          break;
        skip401:
        default:
          notification.showErrorSnackbar(errorMessage, title: errorTitle);
      }

      // return early for error
      return;
    }

    // on success
    onSuccess(body);
  }
}
