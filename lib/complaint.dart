//Complaint Model
class Complaint {
  String? complaintCategory;
  String? complaintType;
  String? complaintDescription;
  List<ComplaintStatus>? complaintStatus;

  Complaint(
      {this.complaintCategory,
      this.complaintType,
      this.complaintDescription,
      this.complaintStatus});

  Complaint.fromJson(Map<String, dynamic> json) {
    complaintCategory = json['complaint_category'];
    complaintType = json['complaint_type'];
    complaintDescription = json['complaint_description'];
    if (json['complaint_status'] != null) {
      complaintStatus = <ComplaintStatus>[];
      json['complaint_status'].forEach((v) {
        complaintStatus!.add(ComplaintStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['complaint_category'] = complaintCategory;
    data['complaint_type'] = complaintType;
    data['complaint_description'] = complaintDescription;
    if (complaintStatus != null) {
      data['complaint_status'] =
          complaintStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ComplaintStatus {
  String? action;
  String? level;
  String? complaintCreatedDateTime;
  String? complaintUpdatedDateTime;

  ComplaintStatus(
      {this.action,
      this.level,
      this.complaintCreatedDateTime,
      this.complaintUpdatedDateTime});

  ComplaintStatus.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    level = json['level'];
    complaintCreatedDateTime = json['complaint_created_date_time'];
    complaintUpdatedDateTime = json['complaint_updated_date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['action'] = action;
    data['level'] = level;
    data['complaint_created_date_time'] = complaintCreatedDateTime;
    data['complaint_updated_date_time'] = complaintUpdatedDateTime;
    return data;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
