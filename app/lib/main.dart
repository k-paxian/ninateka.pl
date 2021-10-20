import 'package:flutter/material.dart';
import 'package:model.ninateka.pl/model.ninateka.pl.dart'
    show initializeJsonMapper, ninatekaAdapter;
import './widgets/app.dart' show NinatekaApp;

void main() {
  initializeJsonMapper(adapters: [ninatekaAdapter]);
  runApp(const NinatekaApp());
}
