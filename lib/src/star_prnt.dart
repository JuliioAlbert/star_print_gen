import 'dart:async';
import 'package:flutter/services.dart';
import 'package:star_print_gen/star_print_gen.dart';

/// Class to handle printer communication
class StarPrnt {
  static const MethodChannel _channel =
      const MethodChannel('app.condominios/impresora');

  /// Scan for available printers. Have specify [StarPortType] of the printer
  static Future<List<PortInfo>> portDiscovery(StarPortType portType) async {
    dynamic result =
        await _channel.invokeMethod('portDiscovery', {'type': portType.text});
    if (result is List) {
      return result.map<PortInfo>((port) {
        return PortInfo(port);
      }).toList();
    } else {
      return [];
    }
  }

  /// Check status of printer. Have specify [portName] and [emulation]. Returns [PrinterResponseStatus]. Use [StarMicronicsUtilities] to find suitable emulations.
  static Future<PrinterResponseStatus> getStatus({
    required String portName,
    required String emulation,
  }) async {
    dynamic result = await _channel.invokeMethod('checkStatus', {
      'portName': portName,
      'emulation': emulation,
    });
    return PrinterResponseStatus.fromMap(
      Map<String, dynamic>.from(result),
    );
  }

  /// Sends [PrintCommands] to the printer. Have to specify [portName] and [emulation]. Returns [PrinterResponseStatus]
  static Future<PrinterResponseStatus> sendCommands({
    required String portName,
    required String emulation,
    required PrintCommands printCommands,
    required bool reimpresion,
    required bool copia,
  }) async {
    dynamic result = await _channel.invokeMethod('print', {
      'portName': portName,
      'emulation': emulation,
      'printCommands': printCommands.getCommands(),
      'reimpresion': reimpresion,
      'copia': copia
    });
    return PrinterResponseStatus.fromMap(
      Map<String, dynamic>.from(result),
    );
  }

  /// sends commands to printer to run
  @Deprecated('Use sendCommands instead.')
  static Future<dynamic> print({
    required String portName,
    required String emulation,
    required PrintCommands printCommands,
  }) async {
    dynamic result = await _channel.invokeMethod('print', {
      'portName': portName,
      'emulation': emulation,
      'printCommands': printCommands.getCommands(),
    });
    return result;
  }

  /// Check status of printer
  @Deprecated('Use getStatus instead.')
  static Future<dynamic> checkStatus({
    required String portName,
    required String emulation,
  }) async {
    dynamic result = await _channel.invokeMethod('checkStatus', {
      'portName': portName,
      'emulation': emulation,
    });
    return result;
  }

  // static Future<dynamic> connect({
  //   required String portName,
  //   required String emulation,
  //   bool hasBarcodeReader = false,
  // }) async {
  //   dynamic result = await _channel.invokeMethod('connect', {
  //     'portName': portName,
  //     'emulation': emulation,
  //     'hasBarcodeReader': hasBarcodeReader,
  //   });
  //   return result;
  // }
}
