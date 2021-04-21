import 'dart:convert';
import 'dart:io';

import 'package:Selfy_made/Screens/login_SignUp/user_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiCalls {
  Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
  final String _url = "http://10.0.2.2/api/";
  Dio _dio = Dio();


  searchImpl(String search) async {
    var prefs = await sharedPreferences;

    var data = FormData.fromMap({
      'search_term': search,
    });

    var token = jsonDecode(prefs.getString('user'))['authToken'];
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response res = await _dio.post(_url + 'products/search/', data: data);
    return res.data;
  }

  addCoupon(campaignName, discountAmount, discountCode) async {
    var prefs = await sharedPreferences;

    var data = FormData.fromMap({
      'campaign_name': campaignName,
      'discount_amount': discountAmount,
      'discount_code': discountAmount,
      'date': DateTime.now(),
    });
    var token = jsonDecode(prefs.getString('user'))['authToken'];
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response res = await _dio.post(_url + 'coupons', data: data);
    if (res.data['status'] == 200) {
      return 'success';
    } else {
      return 'failed';
    }
  }

  addProduct(data) async {
    var prefs = await sharedPreferences;
    prefs.remove('products');
    print(jsonDecode(prefs.getString('user'))['authToken']);
    var token = jsonDecode(prefs.getString('user'))['authToken'];
    _dio.options.headers["Accept"] = "application/json";
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response res = await _dio.post(_url + 'products', data: data).catchError((e)=>print(e.response?.toString()));
    print(res);
    if (res.data['status'] == 200) {
      return res.data;
    } else {
      return 'failed';
    }
  }

  addProductToCart(product) async {
    var prefs = await sharedPreferences;
    prefs.remove('products');
    print(jsonDecode(prefs.getString('user'))['authToken']);
    var token = jsonDecode(prefs.getString('user'))['authToken'];
    _dio.options.headers["Accept"] = "application/json";
    _dio.options.headers["Authorization"] = "Bearer $token";

    if(prefs.getInt('cart_id') == null){
        Response createCartRes = await _dio.post(_url + 'products/cart').catchError((e)=>print(e.response?.toString()));
        prefs.setInt('cart_id',createCartRes.data['id']);
    }
    Response res = await _dio.post(_url + 'products/add-to-cart/${product['id']}',data:{'cart_id':prefs.getInt('cart_id')}).catchError((e)=>print(e.response?.toString()));
    print(prefs.getInt('cart_id'));

    if (res.data['status'] == 200) {
      return "success";
    } else {
      return 'failed';
    }
  }

  saveStore(storeName, nameAndSurnameOfBankOwner, ibanNo, phoneNo, cnic, city,
      address, File _image) async {
    var prefs = await sharedPreferences;
    var fileName = _image.path.split('/').last;
    var data = FormData.fromMap({
      'photo_url':
          await MultipartFile.fromFile(_image.path, filename: fileName),
      'store_name': storeName,
      'owner_name': nameAndSurnameOfBankOwner,
      'bank_account_no': ibanNo,
      'phone_number': phoneNo,
      'address': address,
      'city': city,
      'turkish_identity_no': cnic,
      'store_type': 'individual',
      'is_approved': true,
    });
    var token = jsonDecode(prefs.getString('user'))['authToken'];
    _dio.options.headers["Authorization"] = "Bearer $token";

    Response res = await _dio.post(_url + 'stores', data: data);
    if (res.data['status'] == 200) {
      return 'success';
    } else {
      return 'failed';
    }

    // var response = await http
    //     .post(_url + 'stores',
    //         headers: _setHeaders(
    //             auth: true,
    //             authToken: jsonDecode(prefs.getString('user'))['authToken']),
    //         body: jsonEncode(data))
    //     .timeout(
    //       Duration(seconds: 30),
    //       onTimeout: () => throw Exception("Could't connect to the server"),
    //     );
    // print("resopnse");
    // print(response.body);

    // if (response.statusCode == 200 &&
    //     jsonDecode(response.body)['status'] == 200) {
    //   return 'success';
    // } else
    //   return 'failed';
  }

  validateUserDetails(email, password) async {
    var prefs = await sharedPreferences;
    if (prefs.getString('user') == null) {
      var data = {'email': email, 'password': password};
      var response = await http
          .post(_url + 'login', headers: _setHeaders(), body: jsonEncode(data))
          .timeout(Duration(seconds: 30), onTimeout: () {
        throw Exception("Couldn't connect to the Server");
      });
      print(response.body);
      if (response.statusCode == 200 && jsonDecode(response.body)['status'] == "success") {
          print(UserModel.fromJson(jsonDecode(response.body)).toJson());
          prefs.setString('user', jsonEncode(UserModel.fromJson(jsonDecode(response.body)).toJson()));
        return jsonDecode(response.body)['status'];
      } else {
        return jsonDecode(response.body)['status'];
      }
    } else {
      print(prefs.get('user'));
      return "success";
    }
  }

  getUserDetails() async {
    var prefs = await sharedPreferences;
    return UserModel.fromJson(jsonDecode(prefs.getString('user')));
  }

  changePassword(currentPassword, newPassword, confirmPassword) async {
    var prefs = await sharedPreferences;
    var data = {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
      'newPassword_confirmation': confirmPassword
    };
    var response = await http
        .post(_url + 'change-password',
            headers: _setHeaders(
                auth: true,
                authToken: jsonDecode(prefs.getString('user'))['authToken']),
            body: jsonEncode(data))
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['status'] == "success") {
      return jsonDecode(response.body)['status'];
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  changePersonalInfo(name, email, phoneNumber) async {
    var prefs = await sharedPreferences;
    var data = {'name': name, 'email': email, 'phoneNumber': phoneNumber};
    var response = await http
        .post(_url + 'change-personal-info',
            headers: _setHeaders(
                auth: true,
                authToken: jsonDecode(prefs.getString('user'))['authToken']),
            body: jsonEncode(data))
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['status'];
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  updateAddress(address) async {
    var prefs = await sharedPreferences;
    var data = {'address': address};
    var response = await http
        .post(_url + 'update-address',
            headers: _setHeaders(
                auth: true,
                authToken: jsonDecode(prefs.getString('user'))['authToken']),
            body: jsonEncode(data))
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  addAddresses(address) async {
    var prefs = await sharedPreferences;
    var data = {'address': address};
    var response = await http
        .post(_url + 'add-address',
            headers: _setHeaders(
                auth: true,
                authToken: jsonDecode(prefs.getString('user'))['authToken']),
            body: jsonEncode(data))
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  getCards() async {
    var prefs = await sharedPreferences;
    var response = await http
        .get(
      _url + 'cards',
      headers: _setHeaders(
          auth: true,
          authToken: jsonDecode(prefs.getString('user'))['authToken']),
    )
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  getAllProducts() async {
      var prefs = await sharedPreferences;
      var response = await http
              .get(
                      _url + 'products',
                      headers: _setHeaders(
                              auth: true,
                              authToken: jsonDecode(prefs.getString('user'))['authToken']),
              )
              .timeout(Duration(seconds: 30), onTimeout: () {
                  throw Exception("Couldn't connect to the Server");
              });
      if (response.statusCode == 200) {
          return jsonDecode(response.body);
      } else {
          return jsonDecode(response.body)['message'];
      }
  }

  addCard(ownerName, number, expiryDate, cvv) async {
    var prefs = await sharedPreferences;
    var data = {
      'owner_name': ownerName,
      'number': number,
      'expiry_date': expiryDate,
      'cvv': cvv
    };
    var response = await http
        .post(_url + 'cards',
            headers: _setHeaders(
                auth: true,
                authToken: jsonDecode(prefs.getString('user'))['authToken']),
            body: jsonEncode(data))
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    print(response.body);
    if (response.statusCode == 200) {
        return "success";
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  updateCard(id, ownerName, number, expiryDate, cvv) async {
    var prefs = await sharedPreferences;
    var data = {
      'owner_name': ownerName,
      'number': number,
      'expiry_date': expiryDate,
      'cvv': cvv
    };
    var response = await http
        .put(_url + 'cards/' + id,
            headers: _setHeaders(
                auth: true,
                authToken: jsonDecode(prefs.getString('user'))['authToken']),
            body: jsonEncode(data))
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body);
    }
  }

  updateProfile(data) async {
    var prefs = await sharedPreferences;
    print(jsonDecode(prefs.getString('user'))['authToken']);
    var token = jsonDecode(prefs.getString('user'))['authToken'];
    _dio.options.headers["Accept"] = "application/json";
    _dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await _dio.post(_url + 'update-profile', data: data).catchError((e)=>print(e.response?.toString()));
    print(jsonDecode(response.toString())['status']);
    if (jsonDecode(response.toString())['status'] == 200) {
      return jsonDecode(response.toString());
    } else {
      return jsonDecode(response.data)['message'];
    }
  }

  deleteCard(id) async {
    var prefs = await sharedPreferences;
    prefs.remove('cards');
    var response = await http
        .delete(
      _url + 'cards/$id',
      headers: _setHeaders(
              auth: true,
              authToken: jsonDecode(prefs.getString('user'))['authToken']),
        )
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  deleteAddress(id) async {
    var prefs = await sharedPreferences;
    var response = await http
        .delete(
      _url + 'delete-address' + id,
      headers: _setHeaders(
          auth: true,
          authToken: jsonDecode(prefs.getString('user'))['authToken']),
    )
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      return jsonDecode(response.body)['message'];
    }
  }

  Future<bool> isAuthenticated() async {
    var prefs = await sharedPreferences;
    prefs.remove('user');
    if (jsonDecode(prefs.getString('user'))['authToken'] == null) {
      return false;
    } else {
      return true;
    }
  }

  register(email, password, confirmPassword, username) async {
    var data = {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'name': username
    };
    var response = await http
        .post(_url + 'register', headers: _setHeaders(), body: jsonEncode(data))
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['status'] == "success") {
      return jsonDecode(response.body)['status'];
    } else {
      print(response.body);
      return jsonDecode(response.body)['message'];
    }
  }

  getAllCards() async {
    var prefs = await sharedPreferences;
    if (prefs.getString('cards') == null) {
      var response = await http
          .get(
        _url + 'get-all-cards',
        headers: _setHeaders(
            auth: true,
            authToken: jsonDecode(prefs.getString('user'))['authToken']),
      )
          .timeout(Duration(seconds: 30), onTimeout: () {
        throw Exception("Couldn't connect to the Server");
      });
      if (response.statusCode == 200) {
        prefs.setString('cards', jsonEncode(jsonDecode(response.body)));
        return jsonDecode(response.body);
      } else {
        return jsonDecode(response.body)['message'];
      }
    } else {
      return jsonDecode(prefs.getString('cards'));
    }
  }

  sendChatMessage(message) async {
    var prefs = await sharedPreferences;
    var data = {'message': message};
    var response = await http
        .post(_url + 'send-chat-message',
            headers: _setHeaders(
                auth: true,
                authToken: jsonDecode(prefs.getString('user'))['authToken']),
            body: jsonEncode(data))
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200 &&
        jsonDecode(response.body)['status'] != null) {
      return jsonDecode(response.body);
    } else {
      return jsonDecode(response.body)['status'];
    }
  }

  getChatMessages() async {
    var prefs = await sharedPreferences;
    //if(prefs.getString('messages') == null){
    var response = await http
        .get(
      _url + 'get-chat-messages',
      headers: _setHeaders(
          auth: true,
          authToken: jsonDecode(prefs.getString('user'))['authToken']),
    )
        .timeout(Duration(seconds: 30), onTimeout: () {
      throw Exception("Couldn't connect to the Server");
    });
    if (response.statusCode == 200) {
      prefs.setString(
          'messages', jsonEncode(jsonDecode(response.body)['message']));
      return jsonDecode(response.body)['message'];
    } else {
      return jsonDecode(response.body)['message'];
    }
    //}else{
    //return jsonDecode(prefs.getString('messages'));
    //}
  }

  _setHeaders({bool auth = false, String authToken}) {
    if (auth) {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ' + authToken
      };
    } else {
      return {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
  }
}
