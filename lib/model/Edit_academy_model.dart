class EditAcademyListModel {
  final String msg;
  final String academyUid;
  final List<WorkingDay> workingDays;

  EditAcademyListModel({
    required this.msg,
    required this.academyUid,
    required this.workingDays,
  });

  factory EditAcademyListModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> workingDaysJson = json['working_days'] ?? [];
    final List<WorkingDay> workingDays = workingDaysJson
        .map((day) => WorkingDay.fromJson(day))
        .toList();

    return EditAcademyListModel(
      msg: json["msg"] ?? '',
      academyUid: json["academy_uid"] ?? '',
      workingDays: workingDays,
    );
  }

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "academy_uid": academyUid,
    "working_days": workingDays.map((day) => day.toJson()).toList(),
  };
}

class WorkingDay {
  final dynamic code;
  final String dayNameShort;

  WorkingDay({
    required this.code,
    required this.dayNameShort,
  });

  factory WorkingDay.fromJson(Map<String, dynamic> json) {
    return WorkingDay(
      code: json['code'] ?? 0,
      dayNameShort: json['day_name_short'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "code": code,
    "day_name_short": dayNameShort,
  };
}
