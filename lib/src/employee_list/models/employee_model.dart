class EmployeeModel {
  final int id;
  final String name;
  final String job;
  final String admissionDate;
  final String phone;
  final String image;
  EmployeeModel({
    required this.id,
    required this.name,
    required this.job,
    required this.admissionDate,
    required this.phone,
    required this.image,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      admissionDate: json['admission_date'],
      phone: json['phone'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'job': job,
      'admission_date': admissionDate,
      'phone': phone,
      'image': image,
    };
  }
}
