class AppointmentModel {
  final String id;
  final String serviceName;
  final String date;
  final String time;
  final double price;
  String status; // 'Confirmada', 'Cancelada'

  AppointmentModel({
    required this.id,
    required this.serviceName,
    required this.date,
    required this.time,
    required this.price,
    this.status = 'Confirmada',
  });
}
