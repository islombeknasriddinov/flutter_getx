import 'package:get/get.dart';
import '../model/post_model.dart';
import '../service/http_service.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;
  var items = [].obs;

  Future apiPostList() async {
    isLoading(true);
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
    isLoading(false);
  }


  Future<bool> apiPostDelete(Post post) async {
    isLoading(true);
    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    items.removeAt(items.length-1);
    isLoading(false);

    return response != null;
  }
}