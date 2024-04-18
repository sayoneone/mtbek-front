class DictionaryModel {
  final int? id;
  final String? name;
  final String? createdAt;
  final String? updatedAt;
  final dynamic value;

  const DictionaryModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.value,
  });

  DictionaryModel copyWith({
    int? id,
    String? name,
    String? createdAt,
    String? updatedAt,
    dynamic value,
  }) {
    return DictionaryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'value': value,
    };
  }

  factory DictionaryModel.fromJson(Map<String, dynamic> json) {
    return DictionaryModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      value: json['value'],
    );
  }
}
