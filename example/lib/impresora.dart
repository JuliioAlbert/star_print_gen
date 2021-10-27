import 'package:star_print_gen/star_print_gen.dart';

abstract class Impresora {
  static Future<void> imprimir(
      {bool reimpresion = false,
      bool asistencia = true,
      PrintCommands commands}) async {
    List<PortInfo> list = await StarPrnt.portDiscovery(StarPortType.Bluetooth);
    for (PortInfo port in list) {
      await StarPrnt.getStatus(
        portName: port.portName.toString(),
        emulation: 'EscPosMobile',
      );

      await StarPrnt.sendCommands(
          portName: port.portName,
          emulation: 'EscPosMobile',
          printCommands: commands,
          reimpresion: reimpresion,
          asistencia: asistencia);
    }
  }
}
