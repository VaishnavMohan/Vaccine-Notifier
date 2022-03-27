class District {
  List<Distinfo> distinfo;

  District({this.distinfo});

  District.fromJson(Map<String, dynamic> json) {
    if (json['Distinfo'] != null) {
      distinfo = new List<Distinfo>();
      json['Distinfo'].forEach((v) {
        distinfo.add(new Distinfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.distinfo != null) {
      data['Distinfo'] = this.distinfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Distinfo {
  int districtId;
  int stateId;
  String districtName;

  Distinfo({this.districtId, this.stateId, this.districtName});

  Distinfo.fromJson(Map<String, dynamic> json) {
    districtId = json['districtId'];
    stateId = json['stateId'];
    districtName = json['districtName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['districtId'] = this.districtId;
    data['stateId'] = this.stateId;
    data['districtName'] = this.districtName;
    return data;
  }
}
