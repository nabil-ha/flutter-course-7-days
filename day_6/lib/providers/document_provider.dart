import 'dart:io';
import 'package:day_6/models/document.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DocumentProvider extends ChangeNotifier {
  List<Document?> _documents = [];
  List<Document?> get documents => _documents;
  bool _isUploading = false;
  bool get isUploading => _isUploading;

  pickAndUploadDocuments() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      _isUploading = true;
      notifyListeners();
      for (File file in files) {
        final dio = Dio();
        final response = await dio.post(
          "https://api.escuelajs.co/api/v1/files/upload",
          data: FormData.fromMap({
            "file": MultipartFile.fromFileSync(file.path),
          }),
        );
        print(response.data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Document document = Document.fromJson(response.data);
          _documents.add(document);
        }
      }
      _isUploading = false;
      notifyListeners();
    }
  }

  deleteDocument(String location) {
    _documents.removeWhere((element) => element!.location == location);
    notifyListeners();
  }

  // pickAndAddDocument() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //     _isUploading = true;
  //     uploadDocument(Document(isUploaded: false, file: file));
  //   }
  //   notifyListeners();
  // }

  // uploadDocument(Document document) async {
  //   final dio = Dio();
  //   final response = await dio.post(
  //     "https://api.escuelajs.co/api/v1/files/upload",
  //     data: FormData.fromMap({
  //       "file": MultipartFile.fromFileSync(document.file!.path),
  //     }),
  //   );
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     _isUploading = false;
  //     response.data['isUploaded'] = true;
  //     Document document = Document.fromJson(response.data);
  //     documents.add(document);
  //   }
  //   notifyListeners();
  // }
}
