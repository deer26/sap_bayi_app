import 'package:bayi_projesi/model/bayi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class FirmaBilgileri extends StatelessWidget {
  final Item item;
  FirmaBilgileri(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.eNTEGREID + " nolu Bayi Bilgileri"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Text(
                    this.item.cURRENTNAME,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://picsum.photos/450/250/?blur=2",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              shadowColor: Colors.grey,
              child: Column(
                children: <Widget>[
                  Satirlar(
                    baslik: "Bayi Entegre No",
                    deger: this.item.eNTEGREID,
                  ),
                  Satirlar(
                    baslik: "Bayi Adı",
                    deger: this.item.cURRENTNAME,
                  ),
                  Satirlar(
                    baslik: "Adres",
                    deger: this.item.aDDRESS,
                  ),
                  Satirlar(
                    baslik: "Şehir",
                    deger: this.item.cITY,
                  ),
                  Satirlar(
                    baslik: "İlçe",
                    deger: this.item.tOWN,
                  ),
                  Satirlar(
                    baslik: "Vergi Dairesi",
                    deger: this.item.tAXOFFICE,
                  ),
                  Satirlar(
                    baslik: "Vergi Numarası",
                    deger: this.item.tAXNUMBER,
                  ),
                  Satirlar(
                    baslik: "Mail Adres",
                    deger: this.item.mAILADDRESS,
                  ),
                  Satirlar(
                    baslik: "Tel No",
                    deger: this.item.pHONENUMBER,
                  ),
                  Satirlar(
                    baslik: "Bakiyesi",
                    deger: this.item.bALANCE,
                  ),
                  Satirlar(
                    baslik: "Kapatılmamış Borç",
                    deger: this.item.uNCLOSEDDEBT,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Satirlar extends StatelessWidget {
  const Satirlar({
    Key key,
    this.baslik,
    this.deger = " ",
  }) : super(key: key);

  final String baslik;
  final String deger;

  @override
  Widget build(BuildContext context) {
    String sonuc = "";
    if (this.baslik == "Bakiyesi" || this.baslik == "Kapatılmamış Borç") {
      double degerim = double.parse(this.deger);
      FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
        amount: degerim,
        settings: MoneyFormatterSettings(symbol: "TRY"),
      );
      sonuc = fmf.output.symbolOnRight;
    }

    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                this.baslik,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (this.baslik == "Mail Adres" &&
                      this.deger != null &&
                      this.deger.isNotEmpty) {
                    UrlLauncher.launch(
                        "mailto:${this.deger}?subject=Kapanmamış Fatura Hk.&body=Sayın Yetkili,");
                  } else if (this.baslik == "Tel No" &&
                      this.deger != null &&
                      this.deger.isNotEmpty) {
                    UrlLauncher.launch("tel:${this.deger}");
                  }
                },
                child: Text(
                  (this.baslik == "Bakiyesi" ||
                          this.baslik == "Kapatılmamış Borç")
                      ? sonuc
                      : this.deger != null ? this.deger : "",
                  style: TextStyle(
                      color: (this.baslik == "Mail Adres" ||
                              this.baslik == "Tel No")
                          ? Colors.yellowAccent
                          : Colors.white,
                      decoration: (this.baslik == "Mail Adres" ||
                              this.baslik == "Tel No")
                          ? TextDecoration.underline
                          : null),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
