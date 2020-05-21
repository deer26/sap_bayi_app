import 'package:bayi_projesi/controller/fatura_list_controller.dart';
import 'package:bayi_projesi/model/bayi_model.dart';
import 'package:bayi_projesi/model/fatura_model.dart';
import 'package:bayi_projesi/view/pages/fatura_detay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class FaturaPage extends StatelessWidget {
  final Item item;

  FaturaPage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item.eNTEGREID + " - Faturaları"),
      ),
      body: FutureBuilder(
        future: FaturaListController().fetchFatList(this.item.eNTEGREID),
        builder: (BuildContext context, AsyncSnapshot<FaturaModel> snap) {
          if (snap.hasData) {
            List<DataRow> listem = [];
            FaturaModel faturaModel = snap.data;
            if (faturaModel.etFatlist != null) {
              double toplam = 0;
              for (var e in faturaModel.etFatlist.item) {
                double degerim = double.parse(e.invAmount);
                toplam = toplam + degerim;
                FlutterMoneyFormatter fmf =
                    FlutterMoneyFormatter(amount: degerim);
                listem.add(DataRow(cells: [
                  DataCell(InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FaturaDetay(e.documentId),
                      ),
                    ),
                    child: Icon(
                      Icons.details,
                      color: Colors.amber,
                    ),
                  )),
                  DataCell(Text(e.documentId)),
                  DataCell(Text(e.date)),
                  DataCell(Text(e.dueDate)),
                  DataCell(Text(fmf.output.compactNonSymbol)),
                  DataCell(Text(e.currency)),
                  DataCell(Text(e.explanation)),
                ]));
              }
              FlutterMoneyFormatter total =
                  FlutterMoneyFormatter(amount: toplam);
              listem.insert(0,DataRow(cells: [
                DataCell(Text("")),
                DataCell(
                  Text(
                    "Toplam",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                DataCell(Text("")),
                DataCell(Text("")),
                DataCell(
                  Text(
                    total.output.compactNonSymbol,
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                DataCell(
                  Text(
                    "TRY",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                DataCell(Text("")),
              ]));
            }

            if (faturaModel.etFatlist != null) {
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    dividerThickness: 4,
                    columnSpacing: 13,
                    sortAscending: true,
                    columns: [
                      DataColumn(label: ColumnHeader(baslik: "")),
                      DataColumn(label: ColumnHeader(baslik: "Belge No")),
                      DataColumn(label: ColumnHeader(baslik: "Belge Trh")),
                      DataColumn(label: ColumnHeader(baslik: "Ödeme Trh")),
                      DataColumn(label: ColumnHeader(baslik: "Tutar")),
                      DataColumn(label: ColumnHeader(baslik: "PB")),
                      DataColumn(label: ColumnHeader(baslik: "Açıklama")),
                    ],
                    rows: listem,
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(faturaModel.evReturn),
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
}

class ColumnHeader extends StatelessWidget {
  final String baslik;

  const ColumnHeader({Key key, this.baslik}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.baslik,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w800, fontSize: 15),
    );
  }
}
