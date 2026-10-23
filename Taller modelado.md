# HelpDesk Pro

URL: https://drawsql.app/teams/john-geiner/diagrams/helpdesk-pro-gestion-de-incidentes-y-tickets-de-soporte

## ¿De qué trata?

La idea es organizar los tickets de soporte de una empresa y conservar su historia: quién reportó el problema, quién lo atendió y cómo se resolvió.

## Tablas principales

Organizaciones, contactos, técnicos, categorías, tickets, asignaciones, comentarios e historial de estados.

## Reglas clave

- Cada ticket tiene un contacto y una categoría. La organización se conoce a través del contacto, sin repetir ese dato.
- Un ticket puede pasar por varios técnicos, pero solo puede tener una asignación activa.
- Cada comentario tiene un único autor: el contacto que reportó o un técnico.
- Los cambios de estado guardan fecha, motivo y responsable técnico o automático. Cerrar un ticket no elimina su historial.

## Diseño propuesto

Las asignaciones conectan tickets y técnicos y permiten registrar los cambios de responsable. El modelo busca llegar a tercera forma normal (3FN), evitando datos repetidos. Las claves y restricciones se complementan con validaciones para impedir asignaciones simultáneas.

## Entrega del taller

Diagrama conceptual y lógico en DrawSQL.





AssetControl

URL: https://drawsql.app/teams/john-geiner/diagrams/assetcontrol-database-schema

## ¿De qué trata?

Este proyecto ayuda a saber qué equipos tiene una empresa, quién los tiene a cargo y qué mantenimientos han recibido.

## Tablas principales

Sedes, departamentos, empleados, tipos de equipo, activos, asignaciones y mantenimientos.

## Reglas clave

* Cada activo tiene un código patrimonial y un serial únicos.
* Un empleado puede tener varios equipos, pero un equipo no puede tener dos custodios al mismo tiempo.
* Las asignaciones guardan entrega, devolución y estado del equipo.
* Un equipo puede estar sin asignar y recibir mantenimiento.
* La sede responsable no representa necesariamente su ubicación actual. Dar de baja un activo no borra su historia.

## Diseño propuesto

La tabla de asignaciones conserva la relación histórica entre empleados y equipos. Los mantenimientos se registran por separado. La organización de datos busca cumplir 3FN; los cruces entre periodos requieren validaciones adicionales a las claves.

## Entrega del taller

Diagrama conceptual y lógico en DrawSQL.



**EASY_PURCHASE**

URL: https://drawsql.app/teams/john-geiner/diagrams/comprafacil-solicitudes-ordenes-de-compra-y-recepciones-parciales

**¿De quétrata?**

La idea esseguir una compra desde la solicitud del empleado hasta la recepción de losproductos, incluso cuando llegan en varias entregas.

Tablasprincipales

Empleados,productos, proveedores, solicitudes y sus detalles, órdenes y sus detalles,recepciones y sus detalles.

**Reglas clave**

* Cadasolicitud incluye al menos un producto con cantidad positiva.

* Solo unasolicitud aprobada puede generar una orden, y puede tener como máximo una.

* Cada ordencorresponde a un proveedor y contiene productos de la solicitud.

* El precioacordado se conserva como dato histórico.

* Lasrecepciones parciales no pueden superar la cantidad pedida. El saldo pendientese calcula, no se escribe manualmente.

**Diseñopropuesto**

Las cabeceras ylos detalles se separan para evitar repeticiones y alcanzar 3FN. Los detallesde recepción apuntan a las líneas de la orden. La suma recibida debeverificarse dentro de una transacción para evitar excedentes simultáneos.

**Entrega deltaller**

Diagramaconceptual y lógico en DrawSQL.



TalentTrack

URL: https://drawsql.app/teams/john-geiner/diagrams/talenttrack-formacion-empresarial-con-asistencia-y-certificacion

## ¿De qué trata?

Este proyecto organiza capacitaciones empresariales y permite llevar el control de inscripciones, asistencia y certificados.

## Tablas principales

Organizaciones, colaboradores, instructores, cursos, ediciones, sesiones, inscripciones, asistencias y certificados.

## Reglas clave

* Un curso puede ofrecerse varias veces. Cada edición tiene un instructor, fechas y cupo.

* Una edición necesita sesiones antes de publicarse.

* Un colaborador solo puede inscribirse una vez en cada edición.

* La asistencia debe corresponder a una sesión de la misma edición de la inscripción.

* Cada inscripción puede tener un certificado, únicamente si toda la asistencia está registrada y alcanza al menos el 80 %.

* Las cancelaciones no eliminan el historial.Diseño propuesto

Las inscripciones resuelven la relación entre colaboradores y ediciones. Separar cursos, ediciones y sesiones evita repetir información y favorece la 3FN. La emisión de certificados necesita validar asistencia y porcentaje, además de las claves.

## Entrega del taller

Diagrama conceptual y lógico en DrawSQL.



SpaceBook

URL: https://drawsql.app/teams/john-geiner/diagrams/spacebook-reservas-de-salas-participantes-y-recursos-corporativos

## ¿De qué trata?

La idea es organizar las reservas de salas y recursos compartidos, evitando que dos reuniones ocupen el mismo espacio o equipo al mismo tiempo.

## Tablas principales

Sedes, salas, empleados, reservas, participantes, recursos móviles, recursos por reserva y bloqueos de salas.

## Reglas clave

* Cada reserva tiene una sala, un organizador y un horario cuyo fin es posterior al inicio.
* Las reservas confirmadas no pueden cruzarse en la misma sala ni compartir un recurso durante horarios superpuestos.
* Las reservas canceladas no bloquean disponibilidad.
* Los bloqueos por limpieza o mantenimiento no pueden coincidir con reservas confirmadas.
* No se repiten participantes ni se supera la capacidad. El organizador cuenta si participa, sin duplicarlo.
* Se conserva el historial de reservas, participantes, recursos y bloqueos.

## Diseño propuesto

Dos tablas intermedias relacionan reservas con participantes y recursos. El modelo busca cumplir 3FN. La capacidad y los conflictos de horario necesitan validaciones transaccionales adicionales a las claves.

## Entrega del taller

Diagrama conceptual y lógico en DrawSQL.
