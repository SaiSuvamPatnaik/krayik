import 'package:doors_tour_app/services/server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart' as diolib;

enum LoginStatus { loading, idle, loggedIn, error }

class AuthService with ChangeNotifier {
  String _error = "";
  LoginStatus _status = LoginStatus.loading;
  String _token = '';

  String get token => 'Bearer $_token';

  String get error => _error;

  LoginStatus get status => _status;

  AuthService() {
    initialise();
  }

  /// resets the auth service values
  void clear() {
    _error = "";
    _status = LoginStatus.idle;
    _token = "";
    notifyListeners();
  }

  /// An async function which takes input **username** and **password**
  /// and returns a bool value, as success or failure
  Future<bool> login({required String email, required String password}) async {
    _status = LoginStatus.loading;
    notifyListeners();
    final diolib.Response response = await dio
        .post(
      "/users/login",
      data: {
        'email': email,
        'password': password,
      },
      options: diolib.Options(headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }),
    )
        .catchError((e) {
      final diolib.DioError error = e as diolib.DioError;
      _status = LoginStatus.error;
      _error = "${error.message}";
      notifyListeners();
      print(error.response?.data);

      if (error.response?.data?["data"][0]["messages"][0]["id"] ==
          "Auth.form.error.invalid") {
        throw "Sorry, could not log you in, the email id or password is incorrect.";
      } else if (error.response?.data?["data"][0]["messages"][0]["id"] ==
          "Auth.form.error.confirmed") {
        throw "Sorry, could not log you in, the email id is not verified yet. Please check your inbox and verify your email id.";
      } else {
        throw "Sorry, could not log you in at the moment, please try again later.";
      }
    });

    if (response.statusCode == 200) {
      print('logged in');
      Map map = response.data! as Map;
      String newJwtToken = "${map['jwt']}";
      // me = Me.fromMap(map['user'] as Map);
      // if (me.isEmailVerified == false) {
      //   throw "Sorry, could not log you in, kindly verify your email first.";
      // }
      //login success

      //save jwt token
      await saveToken(newJwtToken);

      return true;
    } else {
      _status = LoginStatus.error;
      _error = response.data.toString();
      notifyListeners();
      throw "Sorry, could not log you in at the moment, please try again later.";
    }
  }

  /// Takes input three arguments
  /// * an email address
  /// * a password
  /// * an unique username
  /// and returns a future bool status
  Future<bool> signup(
      {required String email,
      required String password,
      required String passwordConfirm,
      required String displayName}) async {
    try {
      _status = LoginStatus.loading;
      notifyListeners();
      diolib.Response<Map> response = await dio.post(
        "/users/signup",
        data: {
          "email": email,
          "password": password,
          "passwordConfirm": passwordConfirm,
          // "userType": "user",
          "name": displayName,
        },
        options: diolib.Options(headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }),
      );
      if (response.statusCode == 200) {
        print('signedup');
        _status = LoginStatus.idle;
        notifyListeners();
        return true;
      } else {
        _status = LoginStatus.idle;
        notifyListeners();
        print(response.data);
        throw "Sorry, could not sign you up at the moment, please try again later.";
      }
    } catch (e) {
      diolib.DioError error = e as diolib.DioError;
      _status = LoginStatus.idle;
      notifyListeners();
      print(error.response?.data.toString());

      if (error.response?.data?["data"][0]["messages"][0]["id"] ==
          "Auth.form.error.email.taken") {
        throw "Sorry, could not sign you up, this email is already taken.";
      } else {
        throw "Sorry, could not sign you up at the moment, please try again later.";
      }
    }
  }

  // /// An async function which takes input **email**
  // /// and returns a bool value, as success or failure
  // Future<bool> resendVerification({required String email}) async {
  //   final diolib.Response response = await dio.post(
  //     "auth/send-email-confirmation",
  //     data: {
  //       'email': email,
  //     },
  //     options: diolib.Options(headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     }),
  //   )
  //       .catchError((e) {
  //     final diolib.DioError error = e as diolib.DioError;
  //     _error = "${error.message}";
  //     print(error.response?.data);
  //   });

  //   if (response.statusCode == 200) {
  //     print('verification mail sent');
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  /// An async function which takes input **email**
  /// and returns a bool value, as success or failure
  Future<bool> forgotPassword({required String email}) async {
    try {
      var response = await dio.post("auth/forgot-password", data: {
        'email': email,
      });
      print(response);
      if (response.toString() == '{"ok":true}') return true;
    } catch (e) {
      return false;
    }
    return false;
  }

  Future initialise() async {
    const _storage = FlutterSecureStorage();
    _token = (await _storage.read(key: "token")) ?? "";
    if (_token != '') {
      // fetchInfo();
      _status = LoginStatus.loggedIn;
      notifyListeners();
    } else {
      _status = LoginStatus.idle;
      notifyListeners();
    }
  }

  /// Saves token generated by server in a secure storage
  Future saveToken(String token) async {
    const _storage = FlutterSecureStorage();
    await _storage.write(key: "token", value: token);
    _status = LoginStatus.loggedIn;
    _token = token;
    notifyListeners();
    return;
  }

  /// Fetches the saved token from the secure storage
  Future getSavedToken() async {
    const _storage = FlutterSecureStorage();
    _token = (await _storage.read(key: "token")) ?? "";
    if (_token != '') {
      _status = LoginStatus.loggedIn;
      notifyListeners();
    } else {
      _status = LoginStatus.idle;
      notifyListeners();
    }
  }

  /// Logs out the user, and delete the secure token
  Future<void> logout() async {
    const _storage = FlutterSecureStorage();
    await _storage.delete(key: "token");
    _status = LoginStatus.idle;
    notifyListeners();
  }
}
