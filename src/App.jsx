import React, { useState } from 'react';
import Navbar from './components/Navbar';
import HeaderBanner from './components/HeaderBanner';
import ServiceCard from './components/ServiceCard';
import { servicesData } from './data/servicesData';

/**
 * Componente Principal App: Integra el estado del sistema, el listado estructurado de servicios
 * derivado de los artefactos del software y el manejo de eventos.
 */
export default function App() {
  const [selectedMsg, setSelectedMsg] = useState(null);

  const handleSelectService = (serviceName) => {
    setSelectedMsg(`¡Has seleccionado con éxito el servicio: "${serviceName}" para agendar en SRCL!`);
  };

  return (
    <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column' }}>
      <Navbar />
      
      <HeaderBanner
        title="Catálogo de Servicios y Agendamiento Web"
        subtitle="Módulo frontend desarrollado en React aplicando componentes reutilizables, props y listas estructuradas para el proyecto SRCL."
      />

      <main style={{ maxWidth: '1200px', margin: '0 auto', padding: '0 2rem 3rem 2rem', width: '100%', flex: 1 }}>
        {selectedMsg && (
          <div style={{
            backgroundColor: '#d1e7dd',
            color: '#0f5132',
            padding: '1rem',
            borderRadius: '8px',
            marginBottom: '1.5rem',
            display: 'flex',
            justifyContent: 'space-between',
            alignItems: 'center',
            border: '1px solid #badbcc'
          }}>
            <span>{selectedMsg}</span>
            <button
              onClick={() => setSelectedMsg(null)}
              style={{ background: 'none', border: 'none', fontSize: '1.2rem', cursor: 'pointer', fontWeight: 'bold' }}
            >
              ×
            </button>
          </div>
        )}

        <h3 style={{ color: '#1A3C6E', borderBottom: '2px solid #ddd', paddingBottom: '8px', marginBottom: '1.5rem' }}>
          Listado de Servicios Disponibles (Renderizado Dinámico con Listas y Props)
        </h3>

        {/* Renderizado de lista estructurada utilizando el método .map() en cumplimiento de la guía */}
        <div style={{
          display: 'grid',
          gridTemplateColumns: 'repeat(auto-fit, minmax(260px, 1fr))',
          gap: '1.5rem'
        }}>
          {servicesData.map((service) => (
            <ServiceCard
              key={service.id}
              title={service.title}
              description={service.description}
              duration={service.duration}
              price={service.price}
              category={service.category}
              onSelect={handleSelectService}
            />
          ))}
        </div>
      </main>

      <footer style={{ backgroundColor: '#1A3C6E', color: 'white', textAlign: 'center', padding: '1.5rem', marginTop: 'auto' }}>
        <p style={{ margin: 0, fontSize: '0.9rem' }}>
          Sistema de Reserva de Citas en Línea (SRCL) • Evidencia GA7-220501096-AA4-EV03
        </p>
      </footer>
    </div>
  );
}
