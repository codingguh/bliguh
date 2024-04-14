class Province {
  final String provinceId;
  final String province;

  Province({required this.provinceId, required this.province});

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      provinceId: json['province_id'],
      province: json['province'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'province_id': provinceId,
      'province': province,
    };
  }
}

class Cities {
  final String cityId;
  final String city;

  Cities({required this.cityId, required this.city});

  factory Cities.fromJson(Map<String, dynamic> json) {
    return Cities(
      cityId: json['city_id'] ?? '',
      city: json['city_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'city_id': cityId,
      'city': city,
    };
  }
}
