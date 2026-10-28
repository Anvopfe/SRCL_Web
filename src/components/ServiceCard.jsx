import React from 'react';

/**
 * Componente ServiceCard: Tarjeta modular reutilizable que procesa las propiedades (props)
 * recibidas para renderizar dinámicamente cada servicio del sistema de reservas.
 */
export default function ServiceCard({ title, description, duration, price, category, onSelect }) {
  return (
    <div style={{
      backgroundColor: 'white',
      borderRadius: '12px',
      padding: '1.5rem',
      boxShadow: '0 4px 6px rgba(0,0,0,0.05)',
      display: 'flex',
      flexDirection: 'column',
      justifyContent: 'space-between',
      borderTop: '4px solid #1A3C6E',
      transition: 'transform 0.2s ease',
    }}>
      <div>
        <span style={{
          backgroundColor: '#e6edf5',
          color: '#1A3C6E',
          padding: '4px 10px',
          borderRadius: '20px',
          fontSize: '0.75rem',
          fontWeight: 'bold',
          textTransform: 'uppercase'
        }}>
          {category}
        </span>
        <h3 style={{ margin: '12px 0 8px 0', color: '#1A3C6E', fontSize: '1.25rem' }}>{title}</h3>
        <p style={{ color: '#555', fontSize: '0.95rem', lineHeight: '1.5', margin: '0 0 1rem 0' }}>
          {description}
        </p>
      </div>

      <div>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1rem', borderTop: '1px solid #eee', paddingTop: '10px' }}>
          <span style={{ fontSize: '0.9rem', color: '#666' }}>⏱ {duration}</span>
          <span style={{ fontSize: '1.1rem', fontWeight: 'bold', color: '#1A3C6E' }}>
            ${price.toLocaleString()} COP
          </span>
        </div>
        <button
          onClick={() => onSelect(title)}
          style={{
            width: '100%',
            backgroundColor: '#1A3C6E',
            color: 'white',
            border: 'none',
            padding: '10px',
            borderRadius: '8px',
            fontWeight: 'bold',
            cursor: 'pointer',
            fontSize: '0.95rem'
          }}
          onMouseOver={(e) => e.target.style.backgroundColor = '#0D254C'}
          onMouseOut={(e) => e.target.style.backgroundColor = '#1A3C6E'}
        >
          Seleccionar Servicio
        </button>
      </div>
    </div>
  );
}
