import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class MerchantProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = '${dotenv.env['POS_API_URL']}/api/v1/merchant';
    httpClient.addRequestModifier(accessTokenInterceptor);
    // httpClient.addResponseModifier(debugInterceptor);
    httpClient.defaultDecoder = (map) => QrCode.fromJson(map);
  }

  Future<Response<QrCode?>> getQrMenu() async => await get('/qrcode/');
}
