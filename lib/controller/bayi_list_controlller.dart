import 'package:bayi_projesi/model/bayi_model.dart';
import 'package:bayi_projesi/model/constant.dart';
import 'package:bayi_projesi/model/helper_model.dart';
import 'package:http/http.dart' show Client, Response;

class BayiListController {
  Client client = Client();

 Future<List<Item>> fetchBayiList() async {
    Response response =
        await client.post(bayiListUrl, headers: bayiListHeader, body: bayiBody,);
    if (response.statusCode == 200) {
      var sonuc =
          HelperModel().converxmltojson(response.body)["n0:YY_AFM_KK_BAYILISTResponse"];
      var bayiModel = BayiModel.fromJson(sonuc);
      return bayiModel.eTBAYILIST.item;
    } else {
      throw Exception("Failed to load bayi list");
    }
  }
}
