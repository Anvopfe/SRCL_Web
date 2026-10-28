import React from 'react';

/**
 * Componente Navbar: Encabezado institucional de la aplicación web SRCL.
 * Aplica estándares de diseño corporativo y separación de componentes.
 */
export default function Navbar() {
  return (
    <header style={{ backgroundColor: '#1A3C6E', color: 'white', padding: '1rem 2rem', display: 'flex', justifyContent: 'space-between', alignItems: 'center', boxShadow: '0 2px 4px rgba(0,0,0,0.1)' }}>
      <div style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
        <span style={{ fontSize: '1.8rem' }}>📅</span>
        <h1 style={{ margin: 0, fontSize: '1.4rem', letterSpacing: '0.5px' }}>SRCL - Módulo Web Frontend (React)</h1>
      </div>
      <nav style={{ fontSize: '0.95rem', opacity: 0.9 }}>
        <span>Aprendiz: Andres Cárdenas | ADSO SENA</span>
      </nav>
    </header>
  );
}
