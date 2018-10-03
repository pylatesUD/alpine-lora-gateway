# alpine-lora-gateway
Gateway LoRa montado sobre Alpine Linux.

Esta configuración está pensada para ejecutar imágenes de Alpine Linux para usarlos con Gateways [IC880A](https://wireless-solutions.de/products/long-range-radio/ic880a.html) en computadores/servidores como la Raspberry Pi (con un puerto USB 2.0 si la versión del IC880A es USB ó con puertos GPIO para las versiones IC880A SPI).

Se configura en el Gateway un software para redireccionamiento de paquetes LoRa llamado [packet_forwarder](https://github.com/pylatesUD/packet_forwarder) el cual utiliza un protocolo UDP (no orientado a la conexión y no cifrado) junto con un puente MQTT llamado [LoRa Gateway Bridge](https://docs.loraserver.io/lora-gateway-bridge) el cual permite usar TCP+SSL para conectarse con la red LoRaWAN en vez de UDP.


## Configuración

### Instalación de Alpine Linux
Seguir las indicaciones de [Instalación en Raspberry PI](https://wiki.alpinelinux.org/wiki/Raspberry_Pi), teniendo en cuenta que se debe dejar la partición FAT32 de al menos 500MB; también es recomendable usar el resto de espacio en la SD card como una partición ext4 para espacio de cache, repos, etc.

### Configuracion de Alpine Linux
Una vez instalado Alpine Linux, se deben hacer estos procesos:
1. Configurar/colocar los archivos auxiliares de configuración externa en la partición FAT32 (/media/mmcblk0p1).
2. Crear un archivo <nombre>.apkovl.tar.gz personalizado basado en la plantilla y los scripts asociados
3. subir el archivo <nombre>.apkovl.tar.gz a la segunda particion (ext4)  cuyo nombre sería /media/mmcblk0p2 para Alpine Linux.
4. Configurar el proxy (si lo hay) con el comando `$ setup-proxy` y luego importarlo en las variables de entorno locales `$ source /etc/profile.d/proxy.sh`
5. ejecutar `$ setup-apkcache` para crear el cache local de paquetes de Alpine Linux teniendo en cuenta que en general, el cache quedará en /media/mmcblk0p2/cache
6. Sincronizar el cache local con los repos mediante el comando `$ apk cache -v sync`.

Los archivos <nombre>.apkovl.tar.gz son archivos de [*backup local de configuración*](https://wiki.alpinelinux.org/wiki/Alpine_local_backup) para que se usan para hacer mas reproducible la configuración de los gateways.


