class Document {
  String? originalName;
  String? location;
  Document({this.location, this.originalName});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      location: json['location'],
      originalName: json['originalName'],
    );
  }
}
