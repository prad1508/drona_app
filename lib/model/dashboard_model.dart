
import 'dart:convert';

DashBoardModel dashBoardModelFromJson(String str) => DashBoardModel.fromJson(json.decode(str));

String dashBoardModelToJson(DashBoardModel data) => json.encode(data.toJson());

class DashBoardModel {
  String academyName;
  String monthName;
  String month;
  String year;
  int totalTrainee;
  int totalOnboardedTrainee;
  int feePiad;
  int feeDue;
  int todayAttendancePercentage;
  int monthAttendancePercentage;
  int collection;
  int totalCollection;
  int totalDue;

  DashBoardModel({
    required this.academyName,
    required this.monthName,
    required this.month,
    required this.year,
    required this.totalTrainee,
    required this.totalOnboardedTrainee,
    required this.feePiad,
    required this.feeDue,
    required this.todayAttendancePercentage,
    required this.monthAttendancePercentage,
    required this.collection,
    required this.totalCollection,
    required this.totalDue,
  });

  factory DashBoardModel.fromJson(Map<String, dynamic> json) => DashBoardModel(
    academyName: json["academy_name"],
    monthName: json["month_name"],
    month: json["month"],
    year: json["year"],
    totalTrainee: json["total_trainee"],
    totalOnboardedTrainee: json["total_onboarded_trainee"],
    feePiad: json["fee_piad"],
    feeDue: json["fee_due"],
    todayAttendancePercentage: json["today_attendance_percentage"],
    monthAttendancePercentage: json["month_attendance_percentage"],
    collection: json["collection"],
    totalCollection: json["total_collection"],
    totalDue: json["total_due"],
  );

  Map<String, dynamic> toJson() => {
    "academy_name": academyName,
    "month_name": monthName,
    "month": month,
    "year": year,
    "total_trainee": totalTrainee,
    "total_onboarded_trainee": totalOnboardedTrainee,
    "fee_piad": feePiad,
    "fee_due": feeDue,
    "today_attendance_percentage": todayAttendancePercentage,
    "month_attendance_percentage": monthAttendancePercentage,
    "collection": collection,
    "total_collection": totalCollection,
    "total_due": totalDue,
  };
}
