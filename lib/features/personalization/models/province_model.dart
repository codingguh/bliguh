//binder bytes
class Province {
  final String provinceId;
  final String province;

  Province({required this.provinceId, required this.province});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      provinceId: json['id'],
      province: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'province_id': provinceId,
      'province': province,
    };
  }
}

class Regencies {
  final String cityId;
  final String city;

  Regencies({required this.cityId, required this.city});

  factory Regencies.fromJson(Map<String, dynamic> json) {
    return Regencies(
      cityId: json['id'] ?? '',
      city: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': cityId,
      'name': city,
    };
  }
}

class Districts {
  final String id;
  final String name;

  Districts({required this.id, required this.name});

  factory Districts.fromJson(Map<String, dynamic> json) {
    return Districts(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

//RAJA ONGKIR
// class Province {
//   final String provinceId;
//   final String province;

//   Province({required this.provinceId, required this.province});

//   factory Province.fromJson(Map<String, dynamic> json) {
//     return Province(
//       provinceId: json['province_id'],
//       province: json['province'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'province_id': provinceId,
//       'province': province,
//     };
//   }
// }

// class Cities {
//   final String cityId;
//   final String city;

//   Cities({required this.cityId, required this.city});

//   factory Cities.fromJson(Map<String, dynamic> json) {
//     return Cities(
//       cityId: json['city_id'] ?? '',
//       city: json['city_name'] ?? '',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'city_id': cityId,
//       'city': city,
//     };
//   }
}
