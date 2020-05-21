class BayiModel {
  ETBAYILIST eTBAYILIST;

  BayiModel({this.eTBAYILIST});

  BayiModel.fromJson(Map<String, dynamic> json) {
    eTBAYILIST = json['ET_BAYILIST'] != null
        ? new ETBAYILIST.fromJson(json['ET_BAYILIST'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.eTBAYILIST != null) {
      data['ET_BAYILIST'] = this.eTBAYILIST.toJson();
    }
    return data;
  }
}

class ETBAYILIST {
  List<Item> item;

  ETBAYILIST({this.item});

  ETBAYILIST.fromJson(Map<String, dynamic> json) {
    try {
      if (json['item'] != null) {
        item = new List<Item>();
        json['item'].forEach((v) {
          item.add(new Item.fromJson(v));
        });
      }
    } catch (e) {
      item.add(new Item.fromJson(json['item']));
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

class Item {
  String eNTEGREID;
  String cURRENTNAME;
  String aDDRESS;
  String cITY;
  String tOWN;
  String tAXOFFICE;
  String tAXNUMBER;
  String mAILADDRESS;
  String pHONENUMBER;
  String bALANCE;
  String uNCLOSEDDEBT;

  Item(
      {this.eNTEGREID,
      this.cURRENTNAME,
      this.aDDRESS,
      this.cITY,
      this.tOWN,
      this.tAXOFFICE,
      this.tAXNUMBER,
      this.mAILADDRESS,
      this.pHONENUMBER,
      this.bALANCE,
      this.uNCLOSEDDEBT});

  Item.fromJson(Map<String, dynamic> json) {
    eNTEGREID = json['ENTEGRE_ID'];
    cURRENTNAME = json['CURRENT_NAME'];
    aDDRESS = json['ADDRESS'];
    cITY = json['CITY'];
    tOWN = json['TOWN'];
    tAXOFFICE = json['TAX_OFFICE'];
    tAXNUMBER = json['TAX_NUMBER'];
    mAILADDRESS = json['MAIL_ADDRESS'];
    pHONENUMBER = json['PHONE_NUMBER'];
    bALANCE = json['BALANCE'];
    uNCLOSEDDEBT = json['UNCLOSED_DEBT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ENTEGRE_ID'] = this.eNTEGREID;
    data['CURRENT_NAME'] = this.cURRENTNAME;
    data['ADDRESS'] = this.aDDRESS;
    data['CITY'] = this.cITY;
    data['TOWN'] = this.tOWN;
    data['TAX_OFFICE'] = this.tAXOFFICE;
    data['TAX_NUMBER'] = this.tAXNUMBER;
    data['MAIL_ADDRESS'] = this.mAILADDRESS;
    data['PHONE_NUMBER'] = this.pHONENUMBER;
    data['BALANCE'] = this.bALANCE;
    data['UNCLOSED_DEBT'] = this.uNCLOSEDDEBT;
    return data;
  }
}
