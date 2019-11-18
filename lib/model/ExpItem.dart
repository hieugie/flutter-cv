import 'dart:convert';

class ExpItem {
  int id;
  String position;
  String companyName;
  String fromDate;
  String toDate;
  String description;
  List<String> framework;
  String project;

  ExpItem({this.id, this.position, this.companyName, this.fromDate, this.toDate,
      this.description, this.framework, this.project});

  factory ExpItem.fromJson(Map<String, dynamic> data) {
    return ExpItem(
      id: data['id'],
      position: data['position'],
      companyName: data['companyName'],
      fromDate: data['fromDate'],
      toDate: data['toDate'],
      description: data['description'],
      framework: data['framework'].cast<String>(),
      project: data['project'],
    );
  }
}
