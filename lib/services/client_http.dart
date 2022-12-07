import 'dart:convert';

import 'package:http/http.dart';

import '../models/repositorio_list_model.dart';
import '../models/user_profile_model.dart';

class ApiService {
  static Future<List<RepositorioListModel>> getUserInfos(String user) async {
    const String user = '';
    var url = Uri.parse('https://api.github.com/users/Estevao-Nicolau/repos');
    Response res = await get(url);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<RepositorioListModel> repositoroListModel = body
          .map(
            (dynamic item) => RepositorioListModel.fromJson(item),
          ) 
          .toList();
      return repositoroListModel;
    } else {
      throw Exception('Falha ao carregar um Get${res.statusCode}');
    }
  }
static Future <UserProfileModel> getUser(String user) async {
    const String user = '';
    var url = Uri.parse('https://api.github.com/users/$user');
    Response res = await get(url);
    if (res.statusCode == 200) {
      Map<String, dynamic> body =  jsonDecode(res.body);
      List<UserProfileModel> userProfile = body
          .map(
            (String, dynamic item) => UserProfileModel.fromJson(item),
          ) 
          .toList();
      return userProfile;
    } else {
      throw Exception('Falha ao carregar um Get${res.statusCode}');
    }
  }
}


/*
--LER antes de começa--

O erro que esta acontecendo pode ser
do FutureBuild, pq tem dois 
outra coisa, para corriger esse erro
pode fazer em um so Future build 
assim vai build o Card UserProfil
e ListRepost em uma page so Future build


*/