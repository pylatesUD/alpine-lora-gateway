# alpine-lora-gateway
Gateway LoRa montado sobre Alpine Linux.

Esta configuración está pensada para ejecutar imágenes de Alpine Linux para usarlos con Gateways [IC880A](https://wireless-solutions.de/products/long-range-radio/ic880a.html) en computadores/servidores como la Raspberry Pi (con un puerto USB 2.0 si la versión del IC880A es USB ó con puertos GPIO para las versiones IC880A SPI).

Se configura en el Gateway un software para redireccionamiento de paquetes LoRa llamado [packet_forwarder](https://github.com/pylatesUD/packet_forwarder) el cual utiliza un protocolo UDP (no orientado a la conexión y no cifrado) junto con un puente MQTT llamado [LoRa Gateway Bridge](https://docs.loraserver.io/lora-gateway-bridge) el cual permite usar TCP+SSL para conectarse con la red LoRaWAN en vez de UDP.

