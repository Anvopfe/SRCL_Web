import React from 'react';

/**
 * Componente HeaderBanner: Banner principal dinámico que recibe textos por props.
 */
export default function HeaderBanner({ title, subtitle }) {
  return (
    <div style={{ backgroundColor: '#0D254C', color: 'white', padding: '2.5rem 2rem', textAlign: 'center', marginBottom: '2rem' }}>
      <h2 style={{ margin: '0 0 10px 0', fontSize: '2rem' }}>{title}</h2>
      <p style={{ margin: 0, fontSize: '1.1rem', opacity: 0.85, maxWidth: '700px', marginLeft: 'auto', marginRight: 'auto' }}>
        {subtitle}
      </p>
    </div>
  );
}
