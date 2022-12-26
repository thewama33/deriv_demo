class ActiveSymbolsModel {
  List<ActiveSymbols>? activeSymbols;
  EchoReq? echoReq;
  String? msgType;
  int? reqId;

  ActiveSymbolsModel(
      {this.activeSymbols, this.echoReq, this.msgType, this.reqId});

  ActiveSymbolsModel.fromJson(Map<String, dynamic> json) {
    if (json['active_symbols'] != null) {
      activeSymbols = <ActiveSymbols>[];
      json['active_symbols'].forEach((v) {
        activeSymbols!.add( ActiveSymbols.fromJson(v));
      });
    }
    echoReq = json['echo_req'] != null
        ?  EchoReq.fromJson(json['echo_req'])
        : null;
    msgType = json['msg_type'];
    reqId = json['req_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.activeSymbols != null) {
      data['active_symbols'] =
          this.activeSymbols!.map((v) => v.toJson()).toList();
    }
    if (this.echoReq != null) {
      data['echo_req'] = this.echoReq!.toJson();
    }
    data['msg_type'] = this.msgType;
    data['req_id'] = this.reqId;
    return data;
  }
}

class ActiveSymbols {
  int? allowForwardStarting;
  String? displayName;
  int? displayOrder;
  int? exchangeIsOpen;
  int? isTradingSuspended;
  String? market;
  String? marketDisplayName;
  double? pip;
  String? subgroup;
  String? subgroupDisplayName;
  String? submarket;
  String? submarketDisplayName;
  String? symbol;
  String? symbolType;

  ActiveSymbols(
      {this.allowForwardStarting,
      this.displayName,
      this.displayOrder,
      this.exchangeIsOpen,
      this.isTradingSuspended,
      this.market,
      this.marketDisplayName,
      this.pip,
      this.subgroup,
      this.subgroupDisplayName,
      this.submarket,
      this.submarketDisplayName,
      this.symbol,
      this.symbolType});

  ActiveSymbols.fromJson(Map<String, dynamic> json) {
    allowForwardStarting = json['allow_forward_starting'];
    displayName = json['display_name'];
    displayOrder = json['display_order'];
    exchangeIsOpen = json['exchange_is_open'];
    isTradingSuspended = json['is_trading_suspended'];
    market = json['market'];
    marketDisplayName = json['market_display_name'];
    pip = json['pip'];
    subgroup = json['subgroup'];
    subgroupDisplayName = json['subgroup_display_name'];
    submarket = json['submarket'];
    submarketDisplayName = json['submarket_display_name'];
    symbol = json['symbol'];
    symbolType = json['symbol_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['allow_forward_starting'] = this.allowForwardStarting;
    data['display_name'] = this.displayName;
    data['display_order'] = this.displayOrder;
    data['exchange_is_open'] = this.exchangeIsOpen;
    data['is_trading_suspended'] = this.isTradingSuspended;
    data['market'] = this.market;
    data['market_display_name'] = this.marketDisplayName;
    data['pip'] = this.pip;
    data['subgroup'] = this.subgroup;
    data['subgroup_display_name'] = this.subgroupDisplayName;
    data['submarket'] = this.submarket;
    data['submarket_display_name'] = this.submarketDisplayName;
    data['symbol'] = this.symbol;
    data['symbol_type'] = this.symbolType;
    return data;
  }
}

class EchoReq {
  String? activeSymbols;
  String? productType;
  int? reqId;

  EchoReq({this.activeSymbols, this.productType, this.reqId});

  EchoReq.fromJson(Map<String, dynamic> json) {
    activeSymbols = json['active_symbols'];
    productType = json['product_type'];
    reqId = json['req_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['active_symbols'] = this.activeSymbols;
    data['product_type'] = this.productType;
    data['req_id'] = this.reqId;
    return data;
  }
}