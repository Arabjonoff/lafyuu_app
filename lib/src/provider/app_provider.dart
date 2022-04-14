import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lafyuu/src/model/http_result.dart';


class AppProvider {
  final String _baseUrl = "https://lafyuu.qtlms.uz/api/v1/";

  Future<HttpResult> _getResponse(String url) async {
    print(url);
    http.Response response = await http.get(
      Uri.parse(url),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: true,
        result: json.decode(
          utf8.decode(
            response.bodyBytes,
          ),
        ),
      );
    } else {
      return HttpResult(
        statusCode: response.statusCode,
        isSuccess: false,
        result: "error",
      );
    }
  }

  Future<HttpResult> getProductItem(int id) async {
    String url = _baseUrl + "product/$id";
    return await _getResponse(url);
  }

  Future<HttpResult> getSuperFlash() async {
    String url = _baseUrl + "superflash";
    return await _getResponse(url);
  }

  Future<HttpResult> getSuperFlashItem(int id) async {
    String url = _baseUrl + "superflash/$id";
    return await _getResponse(url);
  }

  Future<HttpResult> getCategory() async {
    String url = _baseUrl + "category";
    return await _getResponse(url);
  }

  Future<HttpResult> getProductList(
    String flashSale,
    String megaSale,
    String home,
  ) async {
    String url = _baseUrl +
        "product?mega_sale=$megaSale&flash_sale=$flashSale&home_sale=$home";
    return await _getResponse(url);
  }

  Future<HttpResult> getRecoProduct() async {
    String url = _baseUrl + "recomendedproduct";
    return await _getResponse(url);
  }
}
