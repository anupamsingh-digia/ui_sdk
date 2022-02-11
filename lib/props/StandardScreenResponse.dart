class StandardScreenResponse {
  List<UikWidgetResponse>? layout;
  StandardScreenResponse({this.layout});

  StandardScreenResponse.fromJson(Map<String, dynamic> json) {
    if (json['layout'] != null) {
      layout = <UikWidgetResponse>[];
      json['layout'].forEach((v) {
        layout!.add(new UikWidgetResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.layout != null) {
      data['layout'] = this.layout!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class UikWidgetResponse {
  String? type;
  UikWidgetResponse({this.type});
  UikWidgetResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}