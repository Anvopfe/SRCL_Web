import 'package:flutter/material.dart';
import '../data/global_state.dart';
import '../models/appointment_model.dart';
import '../models/service_model.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  ServiceModel? selectedService;
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  String selectedTime = '09:00 AM';

  final List<String> availableTimes = [
    '08:00 AM',
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '02:00 PM',
    '03:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservar Cita'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '1. Selecciona un Servicio',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A3C6E),
              ),
            ),
            const SizedBox(height: 12),
            Column(
              children: GlobalState.services.map((service) {
                final isSelected = selectedService?.id == service.id;
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF1A3C6E).withOpacity(0.08) : Colors.white,
                    border: Border.all(
                      color: isSelected ? const Color(0xFF1A3C6E) : Colors.grey.shade300,
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.medical_services_rounded, color: Color(0xFF1A3C6E)),
                    title: Text(service.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${service.durationMinutes} min - \$${service.price.toStringAsFixed(0)}'),
                    trailing: Radio<ServiceModel>(
                      value: service,
                      groupValue: selectedService,
                      activeColor: const Color(0xFF1A3C6E),
                      onChanged: (val) {
                        setState(() {
                          selectedService = val;
                        });
                      },
                    ),
                    onTap: () {
                      setState(() {
                        selectedService = service;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Text(
              '2. Fecha de la Cita',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A3C6E),
              ),
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Icon(Icons.calendar_today_rounded, color: Color(0xFF1A3C6E)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '3. Hora Disponible',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A3C6E),
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: availableTimes.map((time) {
                final isSelected = selectedTime == time;
                return ChoiceChip(
                  label: Text(time),
                  selected: isSelected,
                  selectedColor: const Color(0xFF1A3C6E),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                  onSelected: (val) {
                    if (val) {
                      setState(() {
                        selectedTime = time;
                      });
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: selectedService == null
                  ? null
                  : () {
                      final formattedDate = '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}';
                      final newApp = AppointmentModel(
                        id: 'CIT-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
                        serviceName: selectedService!.name,
                        date: formattedDate,
                        time: selectedTime,
                        price: selectedService!.price,
                      );
                      GlobalState.myAppointments.add(newApp);

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green, size: 28),
                              SizedBox(width: 10),
                              Text('Reserva Registrada'),
                            ],
                          ),
                          content: Text(
                            'Tu cita para ${selectedService!.name} ha sido guardada correctamente para el '
                            '${newApp.date} a las ${newApp.time}.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushReplacementNamed(context, '/appointments');
                              },
                              child: const Text('Ver Citas Guardadas'),
                            ),
                          ],
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A3C6E),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 54),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Confirmar Reserva', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
