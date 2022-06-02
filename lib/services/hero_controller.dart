import 'package:marvel_app/services/base_service.dart';
import 'package:intl/intl.dart';
class HeroControllers extends BaseController{
  //scroll 30
    getHeroList(String skiplimit) async {
      final response = await getHttp("characters?orderBy=name&limit=30&offset=$skiplimit");
      return (response["data"]);
    }
    //2005 yılından sonra yayınlanma tarihi yeniden eskiye doğru- Son 10
    getHeroComics(String id) async {
      final response = await getHttp("/characters/$id/comics?dateRange=2005-01-01%2C"+DateFormat('yyyy-MM-dd').format(DateTime.now())+"&orderBy=-focDate&limit=10&offset=0");
      return (response["data"]);
    }
}