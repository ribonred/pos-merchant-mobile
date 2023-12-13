import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'home.dart';

class MerchantProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      print(map);
      return QrCode.fromJson(map);
    };
    httpClient.baseUrl = '${dotenv.env['POS_API_URL']}/api/v1/merchant/';
  }

  Future<Response<QrCode?>> getQrMenu(String bearerAuth) async {
    return await get('qrcode/', headers: {
      'Authorization': 'Bearer $bearerAuth',
    });
  }
}
