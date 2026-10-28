import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SRCL - Menú Principal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF1A3C6E),
              ),
              accountName: Text(
                'Andres Felipe Cárdenas',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              accountEmail: Text('andres@srcl.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Color(0xFF1A3C6E)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard_rounded, color: Color(0xFF1A3C6E)),
              title: const Text('Inicio'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.add_task_rounded, color: Color(0xFF1A3C6E)),
              title: const Text('Reservar Cita'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/booking');
              },
            ),
            ListTile(
              leading: const Icon(Icons.event_note_rounded, color: Color(0xFF1A3C6E)),
              title: const Text('Mis Citas Guardadas'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/appointments');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.red),
              title: const Text('Cerrar Sesión', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '¡Hola, Andres!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A3C6E),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Selecciona una de las opciones disponibles:',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuCard(
                    context,
                    title: 'Reservar Nueva Cita',
                    subtitle: 'Elige servicio, fecha y horario disponible.',
                    icon: Icons.event_available_rounded,
                    color: const Color(0xFF1A3C6E),
                    route: '/booking',
                  ),
                  const SizedBox(height: 16),
                  _buildMenuCard(
                    context,
                    title: 'Mis Citas Agendadas',
                    subtitle: 'Consulta el historial y estado de tus citas.',
                    icon: Icons.bookmarks_rounded,
                    color: const Color(0xFF0D254C),
                    route: '/appointments',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoModalCard(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 32, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(subtitle, style: const TextStyle(fontSize: 14)),
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }

  Widget _buildInfoModalCard(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.info_outline_rounded, size: 32, color: Colors.amber),
        ),
        title: const Text(
          'Información del Proyecto',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: const Text('Ver detalles técnicos y evidencia SENA.'),
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.verified_rounded, size: 52, color: Color(0xFF1A3C6E)),
                  const SizedBox(height: 12),
                  const Text(
                    'SRCL App Móvil v1.0',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Desarrollado en Flutter para la evidencia SENA GA7-220501096-AA3-EV01.\n'
                    'Aprendiz: Andres Felipe Cárdenas Álvarez.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A3C6E),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Cerrar Ventana'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
