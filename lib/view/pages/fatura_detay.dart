import 'package:bayi_projesi/controller/fatdetail_controller.dart';
import 'package:bayi_projesi/model/fatdetail_model.dart';
import 'package:flutter/material.dart';

class FaturaDetay extends StatelessWidget {
  final String documentId;
  FaturaDetay(this.documentId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.documentId + " Fatura Detayları"),
      ),
      body: FutureBuilder(
        future: FatDetailController().fetchFatDetail(this.documentId),
        builder: (BuildContext context, AsyncSnapshot<FatDetail> snap) {
          FatDetail detail = snap.data;
          if (snap.hasData) {
            if (detail.etItem != null) {
              return ListView.builder(
                  itemCount: detail.etItem.item.length,
                  itemBuilder: (context, index) {
                    Item item = detail.etItem.item[index];
                    return Card(
                      margin: EdgeInsets.all(7),
                      child: Column(
                        children: <Widget>[
                          satirlarim("Kalem No", item.documentItem),
                          satirlarim("Malzeme No", item.productCode),
                          satirlarim("Malzeme Tanımı", item.productName),
                          satirlarim("Miktar", "${item.quantity} ${item.unit}"),
                          satirlarim("Birim Fiyat", "${item.unitPrice} ${item.currency}"),
                          satirlarim("Toplam Fiyat", "${item.totalPrice} ${item.currency}"),
                          satirlarim("Vergi Tutarı", "${item.vatPrice} ${item.currency}"),
                          satirlarim("Vergi Oranı",item.vatRate),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.amberAccent,
                          width: 1.0,
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text(detail.evReturn),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget satirlarim(String baslik, String deger) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    baslik,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ))),
        Expanded(
            flex: 2,
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(deger),
            ))),
      ],
    );
  }
}
