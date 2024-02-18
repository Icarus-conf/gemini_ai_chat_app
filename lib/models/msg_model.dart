import 'dart:convert';

class MsgModel {
  final String role;
  final List<PartModel> parts;

  MsgModel({
    required this.role,
    required this.parts,
  });

  Map<String, dynamic> toMap() {
    return {
      'role': role,
      'parts': parts.map((x) => x.toMap()).toList(),
    };
  }

  factory MsgModel.fromMap(Map<String, dynamic> map) {
    return MsgModel(
      role: map['role'] ?? '',
      parts:
          List<PartModel>.from(map['parts']?.map((x) => PartModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MsgModel.fromJson(String source) =>
      MsgModel.fromMap(json.decode(source));
}

class PartModel {
  final String text;

  PartModel({required this.text});

  Map<String, dynamic> toMap() {
    return {
      'text': text,
    };
  }

  factory PartModel.fromMap(Map<String, dynamic> map) {
    return PartModel(
      text: map['text'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PartModel.fromJson(String source) =>
      PartModel.fromMap(json.decode(source));
}
