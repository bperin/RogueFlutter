import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Authenticated Group Code

class AuthenticatedGroup {
  static String baseUrl = 'https://develop.rogue.club/api/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [jwt]',
  };
  static GetMeCall getMeCall = GetMeCall();
}

class GetMeCall {
  Future<ApiCallResponse> call({
    String? jwt = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMe',
      apiUrl: '${AuthenticatedGroup.baseUrl}/users/me',
      callType: ApiCallType.GET,
      headers: {
        ...AuthenticatedGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

/// End Authenticated Group Code

/// Start Unauthenticated Group Code

class UnauthenticatedGroup {
  static String baseUrl = 'https://develop.rogue.club/api/v1';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static LoginCall loginCall = LoginCall();
  static ForgotPasswordCall forgotPasswordCall = ForgotPasswordCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${UnauthenticatedGroup.baseUrl}/users/login',
      callType: ApiCallType.POST,
      headers: {
        ...UnauthenticatedGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class ForgotPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'forgot password',
      apiUrl: '${UnauthenticatedGroup.baseUrl}/users/forgot_password',
      callType: ApiCallType.GET,
      headers: {
        ...UnauthenticatedGroup.headers,
      },
      params: {
        'email': email,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Unauthenticated Group Code

class ImageTestCall {
  static Future<ApiCallResponse> call({
    String? image = '',
  }) {
    final body = '''
{
  "inputs": [
    {
      "data": {
        "image": {
          "url": "${image}"
        }
      }
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'imageTest',
      apiUrl:
          'https://api.clarifai.com/v2/users/pf7zfb6j2nbk/apps/instagram/models/general-image-recognition/versions/aa7f35c01e0642fda5cf400f543e7c40/outputs',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Key API_KEY_HERE',
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic labels(dynamic response) => getJsonField(
        response,
        r'''$.outputs[:].data.concepts[:].name''',
        true,
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
