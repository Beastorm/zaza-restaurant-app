// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString

class SignUpResponse {
  SignUpResponse({
    this.message,
    this.responseCode,
    this.status,
  });

  String message;
  String responseCode;
  bool status;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        message: json["message"] == null ? null : json["message"],
        responseCode:
            json["response_code"] == null ? null : json["response_code"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "response_code": responseCode == null ? null : responseCode,
        "status": status == null ? null : status,
      };
}
