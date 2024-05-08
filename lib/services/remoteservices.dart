import 'package:http/http.dart' as http;
import '../models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productFromJson(jsonString);
      }
    } catch (err) {
      print(err.toString());
    }
  }
}

// class RemoteServices {
//   static var client = http.Client();
//   var Json;
//   Future<List<Product>> getData() async {
//     var uri =
//         Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json');
//     var res = await client.get(uri);
//     try {
//       if (res.statusCode == 200) {
//         var Json = res.body;
//       }
//     } catch (err) {
//       print(err.toString());
//     }
//     return productFromJson(Json);
//   }
// }
