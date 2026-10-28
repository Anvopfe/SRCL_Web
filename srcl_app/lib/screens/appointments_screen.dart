import 'package:flutter/material.dart';
import '../data/global_state.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    final appointments = GlobalState.myAppointments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Citas Agendadas'),
      ),
      body: appointments.isEmpty
          ? const Center(
              child: Text(
                'No tienes citas agendadas.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final app = appointments[index];
                final isConfirmed = app.status == 'Confirmada';

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              app.serviceName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A3C6E),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: isConfirmed ? Colors.green.shade100 : Colors.red.shade100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                app.status,
                                style: TextStyle(
                                  color: isConfirmed ? Colors.green.shade800 : Colors.red.shade800,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 20),
                        Row(
                          children: [
                            const Icon(Icons.event, size: 20, color: Colors.grey),
                            const SizedBox(width: 8),
                            Text('Fecha: ${app.date}', style: const TextStyle(fontSize: 15)),
                            const SizedBox(width: 16),
                            const Icon(Icons.access_time, size: 20, color: Colors.grey),
                            const SizedBox(width: 8),
                            Text('Hora: ${app.time}', style: const TextStyle(fontSize: 15)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Valor: \$${app.price.toStringAsFixed(0)}',
                          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
                        ),
                        if (isConfirmed) ...[
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                setState(() {
                                  app.status = 'Cancelada';
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Cita cancelada correctamente.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              icon: const Icon(Icons.cancel_outlined, size: 18),
                              label: const Text('Cancelar Cita'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
