class WorkingHoursModel {
  final int? workingHoursId;
  final String craftmanId;
  final String dayOfWeek; // 'Monday', 'Tuesday', ...
  final String startTime; // '08:00'
  final String endTime; // '16:00'

  WorkingHoursModel({
    this.workingHoursId,
    required this.craftmanId,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
  });

  factory WorkingHoursModel.fromMap(Map<String, dynamic> map) {
    return WorkingHoursModel(
      workingHoursId: map['working_hours_id'],
      craftmanId: map['craftman_id'],
      dayOfWeek: map['day_of_week'],
      startTime: map['start_time'],
      endTime: map['end_time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (workingHoursId != null) 'working_hours_id': workingHoursId,
      'craftman_id': craftmanId,
      'day_of_week': dayOfWeek,
      'start_time': startTime,
      'end_time': endTime,
    };
  }

  static List<String> get columns => [
        'working_hours_id',
        'craftman_id',
        'day_of_week',
        'start_time',
        'end_time',
      ];
}
