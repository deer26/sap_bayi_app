import 'dart:async';

import 'package:bayi_projesi/controller/bayi_list_controlller.dart';
import 'package:bayi_projesi/model/bayi_model.dart';
import 'package:bayi_projesi/view/pages/fatura.dart';
import 'package:bayi_projesi/view/pages/firma_info.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> bayiListem = [];
  List<Item> searchList = [];
  String girilenKelime = "";
  TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    getBayiList();
    Timer(Duration(seconds: 3), () {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bayi Listesi"),
      ),
      body: FutureBuilder(
        future: getBayiList(),
        builder: (context, snap) => Column(
          children: <Widget>[
            new Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  child: new ListTile(
                    leading: new Icon(Icons.search),
                    title: new TextField(
                      autofocus: false,
                      controller: controller,
                      decoration: new InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: onSearchTextChanged,
                    ),
                    trailing: new IconButton(
                      icon: new Icon(Icons.cancel),
                      onPressed: () {
                        controller.clear();
                        FocusScope.of(context).unfocus();
                        onSearchTextChanged('');
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: bayiListem.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: girilenKelime.isNotEmpty
                            ? searchList.length
                            : bayiListem.length,
                        itemBuilder: (context, index) {
                          var item = girilenKelime.isNotEmpty
                              ? searchList[index]
                              : bayiListem[index];
                          return ListTile(
                            leading: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FirmaBilgileri(item),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.black45,
                                child: Icon(Icons.work,
                                color: Colors.amberAccent,),

                              ),
                            ),
                            title: Text(item.cURRENTNAME),
                            subtitle: Text(item.eNTEGREID),
                            trailing: IconButton(
                                icon: Icon(Icons.arrow_forward,
                                color: Colors.lightGreenAccent,),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FaturaPage(item),
                                    ),
                                  );
                                }),
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getBayiList() async {
    bayiListem = await BayiListController().fetchBayiList();
    return bayiListem;
  }

  onSearchTextChanged(String arama) {
    searchList.clear();

    for (var item in bayiListem) {
      var aranacak = "${item.cURRENTNAME}${item.eNTEGREID}".toUpperCase();
      var aranan = arama.toUpperCase();
      if (aranacak.contains(aranan)) {
        searchList.add(item);
      }
    }
    girilenKelime = arama;
    setState(() {});
  }
}
