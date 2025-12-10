INSERT INTO autores (nombre, email, bio) VALUES
('Elena García', 'elena.garcia@techpress.com', 'Analista de tendencias en software y desarrollo web.'),
('Marco Solís', 'marco.solis@techpress.com', 'Periodista especializado en videojuegos y eSports.'),
('Sofía Ramos', 'sofia.ramos@techpress.com', 'Redactora de hardware, IA y robótica.'),
('David Romero', 'david.romero@techpress.com', 'Experto en ciberseguridad y blockchain.');


INSERT INTO noticias (titulo, contenido, autor_id) VALUES
('Lanzamiento de la nueva versión de Python 3.12: novedades y mejoras',
 'La última actualización del popular lenguaje de programación incluye optimizaciones significativas en rendimiento y nuevas características sintácticas.',
 1), -- Autor: Elena García

('El nuevo RPG "Cyberpunk Odyssey" domina Steam en su semana de lanzamiento',
 'El videojuego de mundo abierto ha superado las expectativas con más de 5 millones de copias vendidas en solo tres días.',
 2), -- Autor: Marco Solís

('Intel presenta su chip cuántico de 1000 Qubits: un hito en la computación',
 'El avance promete acelerar la investigación en inteligencia artificial y desarrollo de materiales.',
 3), -- Autor: Sofía Ramos

('Ataque masivo de phishing a plataformas de streaming: cómo proteger tu cuenta',
 'Expertos advierten sobre una nueva campaña sofisticada que roba credenciales; se recomienda activar la autenticación de dos factores.',
 4), -- Autor: David Romero

('Epic Games anuncia un torneo global de Fornite con 10 millones en premios',
 'El evento de eSports se celebrará en diciembre y contará con la participación de los mejores jugadores del mundo.',
 2); -- Autor: Marco Solís