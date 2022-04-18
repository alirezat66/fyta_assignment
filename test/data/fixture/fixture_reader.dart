import 'dart:io';

String fixture(String name) => File('test/data/fixture/$name').readAsStringSync();
