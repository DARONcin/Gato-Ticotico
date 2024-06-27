// lib/config/config.dart

library config.globals;

// Imports de Dart y Flutter
export 'dart:io';
export 'package:flutter/material.dart' hide RefreshCallback;
export 'package:flutter/cupertino.dart';
export 'package:flutter/services.dart';

// Importaciones locales
export '/pantallas/home.dart';
export '/pantallas/controles.dart';
export '/pantallas/app.dart';
export '/widget/celda.dart';

// Definiciones locales
enum estados { vacio, cruz, circulo }

List<estados> tablero = List.filled(9, estados.vacio);
Map<estados, bool> resultado = {estados.cruz: false, estados.circulo:false};


