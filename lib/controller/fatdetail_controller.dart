import 'package:bayi_projesi/model/constant.dart';
import 'package:bayi_projesi/model/fatdetail_model.dart';
import 'package:bayi_projesi/model/helper_model.dart';
import 'package:http/http.dart' show Client, Response;

class FatDetailController {
  Client client = Client();

  Future<FatDetail> fetchFatDetail(String belgeNo) async {
    final fatDetailBody =
        """<Envelope xmlns=\"http://schemas.xmlsoap.org/soap/envelope/\">
    <Body>
        <YyAfmKkFatitemList xmlns=\"urn:sap-com:document:sap:soap:functions:mc-style\">
            <DocumentHeaderId xmlns=\"\">$belgeNo</DocumentHeaderId>
        </YyAfmKkFatitemList>
    </Body>
</Envelope>""";
    Response response = await client.post(fatDetailUrl,
        headers: fatDetailHeader, body: fatDetailBody);
    if (response.statusCode == 200) {
      var sonuc = HelperModel()
          .converxmltojson(response.body)["n0:YyAfmKkFatitemListResponse"];
      return FatDetail.fromJson(sonuc);
    } else {
      throw Exception("Failed to load bayi list");
    }
  }
}
