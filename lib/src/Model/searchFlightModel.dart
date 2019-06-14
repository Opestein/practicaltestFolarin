class SearchFlightModelDataFlightSegmentOperating {
  final String carrierCode;
  final String number;

  SearchFlightModelDataFlightSegmentOperating({
    this.carrierCode,
    this.number,
  });

  factory SearchFlightModelDataFlightSegmentOperating.fromJson(
      Map<String, dynamic> parsedJson) {
    return SearchFlightModelDataFlightSegmentOperating(
        carrierCode: parsedJson['carrierCode'], number: parsedJson['number']);
  }
}

class SearchFlightModelDataFlightSegmentAircraft {
  final String code;

  SearchFlightModelDataFlightSegmentAircraft({
    this.code,
  });

  factory SearchFlightModelDataFlightSegmentAircraft.fromJson(
      Map<String, dynamic> parsedJson) {
    return SearchFlightModelDataFlightSegmentAircraft(code: parsedJson['code']);
  }
}

class SearchFlightModelDataFlightSegmentArrival {
  final String iataCode;
  final String terminal;
  final String at;

  SearchFlightModelDataFlightSegmentArrival(
      {this.iataCode, this.terminal, this.at});

  factory SearchFlightModelDataFlightSegmentArrival.fromJson(
      Map<String, dynamic> parsedJson) {
    return SearchFlightModelDataFlightSegmentArrival(
        iataCode: parsedJson['iataCode'],
        terminal: parsedJson['terminal'],
        at: parsedJson['at']);
  }
}

class SearchFlightModelDataFlightSegmentDeparture {
  final String iataCode;
  final String terminal;
  final String at;

  SearchFlightModelDataFlightSegmentDeparture(
      {this.iataCode, this.terminal, this.at});

  factory SearchFlightModelDataFlightSegmentDeparture.fromJson(
      Map<String, dynamic> parsedJson) {
    return SearchFlightModelDataFlightSegmentDeparture(
        iataCode: parsedJson['iataCode'],
        terminal: parsedJson['terminal'],
        at: parsedJson['at']);
  }
}

class SearchFlightModelDataFlightSegment {
  final SearchFlightModelDataFlightSegmentDeparture
      searchFlightModelDataFlightSegmentDeparture;
  final SearchFlightModelDataFlightSegmentArrival
      searchFlightModelDataFlightSegmentArrival;
  final String carrierCode;
  final String number;
  final SearchFlightModelDataFlightSegmentAircraft
      searchFlightModelDataFlightSegmentAircraft;
  final SearchFlightModelDataFlightSegmentOperating
      searchFlightModelDataFlightSegmentOperating;
  final String duration;

  SearchFlightModelDataFlightSegment(
      {this.searchFlightModelDataFlightSegmentDeparture,
      this.searchFlightModelDataFlightSegmentArrival,
      this.carrierCode,
      this.number,
      this.searchFlightModelDataFlightSegmentAircraft,
      this.searchFlightModelDataFlightSegmentOperating,
      this.duration});

  factory SearchFlightModelDataFlightSegment.fromJson(
      Map<String, dynamic> parsedJson) {
    return SearchFlightModelDataFlightSegment(
        searchFlightModelDataFlightSegmentDeparture:
            SearchFlightModelDataFlightSegmentDeparture.fromJson(
                parsedJson['departure']),
        searchFlightModelDataFlightSegmentArrival:
            SearchFlightModelDataFlightSegmentArrival.fromJson(
                parsedJson['arrival']),
        carrierCode: parsedJson['carrierCode'],
        number: parsedJson['number'],
        searchFlightModelDataFlightSegmentAircraft:
            SearchFlightModelDataFlightSegmentAircraft.fromJson(
                parsedJson['aircraft']),
        searchFlightModelDataFlightSegmentOperating:
            SearchFlightModelDataFlightSegmentOperating.fromJson(
                parsedJson['operating']),
        duration: parsedJson['duration']);
  }
}

class SearchFlightModelDatapricingDetailPerAdult {
  final String travelClass;
  final String fareClass;
  final int availability;
  final String fareBasis;

  SearchFlightModelDatapricingDetailPerAdult({
    this.travelClass,
    this.fareClass,
    this.availability,
    this.fareBasis,
  });

  factory SearchFlightModelDatapricingDetailPerAdult.fromJson(
      Map<String, dynamic> parsedJson) {
    return SearchFlightModelDatapricingDetailPerAdult(
        travelClass: parsedJson['travelClass'],
        fareClass: parsedJson['fareClass'],
        availability: parsedJson['availability'],
        fareBasis: parsedJson['fareBasis']);
  }
}

class SearchFlightModelDataSegments {
  final SearchFlightModelDataFlightSegment searchFlightModelDataFlightSegment;
  final SearchFlightModelDatapricingDetailPerAdult
      searchFlightModelDatapricingDetailPerAdult;

  SearchFlightModelDataSegments(
      {this.searchFlightModelDataFlightSegment,
      this.searchFlightModelDatapricingDetailPerAdult});

  factory SearchFlightModelDataSegments.fromJson(
      Map<String, dynamic> parsedJson) {
//    var list = parsedJson['flightSegment'] as List;
//    List<SearchFlightModelDataFlightSegment> searchFlightModelDataOfferItems =
//        list
//            .map((f) => SearchFlightModelDataFlightSegment.fromJson(f))
//            .toList();

    return SearchFlightModelDataSegments(
        searchFlightModelDataFlightSegment:
            SearchFlightModelDataFlightSegment.fromJson(
                parsedJson['flightSegment']),
        searchFlightModelDatapricingDetailPerAdult:
            SearchFlightModelDatapricingDetailPerAdult.fromJson(
                parsedJson['pricingDetailPerAdult']));
  }
}

class SearchFlightModelDataServices {
  final List<SearchFlightModelDataSegments> searchFlightModelDataSegments;

  SearchFlightModelDataServices({this.searchFlightModelDataSegments});

  factory SearchFlightModelDataServices.fromJson(
      Map<String, dynamic> parsedJson) {
    var list = parsedJson['segments'] as List;
    List<SearchFlightModelDataSegments> searchFlightModelDataSegments =
        list.map((f) => SearchFlightModelDataSegments.fromJson(f)).toList();

    return SearchFlightModelDataServices(
        searchFlightModelDataSegments: searchFlightModelDataSegments);
  }
}

class SearchFlightModelDataPrice {
  final String total;
  final String totalTaxes;

  SearchFlightModelDataPrice({
    this.total,
    this.totalTaxes,
  });

  factory SearchFlightModelDataPrice.fromJson(Map<String, dynamic> parsedJson) {
    return SearchFlightModelDataPrice(
        total: parsedJson['total'], totalTaxes: parsedJson['totalTaxes']);
  }
}

class SearchFlightModelDataPricePerAdult {
  final String total;
  final String totalTaxes;

  SearchFlightModelDataPricePerAdult({
    this.total,
    this.totalTaxes,
  });

  factory SearchFlightModelDataPricePerAdult.fromJson(
      Map<String, dynamic> parsedJson) {
    return SearchFlightModelDataPricePerAdult(
        total: parsedJson['total'], totalTaxes: parsedJson['totalTaxes']);
  }
}

class SearchFlightModelDataOfferItems {
  final List<SearchFlightModelDataServices> searchFlightModelDataServices;
  final SearchFlightModelDataPrice searchFlightModelDataPrice;
  final SearchFlightModelDataPricePerAdult searchFlightModelDataPricePerAdult;

  SearchFlightModelDataOfferItems(
      {this.searchFlightModelDataPrice,
      this.searchFlightModelDataPricePerAdult,
      this.searchFlightModelDataServices});

  factory SearchFlightModelDataOfferItems.fromJson(
      Map<String, dynamic> parsedJson) {
    var list = parsedJson['services'] as List;
    List<SearchFlightModelDataServices> searchFlightModelDataServices =
        list.map((f) => SearchFlightModelDataServices.fromJson(f)).toList();

    return SearchFlightModelDataOfferItems(
        searchFlightModelDataServices: searchFlightModelDataServices,
        searchFlightModelDataPrice:
            SearchFlightModelDataPrice.fromJson(parsedJson['price']),
        searchFlightModelDataPricePerAdult:
            SearchFlightModelDataPricePerAdult.fromJson(
                parsedJson['pricePerAdult']));
  }
}

class SearchFlightModelData {
  final String type;
  final String id;
  final List<SearchFlightModelDataOfferItems> searchFlightModelDataOfferItems;

  SearchFlightModelData(
      {this.type, this.id, this.searchFlightModelDataOfferItems});

  factory SearchFlightModelData.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['offerItems'] as List;
    List<SearchFlightModelDataOfferItems> searchFlightModelDataOfferItems =
        list.map((f) => SearchFlightModelDataOfferItems.fromJson(f)).toList();

    return SearchFlightModelData(
        type: parsedJson['type'],
        id: parsedJson['id'],
        searchFlightModelDataOfferItems: searchFlightModelDataOfferItems);
  }
}

class SearchFlightModelDictionaryCarriers {
  final String AA;
  final String KL;
  final String UX;
  final String AF;
  final String DY;
  final String AY;
  final String DL;
  final String IB;
  final String SN;
  final String LH;
  final String UA;
  final String BA;

  SearchFlightModelDictionaryCarriers({
    this.AA,
    this.KL,
    this.UX,
    this.AF,
    this.DY,
    this.AY,
    this.DL,
    this.IB,
    this.SN,
    this.LH,
    this.UA,
    this.BA,
  });

  factory SearchFlightModelDictionaryCarriers.fromJson(
      Map<String, dynamic> parsedJson) {
    return SearchFlightModelDictionaryCarriers(
        AA: parsedJson['AA'],
        KL: parsedJson['KL'],
        UX: parsedJson['UX'],
        AF: parsedJson['AF'],
        DY: parsedJson['DY'],
        AY: parsedJson['AY'],
        DL: parsedJson['DL'],
        IB: parsedJson['IB'],
        SN: parsedJson['SN'],
        LH: parsedJson['LH'],
        UA: parsedJson['UA'],
        BA: parsedJson['BA']);
  }
}

class SearchFlightModelDictionary {
  final SearchFlightModelDictionaryCarriers searchFlightModelDictionaryCarriers;

  SearchFlightModelDictionary({
    this.searchFlightModelDictionaryCarriers,
  });

  factory SearchFlightModelDictionary.fromJson(
      Map<String, dynamic> parsedJson) {
    return SearchFlightModelDictionary(
        searchFlightModelDictionaryCarriers:
            SearchFlightModelDictionaryCarriers.fromJson(
                parsedJson['carriers']));
  }
}

class SearchFlightModel {
  final List<SearchFlightModelData> searchFlightModelData;
  final SearchFlightModelDictionary searchFlightModelDictionary;

  SearchFlightModel(
      {this.searchFlightModelData, this.searchFlightModelDictionary});

  factory SearchFlightModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['data'] as List;
    List<SearchFlightModelData> searchFlightModelData =
        list.map((f) => SearchFlightModelData.fromJson(f)).toList();

    return SearchFlightModel(
        searchFlightModelData: searchFlightModelData,
        searchFlightModelDictionary:
            SearchFlightModelDictionary.fromJson(parsedJson['dictionaries']));
  }
}
