# Desafio para desarrollador Backend

Versiones:
    - ruby: 3.2.3 (2024-01-18 revision 52bb2ac0a6)
    - rails: 8.0.0

Campos para guardar los datos de entrega

    - trip_id: es necesario para poder asociarlo a un viaje, en caso de que no debe ser 0
    - sender: es tener el conocimiento de quien fue el que envio el paquete y validarlo a la hora de entrega
    - receiver: a quien le debo de entregar o quien es el propietario
    - address: debe de tener un lugar de entrega
    - size y weight: es para tener conocimiento de las caracteristicas de que es lo que se va entregar
    - departure_time: saber en que momento saldra al entrega, para realizar estimaciones de tiempo