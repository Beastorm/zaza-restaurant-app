// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
    AddressModel({
        this.results,
        this.status,
    });

    List<Result> results;
    String status;

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
    );

    Map<String, dynamic> toJson() => {
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status == null ? null : status,
    };
}

class Result {
    Result({
        this.addressComponents,
        this.formattedAddress,
        this.geometry,
        this.placeId,
        this.types,
    });

    List<AddressComponent> addressComponents;
    String formattedAddress;
    Geometry geometry;
    String placeId;
    List<String> types;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        addressComponents: json["address_components"] == null ? null : List<AddressComponent>.from(json["address_components"].map((x) => AddressComponent.fromJson(x))),
        formattedAddress: json["formatted_address"] == null ? null : json["formatted_address"],
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        placeId: json["place_id"] == null ? null : json["place_id"],
        types: json["types"] == null ? null : List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "address_components": addressComponents == null ? null : List<dynamic>.from(addressComponents.map((x) => x.toJson())),
        "formatted_address": formattedAddress == null ? null : formattedAddress,
        "geometry": geometry == null ? null : geometry.toJson(),
        "place_id": placeId == null ? null : placeId,
        "types": types == null ? null : List<dynamic>.from(types.map((x) => x)),
    };
}

class AddressComponent {
    AddressComponent({
        this.longName,
        this.shortName,
        this.types,
    });

    String longName;
    String shortName;
    List<String> types;

    factory AddressComponent.fromJson(Map<String, dynamic> json) => AddressComponent(
        longName: json["long_name"] == null ? null : json["long_name"],
        shortName: json["short_name"] == null ? null : json["short_name"],
        types: json["types"] == null ? null : List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "long_name": longName == null ? null : longName,
        "short_name": shortName == null ? null : shortName,
        "types": types == null ? null : List<dynamic>.from(types.map((x) => x)),
    };
}

class Geometry {
    Geometry({
        this.location,
        this.locationType,
        this.viewport,
    });

    Locatione location;
    String locationType;
    Viewport viewport;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: json["location"] == null ? null : Locatione.fromJson(json["location"]),
        locationType: json["location_type"] == null ? null : json["location_type"],
        viewport: json["viewport"] == null ? null : Viewport.fromJson(json["viewport"]),
    );

    Map<String, dynamic> toJson() => {
        "location": location == null ? null : location.toJson(),
        "location_type": locationType == null ? null : locationType,
        "viewport": viewport == null ? null : viewport.toJson(),
    };
}

class Locatione {
    Locatione({
        this.lat,
        this.lng,
    });

    double lat;
    double lng;

    factory Locatione.fromJson(Map<String, dynamic> json) => Locatione(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
    };
}

class Viewport {
    Viewport({
        this.northeast,
        this.southwest,
    });

    Locatione northeast;
    Locatione southwest;

    factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: json["northeast"] == null ? null : Locatione.fromJson(json["northeast"]),
        southwest: json["southwest"] == null ? null : Locatione.fromJson(json["southwest"]),
    );

    Map<String, dynamic> toJson() => {
        "northeast": northeast == null ? null : northeast.toJson(),
        "southwest": southwest == null ? null : southwest.toJson(),
    };
}
