import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';



class BaseController {

  static String urlbase = "https://gateway.marvel.com:443/v1/public/";
  static String apikey="e520aff9d4aea6e0a31af5dc21f885a3";
  static String apikeyPrivate="47f908764918447ceca05f4dae9781c0bb366d12";
  generateMd5(String data) {
    print(data);
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  Future getHttp(String url) async {
    var ts = DateTime.now();
    String tsDate= ts.toString().replaceAll(' ', '');
    var hash = generateMd5(tsDate+ apikeyPrivate + apikey);
    String fullUrl = (urlbase+url+"&apikey=$apikey&ts="+tsDate+"&hash=$hash" );
    print(fullUrl);
    Uri fullUri = Uri.parse(fullUrl);
    Map<String, String> fullHeaders = {
      "content-type": "application/json",
    };
    Response response = await get(fullUri, headers: fullHeaders);

    if (response.statusCode == 200) {
        var result;
        if (response.body != "") {
          result = json.decode(response.body);
        }
        return result;
    }  else if (response.statusCode == 409) {
     // showToast(json.decode(response.body)["status"]);
      return null;
    } else if (response.statusCode == 502) {
      //showToast("Bad Gateway");
    } else {
      print(response);
      return json.decode(response.body);
    }
  }

}







