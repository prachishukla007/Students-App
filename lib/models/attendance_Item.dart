import '../enums/attendance_type.dart';

class AttendanceItems {
  final String image;
  final String name;
  late AttendanceType attendanceType;

  AttendanceItems(
      {required this.image, required this.name, required this.attendanceType});
}
