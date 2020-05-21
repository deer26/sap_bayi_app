import 'dart:convert';

// Bu post url'i chrome extension'ı olan wizdler'dan aldım.post url kısmında yazan url
final String bayiListUrl =
    "https://b2b.federalmogul.com.tr:1443/sap/bc/srt/rfc/sap/yy_ws_afm_kk_bayilist/021/yy_ws_afm_kk_bayilist/yy_ws_afm_kk_bayilist";
final String username = "RERYAZ";
final String password = "1qaz7UjM";
// bu body yine chrome exit wizlerda body kısmından alındı
final String bayiBody =
    "<Envelope xmlns=\"http://schemas.xmlsoap.org/soap/envelope/\"><Body><YY_AFM_KK_BAYILIST xmlns=\"urn:sap-com:document:sap:rfc:functions\"/></Body></Envelope>";

final String basicAuth =
    'Basic ' + base64Encode(utf8.encode('$username:$password'));
// header bigisi de wizdler ın header kısmından alındı
final bayiListHeader = {
  "authorization": basicAuth,
  "SOAPAction":
      "urn:sap-com:document:sap:rfc:functions:YY_WS_AFM_KK_BAYILIST:YY_AFM_KK_BAYILISTRequest",
  "Content-Type": "text/xml; charset=\"utf-8\"",
};
// Fatura değişkenleri
final fatListUrl =
    "https://b2b.federalmogul.com.tr:1443/sap/bc/srt/rfc/sap/yy_ws_afm_kk_fatlist/021/yy_ws_afm_kk_fatlist/yy_ws_afm_kk_fatlist";
final fatListHeader = {
  "authorization": basicAuth,
  "SOAPAction":
      "urn:sap-com:document:sap:soap:functions:mc-style:YY_WS_AFM_KK_FATLIST:YyAfmKkFatlistRequest",
  "Content-Type": "text/xml; charset=\"utf-8\""
};

// FatDetail değişkenleri
final  fatDetailUrl =
    "https://b2b.federalmogul.com.tr:1443/sap/bc/srt/rfc/sap/yy_ws_afm_kk_fatitem_list/021/yy_ws_afm_kk_fatitem_list/yy_ws_afm_kk_fatitem_list";
final fatDetailHeader = {
  "authorization": basicAuth,
  "SOAPAction":
      "urn:sap-com:document:sap:soap:functions:mc-style:YY_WS_AFM_KK_FATITEM_LIST:YyAfmKkFatitemListRequest",
  "Content-Type": "text/xml; charset=\"utf-8\""
};
