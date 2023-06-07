class CreateSessionModel {
  String? batchUid;
  String? provide_online_sessions;
  String? online_session_url;
  String? batch_timing_from;
  String? batch_timing_to;
  String? sdate;

  CreateSessionModel(
      {this.batchUid,
        this.provide_online_sessions,
        this.online_session_url,
        this.batch_timing_from,
        this.batch_timing_to,
        this.sdate,
       });

  CreateSessionModel.fromJson(Map<String, dynamic> json) {
    batchUid = json['batchUid'];
    provide_online_sessions = json['provide_online_sessions'];
    online_session_url = json['online_session_url'];
    batch_timing_from = json['batch_timing_from'];
    batch_timing_to = json['batch_timing_to'];
    sdate = json['sdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batchUid'] = this.batchUid;
    data['provide_online_sessions'] = this.provide_online_sessions;
    data['online_session_url'] = this.online_session_url;
    data['batch_timing_from'] = this.batch_timing_from;
    data['batch_timing_to'] = this.batch_timing_to;
    data['sdate'] = this.sdate;

    return data;
  }
}
