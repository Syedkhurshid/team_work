import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataBase with ChangeNotifier {
  //shared prefs start

  String initial_city = 'Islamabad';
  String username = '';
  String password = '';

  void _setPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('initial_city', initial_city);
    String username = '';
    String password = '';
  }

  void _getPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initial_city = prefs.getString('initial_city') ?? 'Islamabad';
    notifyListeners();
  }

  void _getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username') ?? '';
    password = prefs.getString('password') ?? '';
    notifyListeners();
  }

  void addAuth(username, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
    _setPrefItems();
    notifyListeners();
  }

  String getUsername() {
    _getAuth();
    return username;
  }

  String getCity() {
    _getPrefItems();
    return initial_city;
  }

  // late Future<SharedPreferences> sharedPreferences;
  //
  // Stream<SharedPreferences> get prefsState => sharedPreferences.asStream();

  // Future get fetchPrefs async {
  //   final SharedPreferences prefs = await sharedPreferences;
  //   // prefs.getInt('counter');
  //   prefs.setString('username', 'hassan');
  //   prefs.setString('password', '123456');
  //
  //   print('cool');
  // }

  //shared prefs end

  Map<String, dynamic> _mapFeatured = {};
  bool _errorFeatured = false;
  String _errorMessageFeatured = '';

  Map<String, dynamic> get mapFeatured => _mapFeatured;

  bool get errorFeatured => _errorFeatured;

  String get errorMessageFeatured => _errorMessageFeatured;

  Future<void> get fetchFeatured async {
    final response = await get(
      Uri.parse('https://teamworkpk.com/API/featured.php'),
    );
    if (response.statusCode == 200) {
      try {
        _mapFeatured = jsonDecode(response.body);
        _errorFeatured = false;
      } catch (e) {
        _errorFeatured = true;
        _errorMessageFeatured = e.toString();
        _mapFeatured = {};
      }
    } else {
      _errorFeatured = true;
      _errorMessageFeatured = 'Error : It could be your Internet connection.';
      _mapFeatured = {};
    }
    notifyListeners();
  }

  Map<String, dynamic> _mapListingDetail = {};
  bool _errorListingDetail = false;
  String _errorMessageListingDetail = '';

  Map<String, dynamic> get mapListingDetail => _mapListingDetail;

  bool get errorListingDetail => _errorListingDetail;

  String get errorMessageListingDetail => _errorMessageListingDetail;

  Future<void> fetchListingDetail(String id) async {
    final response = await get(
      Uri.parse(
          'https://teamworkpk.com/API/listing_detail.php?web_post_id=' + id),
    );
    if (response.statusCode == 200) {
      try {
        _mapListingDetail = jsonDecode(response.body);
        _errorListingDetail = false;
      } catch (e) {
        _errorListingDetail = true;
        _errorMessageListingDetail = e.toString();
        _mapListingDetail = {};
      }
    } else {
      _errorListingDetail = true;
      _errorMessageListingDetail =
          'Error : It could be your Internet connection.';
      _mapListingDetail = {};
    }
    notifyListeners();
  }

  Map<String, dynamic> _mapSearch = {};
  bool _errorSearch = false;
  String _errorMessageSearch = '';

  Map<String, dynamic> get mapSearch => _mapSearch;

  bool get errorSearch => _errorSearch;

  String get errorMessageSearch => _errorMessageSearch;

  Future<void> Search(String curl) async {
    final response = await get(
      Uri.parse('https://teamworkpk.com/API/nonfeatured.php' + curl),
    );
    if (response.statusCode == 200) {
      try {
        _mapSearch = jsonDecode(response.body);
        _errorSearch = false;
      } catch (e) {
        _errorSearch = true;
        _errorMessageSearch = e.toString();
        _mapSearch = {};
      }
    } else {
      _errorSearch = true;
      _errorMessageSearch = 'Error : It could be your Internet connection.';
      _mapSearch = {};
    }
    notifyListeners();
  }

  // Future<void> get fetchListingDetail async {
  //   final response = await get(
  //     Uri.parse('https://teamworkpk.com/API/listing_detail.php?web_post_id='),
  //   );
  //   if (response.statusCode == 200) {
  //     try {
  //       _mapFeatured = jsonDecode(response.body);
  //       _errorFeatured = false;
  //     } catch (e) {
  //       _errorFeatured = true;
  //       _errorMessageFeatured = e.toString();
  //       _mapFeatured = {};
  //     }
  //   } else {
  //     _errorFeatured = true;
  //     _errorMessageFeatured = 'Error : It could be your Internet connection.';
  //     _mapFeatured = {};
  //   }
  //   notifyListeners();
  // }

  Map<String, dynamic> _mapListing = {};
  bool _errorListing = false;
  String _errorMessageListing = '';

  Map<String, dynamic> get mapListing => _mapListing;

  bool get errorListing => _errorListing;

  String get errorMessageListing => _errorMessageListing;

  Future<void> get fetchListing async {
    final response = await get(
      Uri.parse('https://teamworkpk.com/API/nonfeatured.php'),
    );
    if (response.statusCode == 200) {
      try {
        _mapListing = jsonDecode(response.body);
        _errorListing = false;
      } catch (e) {
        _errorListing = true;
        _errorMessageListing = e.toString();
        _mapListing = {};
      }
    } else {
      _errorListing = true;
      _errorMessageListing = 'Error : It could be your Internet connection.';
      _mapListing = {};
    }
    notifyListeners();
  }

  Map<String, dynamic> _mapProjects = {};
  bool _errorProjects = false;
  String _errorMessageProjects = '';

  Map<String, dynamic> get mapProjects => _mapProjects;

  bool get errorProjects => _errorProjects;

  String get errorMessageProjects => _errorMessageProjects;

  Future<void> get fetchProjects async {
    final response = await get(
      Uri.parse('https://teamworkpk.com/API/projects.php'),
    );
    if (response.statusCode == 200) {
      try {
        _mapProjects = jsonDecode(response.body);
        _errorProjects = false;
      } catch (e) {
        _errorProjects = true;
        _errorMessageProjects = e.toString();
        _mapProjects = {};
      }
    } else {
      _errorProjects = true;
      _errorMessageProjects = 'Error : It could be your Internet connection.';
      _mapProjects = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _mapFeatured = {};
    _errorFeatured = false;
    _errorMessageFeatured = '';

    _mapListing = {};
    _errorListing = false;
    _errorMessageListing = '';

    _mapProjects = {};
    _errorProjects = false;
    _errorMessageProjects = '';

    _mapListingDetail = {};
    _errorListingDetail = false;
    _errorMessageListingDetail = '';

    _mapSearch = {};
    _errorSearch = false;
    _errorMessageSearch = '';

    notifyListeners();
  }
}
