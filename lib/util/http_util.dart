import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop/config/index.dart';
import 'package:shop/util/server.dart';
import 'package:shop/util/storage.dart';

class HttpUtil {
  static HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() => _instance;

  Dio dio;
  CancelToken cancelToken = new CancelToken();

  HttpUtil._internal() {
    BaseOptions options = new BaseOptions(
      baseUrl: SERVER_API_URL,
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: {},
      contentType: "application/json; charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = new Dio(options);

    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError dioError) {
      return dioError;
    }));
  }

  /*
   * error统一处理
   */
  // 错误信息
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return ErrorEntity(code: -1, message: "请求取消");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "连接超时");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "请求超时");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "响应超时");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          try {
            int errCode = error.response.statusCode;
            // String errMsg = error.response.statusMessage;
            // return ErrorEntity(code: errCode, message: errMsg);
            switch (errCode) {
              case 400:
                {
                  return ErrorEntity(code: errCode, message: "请求语法错误");
                }
                break;
              case 401:
                {
                  return ErrorEntity(code: errCode, message: "没有权限");
                }
                break;
              case 403:
                {
                  return ErrorEntity(code: errCode, message: "服务器拒绝执行");
                }
                break;
              case 404:
                {
                  return ErrorEntity(code: errCode, message: "无法连接服务器");
                }
                break;
              case 405:
                {
                  return ErrorEntity(code: errCode, message: "请求方法被禁止");
                }
                break;
              case 500:
                {
                  return ErrorEntity(code: errCode, message: "服务器内部错误");
                }
                break;
              case 502:
                {
                  return ErrorEntity(code: errCode, message: "无效的请求");
                }
                break;
              case 503:
                {
                  return ErrorEntity(code: errCode, message: "服务器挂了");
                }
                break;
              case 505:
                {
                  return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
                }
                break;
              default:
                {
                  // return ErrorEntity(code: errCode, message: "未知错误");
                  return ErrorEntity(
                      code: errCode, message: error.response.statusMessage);
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
        break;
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }

  Future get(
    String path, {
    dynamic params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? getLocalOptions();
      var response = await dio.get(path,
          queryParameters: params,
          options: requestOptions,
          cancelToken: cancelToken);
      return response.data;
    } catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful post 操作
  Future post(
    String path, {
    dynamic params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? getLocalOptions();
      var response = await dio.post(path,
          data: params, options: requestOptions, cancelToken: cancelToken);
      return response.data;
    } catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful put 操作
  Future put(
    String path, {
    dynamic params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? getLocalOptions();
      var response = await dio.post(path,
          data: params, options: requestOptions, cancelToken: cancelToken);
      return response.data;
    } catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful patch 操作
  Future patch(
    String path, {
    @required BuildContext context,
    dynamic params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? getLocalOptions();
      var response = await dio.post(path,
          data: params, options: requestOptions, cancelToken: cancelToken);
      return response.data;
    } catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful delete 操作
  Future delete(
    String path, {
    @required BuildContext context,
    dynamic params,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      Options requestOptions = options ?? getLocalOptions();
      var response = await dio.post(path,
          data: params, options: requestOptions, cancelToken: cancelToken);
      return response.data;
    } catch (e) {
      throw createErrorEntity(e);
    }
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    @required BuildContext context,
    dynamic params,
    Options options,
  }) async {
    Options requestOptions = options ?? Options();
    try {
      var response = await dio.post(
        path,
        data: FormData.fromMap(params),
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      throw createErrorEntity(e);
    }
  }
}

void cancelToken(CancelToken cancelToken) {
  cancelToken.cancel("cancelled");
}

Options getLocalOptions() {
  Options options;
  String token = StorageUtil().getItem(STORAGE_USER_TOKEN_KEY);
  if (token != null) {
    options = Options(headers: {
      "Authorization": "Bearer $token",
    });
  }
  return options;
}

class ErrorEntity implements Exception {
  int code;
  String message;

  ErrorEntity({this.code, this.message});

  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}
