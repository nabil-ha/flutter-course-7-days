import 'dart:io';

class Quotation {
  double price;
  String? notes;
  File attachment;
  Quotation({required this.price, this.notes, required this.attachment});
}
