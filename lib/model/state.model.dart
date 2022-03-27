class India {
  List<Stateinfo> stateinfo;

  India({this.stateinfo});

  India.fromJson(Map<String, dynamic> json) {
    if (json['stateinfo'] != null) {
      stateinfo = new List<Stateinfo>();
      json['stateinfo'].forEach((v) {
        stateinfo.add(new Stateinfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stateinfo != null) {
      data['stateinfo'] = this.stateinfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stateinfo {
  int stateId;
  String stateName;

  Stateinfo({this.stateId, this.stateName});

  Stateinfo.fromJson(Map<String, dynamic> json) {
    stateId = json['stateId'];
    stateName = json['stateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stateId'] = this.stateId;
    data['stateName'] = this.stateName;
    return data;
  }
}
