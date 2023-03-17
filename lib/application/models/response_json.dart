class ResponseJSON {
  ResponseJSON({
    this.statusCode,
    this.statusMessage,
    this.success,
  });
  int? statusCode;
  String? statusMessage;
  bool? success;

  ResponseJSON.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    data['success'] = success;
    return data;
  }
}
