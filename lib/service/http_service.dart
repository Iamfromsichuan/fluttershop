import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/index.dart';


Future requst(url, { formData }) async{
  try{
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencode");
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception("请求异常");
  } catch(e) {
    return print('error:::${e}');
  }
}