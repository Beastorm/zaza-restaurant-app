class RestaurantTimingModel {
  RestaurantTimingModel({
    this.message,
    this.responseCode,
    this.status,
    this.data,
  });

  String message;
  String responseCode;
  bool status;
  List<TimingData> data;

  factory RestaurantTimingModel.fromJson(Map<String, dynamic> json) =>
      RestaurantTimingModel(
        message: json["message"] == null ? null : json["message"],
        responseCode:
            json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
        data: json["data"] == null
            ? null
            : List<TimingData>.from(json["data"].map((x) => TimingData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "response_code": responseCode == null ? null : responseCode,
        "status": status == null ? null : status,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TimingData {
  TimingData({
    this.id,
    this.day,
    this.open,
    this.close,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String day;
  String open;
  String close;
  String createdAt;
  String updatedAt;

  factory TimingData.fromJson(Map<String, dynamic> json) => TimingData(
        id: json["id"] == null ? null : json["id"],
        day: json["day"] == null ? null : json["day"],
        open: json["open"] == null ? null : json["open"],
        close: json["close"] == null ? null : json["close"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "day": day == null ? null : day,
        "open": open == null ? null : open,
        "close": close == null ? null : close,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
      };
}
