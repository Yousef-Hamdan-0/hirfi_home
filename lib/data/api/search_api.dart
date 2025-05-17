// ignore_for_file: avoid_print
import 'dart:convert'; 
import 'dart:convert' as convert;

import 'package:hirfi_home/data/model/place_model.dart';
import 'package:http/http.dart' as http;

class SearchApp {
 
Future<List<String>> getchaletName() async {
    try {
      final response = await http.get(
          Uri.parse('http://reziox.somee.com/api/SearchPlace/SuggestSearch'));

      List<String> data = [];

      print(response.statusCode);

      if (response.statusCode == 200) {
        var decodedResponse = json.decode(response.body);

        if (decodedResponse is List) {
          data = List<String>.from(decodedResponse);
          print(data);
        } else {
          print(' response not list ');
        }
      } else {
        print('falied to get all chalet anme');
      }
      return data;
    } catch (e) {
      print('Exepation in get chalet name $e');
      return [];
    }
  }

  Future<List<PlaceModel>?> getdatafromSerach(String? chaletname) async {
    print(chaletname);
    Uri uri =
        Uri.parse("http://reziox.somee.com/api/SearchPlace/Search/$chaletname");
    try {
      var req = await http.get(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      List<PlaceModel> data = [];
      print(req.statusCode);
      if (req.statusCode == 200) {
        var json = convert.jsonDecode(req.body);
        if (json is List) {
          data = json.map((item) => PlaceModel.fromJson(item)).toList();
        } else {
          print("Failed api search");
        }
      } else {
        print("Failed to search");
      }
      return data;
    } catch (error) {
      print('Exception in getdatafromSerach: $error');
      return null;
    }
  }
}
