import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sanalira_case/Data/Models/bank_model.dart';

import '../Utils/api_status.dart';

class DataProvider {
  Future<Object> fetchAllBank() async {
    try {
      var url = Uri.parse("https://api.sanalira.com/assignment");

      // Yükleme animasyonunu gösterebilmek için isteği 2 saniye gecikmeli olarak atıyor.
      var response = await Future.delayed(const Duration(seconds: 2), () async {
        return await http.get(url);
      });

      if (response.statusCode == 200) {
        final jsonResponse = BankModel.fromJson(jsonDecode(response.body));

        if (jsonResponse.response != null) {
          if (jsonResponse.response!.code == 200) {
            return Success(response: jsonResponse);
          } else {
            return Failure(errorMessage: jsonResponse.response!.message ?? "Something went wrong");
          }
        } else {
          return Failure(errorMessage: jsonResponse.response!.message ?? "Something went wrong");
        }
      }
      return Failure(
        errorMessage: response.body,
      );
    } on HttpException {
      return Failure(errorMessage: "No Internet Connection");
    } on FormatException {
      return Failure(errorMessage: "Invalid Format");
    } on SocketException {
      return Failure(errorMessage: "No Internet Connection");
    } catch (e) {
      return Failure(errorMessage: "Invalid Error");
    }
  }
}
