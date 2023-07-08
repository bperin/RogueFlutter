import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _env = await secureStorage.getString('ff_env') ?? _env;
    });
    await _safeInitAsync(() async {
      _idToken = await secureStorage.getString('ff_idToken') ?? _idToken;
    });
    await _safeInitAsync(() async {
      _jwtToken = await secureStorage.getString('ff_jwtToken') ?? _jwtToken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _showCommentField = false;
  bool get showCommentField => _showCommentField;
  set showCommentField(bool _value) {
    _showCommentField = _value;
  }

  List<DocumentReference> _emptyList = [];
  List<DocumentReference> get emptyList => _emptyList;
  set emptyList(List<DocumentReference> _value) {
    _emptyList = _value;
  }

  void addToEmptyList(DocumentReference _value) {
    _emptyList.add(_value);
  }

  void removeFromEmptyList(DocumentReference _value) {
    _emptyList.remove(_value);
  }

  void removeAtIndexFromEmptyList(int _index) {
    _emptyList.removeAt(_index);
  }

  void updateEmptyListAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _emptyList[_index] = updateFn(_emptyList[_index]);
  }

  String _uploadPhoto = '';
  String get uploadPhoto => _uploadPhoto;
  set uploadPhoto(String _value) {
    _uploadPhoto = _value;
  }

  String _calltoactiontext = '';
  String get calltoactiontext => _calltoactiontext;
  set calltoactiontext(String _value) {
    _calltoactiontext = _value;
  }

  String _calltoactionurl = '';
  String get calltoactionurl => _calltoactionurl;
  set calltoactionurl(String _value) {
    _calltoactionurl = _value;
  }

  bool _calltoactionenabled = false;
  bool get calltoactionenabled => _calltoactionenabled;
  set calltoactionenabled(bool _value) {
    _calltoactionenabled = _value;
  }

  String _location = '';
  String get location => _location;
  set location(String _value) {
    _location = _value;
  }

  String _signupEmail = '';
  String get signupEmail => _signupEmail;
  set signupEmail(String _value) {
    _signupEmail = _value;
  }

  String _signupName = '';
  String get signupName => _signupName;
  set signupName(String _value) {
    _signupName = _value;
  }

  String _signupPassword = '';
  String get signupPassword => _signupPassword;
  set signupPassword(String _value) {
    _signupPassword = _value;
  }

  DateTime? _signupBirthday = DateTime.fromMillisecondsSinceEpoch(946746000000);
  DateTime? get signupBirthday => _signupBirthday;
  set signupBirthday(DateTime? _value) {
    _signupBirthday = _value;
  }

  String _signupUsername = '';
  String get signupUsername => _signupUsername;
  set signupUsername(String _value) {
    _signupUsername = _value;
  }

  List<DocumentReference> _taggedUsers = [];
  List<DocumentReference> get taggedUsers => _taggedUsers;
  set taggedUsers(List<DocumentReference> _value) {
    _taggedUsers = _value;
  }

  void addToTaggedUsers(DocumentReference _value) {
    _taggedUsers.add(_value);
  }

  void removeFromTaggedUsers(DocumentReference _value) {
    _taggedUsers.remove(_value);
  }

  void removeAtIndexFromTaggedUsers(int _index) {
    _taggedUsers.removeAt(_index);
  }

  void updateTaggedUsersAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _taggedUsers[_index] = updateFn(_taggedUsers[_index]);
  }

  bool _showRecentSearch = true;
  bool get showRecentSearch => _showRecentSearch;
  set showRecentSearch(bool _value) {
    _showRecentSearch = _value;
  }

  String _imageLabels = '';
  String get imageLabels => _imageLabels;
  set imageLabels(String _value) {
    _imageLabels = _value;
  }

  String _currentSearch = '';
  String get currentSearch => _currentSearch;
  set currentSearch(String _value) {
    _currentSearch = _value;
  }

  bool _imageSearchDummyToggle = false;
  bool get imageSearchDummyToggle => _imageSearchDummyToggle;
  set imageSearchDummyToggle(bool _value) {
    _imageSearchDummyToggle = _value;
  }

  String _tempProfilePic = '';
  String get tempProfilePic => _tempProfilePic;
  set tempProfilePic(String _value) {
    _tempProfilePic = _value;
  }

  List<DocumentReference> _tempUserList = [];
  List<DocumentReference> get tempUserList => _tempUserList;
  set tempUserList(List<DocumentReference> _value) {
    _tempUserList = _value;
  }

  void addToTempUserList(DocumentReference _value) {
    _tempUserList.add(_value);
  }

  void removeFromTempUserList(DocumentReference _value) {
    _tempUserList.remove(_value);
  }

  void removeAtIndexFromTempUserList(int _index) {
    _tempUserList.removeAt(_index);
  }

  void updateTempUserListAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _tempUserList[_index] = updateFn(_tempUserList[_index]);
  }

  DocumentReference? _tempUserRecord;
  DocumentReference? get tempUserRecord => _tempUserRecord;
  set tempUserRecord(DocumentReference? _value) {
    _tempUserRecord = _value;
  }

  String _env = 'develop';
  String get env => _env;
  set env(String _value) {
    _env = _value;
    secureStorage.setString('ff_env', _value);
  }

  void deleteEnv() {
    secureStorage.delete(key: 'ff_env');
  }

  String _idToken = '';
  String get idToken => _idToken;
  set idToken(String _value) {
    _idToken = _value;
    secureStorage.setString('ff_idToken', _value);
  }

  void deleteIdToken() {
    secureStorage.delete(key: 'ff_idToken');
  }

  String _jwtToken =
      'eyJhbGciOiJSUzI1NiJ9.eyJhdWQiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGVhcGlzLmNvbS9nb29nbGUuaWRlbnRpdHkuaWRlbnRpdHl0b29sa2l0LnYxLklkZW50aXR5VG9vbGtpdCIsImV4cCI6MTY4MjEwMTM0MSwiaWF0IjoxNjgyMDk3NzQxLCJpc3MiOiJmaXJlYmFzZS1hZG1pbnNkay10am44MUByb2d1ZS1kZXZlbG9wLmlhbS5nc2VydmljZWFjY291bnQuY29tIiwic3ViIjoiZmlyZWJhc2UtYWRtaW5zZGstdGpuODFAcm9ndWUtZGV2ZWxvcC5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsInVpZCI6ImQ3NzA4ZDI2LTJkNmYtNGM4ZS1iYjc2LWIzYzdkNTMxNDY1MyJ9.B1r-V3pxGgIqumdPTzGghIYPal5dI6z5Z77AENw_0JMr7Mbth6aV0HwMzGgTbOel-xwobJSOcgki0ktkD8tgX5qKBsWEwwge33jZC7h_awWlo96bJeFLDOQUo2i7ds8p8wDuCsG-9WdqFqXpfaMjdtwXW0GlrSprBOd1abkFbPZqYrNA2askNjc9ZDX-BWjv87EMK9zND1dONrsmWKQ276oZisQO-H0ibhj-LxlwlhCNSAhYzKt4sUBW1pcSRyFAFQ8GJi0Ws4dJWLONm7iHqFV9NrRlmd8KpcxbYo6seLratiaAIT6L7WmRKPY3uDaJSLBGrxVDJu9O6JnYL2Xx4Q';
  String get jwtToken => _jwtToken;
  set jwtToken(String _value) {
    _jwtToken = _value;
    secureStorage.setString('ff_jwtToken', _value);
  }

  void deleteJwtToken() {
    secureStorage.delete(key: 'ff_jwtToken');
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
