import 'package:bayi_projesi/model/constant.dart';
import 'package:bayi_projesi/model/fatura_model.dart';
import 'package:bayi_projesi/model/helper_model.dart';
import 'package:http/http.dart' show Client, Response;

class FaturaListController {
  Client client = Client();

  Future<FaturaModel> fetchFatList(String eNTEGREID) async {
    final String faturaBody =
        """<Envelope xmlns=\"http://schemas.xmlsoap.org/soap/envelope/\">
   <Body><YyAfmKkFatlist 
   xmlns=\"urn:sap-com:document:sap:soap:functions:mc-style\">
   <CurrentId xmlns=\"\">$eNTEGREID</CurrentId></YyAfmKkFatlist></Body>
</Envelope>""";

    Response response = await client.post(fatListUrl,
        headers: fatListHeader, body: faturaBody);
    if (response.statusCode == 200) {
      var sonuc = HelperModel().converxmltojson(response.body)["n0:YyAfmKkFatlistResponse"];
      return FaturaModel.fromJson(sonuc);
    } else {
      throw Exception("Failed to load bayi list");
    }
  }
}
