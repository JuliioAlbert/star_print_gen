# Star_Print_Gendroid

Gendroid Impresoras Star Micronics
GEN
Seleccionado nota original y copia de la nota y reimpresion.

Emulation
SM-T300i 2.4 or later Bluetooth EscPosMobile

- Agregar texto;

```
    String _texto = "        Star Clothing Boutique\n" +
      "             123 Star Road\n" +
      "           City, State 12345\n" +
      "\n" +
      "Date:MM/DD/YYYY          Time:HH:MM PM\n" +
      "--------------------------------------\n" +
      "SALE\n" +
      "SKU            Description       Total\n" +
      "300678566      PLAIN T-SHIRT     10.99\n" +
      "300692003      BLACK DENIM       29.99\n" +
      "300651148      BLUE DENIM        29.99\n" +
      "300642980      STRIPED DRESS     49.99\n" +
      "30063847       BLACK BOOTS       35.99\n" +
      "\n" +
      "Subtotal                        156.95\n" +
      "Tax                               0.00\n" +
      "--------------------------------------\n" +
      "Total                           156.95\n" +
      "--------------------------------------\n" +
      "\n" +
      "Charge\n" +
      "156.95\n" +
      "Visa XXXX-XXXX-XXXX-0123\n" +
      "Refunds and Exchanges\n" +
      "Within 30 days with receipt\n" +
      "And tags attached\n";

  PrintCommands commands = PrintCommands();
  commands.appendBitmapText(text: texto);
  await Impresora.imprimir(commands: commands);

```

- Agregar UnitList

```
  PrintCommands commands = PrintCommands();
  commands.appendBitmapByte(byteData: )
  await Impresora.imprimir(commands: commands);
```

- Agregar Permission manifest de tu proyecto

```
    <uses-permission android:name="android.permission.BLUETOOTH" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
    <uses-permission android:name="android.permission.BLUETOOTH_SCAN" />
```

- Agregar PermissionHandler

```
  final permison = await Permission.location.request();
  final blue = await Permission.bluetoothConnect.request();
  final blueS = await Permission.bluetoothScan.request();
```
