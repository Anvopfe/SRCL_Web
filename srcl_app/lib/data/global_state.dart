import '../models/appointment_model.dart';
import '../models/service_model.dart';

class GlobalState {
  static final List<ServiceModel> services = [
    ServiceModel(
      id: '1',
      name: 'Consulta General',
      description: 'Atención médica primaria y valoración integral.',
      durationMinutes: 30,
      price: 50000.0,
    ),
    ServiceModel(
      id: '2',
      name: 'Odontología Especializada',
      description: 'Limpieza profunda, revisión técnica y tratamiento dental.',
      durationMinutes: 45,
      price: 80000.0,
    ),
    ServiceModel(
      id: '3',
      name: 'Consulta Psicológica',
      description: 'Acompañamiento, orientación y salud mental.',
      durationMinutes: 60,
      price: 90000.0,
    ),
  ];

  static final List<AppointmentModel> myAppointments = [
    AppointmentModel(
      id: 'CIT-101',
      serviceName: 'Consulta General',
      date: '2026-11-05',
      time: '09:00 AM',
      price: 50000.0,
      status: 'Confirmada',
    ),
    AppointmentModel(
      id: 'CIT-102',
      serviceName: 'Odontología Especializada',
      date: '2026-11-06',
      time: '10:00 AM',
      price: 80000.0,
      status: 'Confirmada',
    ),
  ];
}
