class Success {
  late Object response;
  Success({required this.response});
}

class Failure {
  late Object errorMessage;

  Failure({
    required this.errorMessage,
  });

  Failure.fromJson(Map<String, dynamic> json) {
    errorMessage = json['errorMessage'][0];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorMessage'] = errorMessage;

    return data;
  }
}
