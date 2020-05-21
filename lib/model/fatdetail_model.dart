class FatDetail {
  EtItem etItem;
  String evReturn;

  FatDetail({this.etItem, this.evReturn});

  FatDetail.fromJson(Map<String, dynamic> json) {
    etItem =
        json['EtItem'] != null ? new EtItem.fromJson(json['EtItem']) : null;
    evReturn = json['EvReturn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.etItem != null) {
      data['EtItem'] = this.etItem.toJson();
    }
    data['EvReturn'] = this.evReturn;
    return data;
  }
}

class EtItem {
  List<Item> item;

  EtItem({this.item});

  EtItem.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = new List<Item>();
      try {
        json['item'].forEach((v) {
          item.add(new Item.fromJson(v));
        });
      } catch (e) {
        item.add(new Item.fromJson(json['item']));
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

class Item {
  String documentHeaderId;
  String documentItem;
  String productCode;
  String productName;
  String quantity;
  String unit;
  String unitPrice;
  String totalPrice;
  String currency;
  String vatRate;
  String vatPrice;

  Item(
      {this.documentHeaderId,
      this.documentItem,
      this.productCode,
      this.productName,
      this.quantity,
      this.unit,
      this.unitPrice,
      this.totalPrice,
      this.currency,
      this.vatRate,
      this.vatPrice});

  Item.fromJson(Map<String, dynamic> json) {
    documentHeaderId = json['DocumentHeaderId'];
    documentItem = json['DocumentItem'];
    productCode = json['ProductCode'];
    productName = json['ProductName'];
    quantity = json['Quantity'];
    unit = json['Unit'];
    unitPrice = json['UnitPrice'];
    totalPrice = json['TotalPrice'];
    currency = json['Currency'];
    vatRate = json['VatRate'];
    vatPrice = json['VatPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DocumentHeaderId'] = this.documentHeaderId;
    data['DocumentItem'] = this.documentItem;
    data['ProductCode'] = this.productCode;
    data['ProductName'] = this.productName;
    data['Quantity'] = this.quantity;
    data['Unit'] = this.unit;
    data['UnitPrice'] = this.unitPrice;
    data['TotalPrice'] = this.totalPrice;
    data['Currency'] = this.currency;
    data['VatRate'] = this.vatRate;
    data['VatPrice'] = this.vatPrice;
    return data;
  }
}
