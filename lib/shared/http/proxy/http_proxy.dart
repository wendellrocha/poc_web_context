import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../utils/utils.dart';

class HttpProxy {
  final Dio dio;

  HttpProxy(this.dio) {
    _configue(dio);
  }

  void _configue(Dio dio) async {
    final String proxyIP = await _checkIP();

    if (proxyIP.isEmpty) return;
    '#Proxy Enabled, #addr: $proxyIP'.log;
    final adapter = IOHttpClientAdapter();
    adapter.onHttpClientCreate = (HttpClient client) {
      client.findProxy = (uri) {
        return 'PROXY $proxyIP:8080';
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.httpClientAdapter = adapter;
  }

  Future<String> _checkIP() async {
    for (var interface in await NetworkInterface.list()) {
      for (var addr in interface.addresses) {
        if (addr.address == '192.168.0.118') {
          return '192.168.0.118';
        }

        if (addr.address == '192.168.2.106') {
          return '192.168.2.104';
        }

        if (addr.address == '192.168.2.104') {
          return '192.168.2.104';
        }

        if (addr.address == '192.168.2.101') {
          return '192.168.2.101';
        }

        /// Android emulator
        if (addr.address.contains('10.0.2')) {
          return '10.0.2.2';
        }

        /// Android emulator
        if (addr.address.contains('192.168.232')) {
          return '10.0.2.2';
        }

        /// WSA
        if (addr.address.startsWith('172')) {
          return '192.168.100.85';
        }
      }
    }

    return '';
  }
}
