import 'dart:core';
import 'dart:io';

void main(){
  String x= "why";
  stdout.writeln("tell me why ?");
  String? y = stdin.readLineSync();

  print(x + ', ' + y!);
}

