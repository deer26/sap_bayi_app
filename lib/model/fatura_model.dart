class FaturaModel {
  EtFatlist etFatlist;
  String evReturn;

  FaturaModel({this.etFatlist, this.evReturn});

  FaturaModel.fromJson(Map<String, dynamic> json) {
    etFatlist = json['EtFatlist'] != null
        ? new EtFatlist.fromJson(json['EtFatlist'])
        : null;
    evReturn = json['EvReturn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.etFatlist != null) {
      data['EtFatlist'] = this.etFatlist.toJson();
    }
    data['EvReturn'] = this.evReturn;
    return data;
  }
}

class EtFatlist {
  List<FaturaItem> item;

  EtFatlist({this.item});

  EtFatlist.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = new List<FaturaItem>();
      try {
        json['item'].forEach((v) {
          item.add(new FaturaItem.fromJson(v));
        });
      } catch (e) {
        item.add(new FaturaItem.fromJson(json["item"]));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FaturaItem {
  String currentId;
  String documentId;
  String date;
  String dueDate;
  String currency;
  String invAmount;
  String currentName;
  String explanation;

  FaturaItem(
      {this.currentId,
      this.documentId,
      this.date,
      this.dueDate,
      this.currency,
      this.invAmount,
      this.currentName,
      this.explanation});

  FaturaItem.fromJson(Map<String, dynamic> json) {
    currentId = json['CurrentId'];
    documentId = json['DocumentId'];
    date = json['Date'];
    dueDate = json['DueDate'];
    currency = json['Currency'];
    invAmount = json['InvAmount'];
    currentName = json['CurrentName'];
    explanation = json['Explanation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CurrentId'] = this.currentId;
    data['DocumentId'] = this.documentId;
    data['Date'] = this.date;
    data['DueDate'] = this.dueDate;
    data['Currency'] = this.currency;
    data['InvAmount'] = this.invAmount;
    data['CurrentName'] = this.currentName;
    data['Explanation'] = this.explanation;
    return data;
  }
}
