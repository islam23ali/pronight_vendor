import 'package:flutter/cupertino.dart';

class AddAdditionalServices {
  double price;
  bool forPerson;
  String titleAr;
  String titleEn;

  // متحكمات النصوص لإدارة النموذج
  TextEditingController priceController;
  TextEditingController titleArController;
  TextEditingController titleEnController;

  // ملاحظة: forPerson عادة ما تكون قيمة boolean فلا تحتاج لمتحكم نصي

  AddAdditionalServices({
    required this.price,
    required this.forPerson,
    required this.titleAr,
    required this.titleEn,
  })  : priceController = TextEditingController(text: price.toString()),
        titleArController = TextEditingController(text: titleAr),
        titleEnController = TextEditingController(text: titleEn);

  // تحديث الحقول من المتحكمات
  void updateFromControllers() {
    price = double.tryParse(priceController.text) ?? 0.0;
    titleAr = titleArController.text;
    titleEn = titleEnController.text;
    // forPerson تبقى كما هي لأنها boolean
  }

  // تحرير الموارد
  void dispose() {
    priceController.dispose();
    titleArController.dispose();
    titleEnController.dispose();
  }

  // التحويل إلى JSON بالهيكل المطلوب
  Map<String, dynamic> toJson() => {
    "additional_services": [
      {
        "price": price,
        "for_person": forPerson,
        "title": {
          "ar": titleAr,
          "en": titleEn,
        }
      }
    ]
  };

  // إنشاء النموذج من JSON
  factory AddAdditionalServices.fromJson(Map<String, dynamic> json) {
    final servicesList = json['additional_services'] as List?;
    if (servicesList == null || servicesList.isEmpty) {
      return AddAdditionalServices(
        price: 0.0,
        forPerson: false,
        titleAr: '',
        titleEn: '',
      );
    }

    final firstService = servicesList.first as Map<String, dynamic>;
    final titleMap = firstService['title'] as Map<String, dynamic>? ?? {};

    return AddAdditionalServices(
      price: (firstService['price'] as num?)?.toDouble() ?? 0.0,
      forPerson: firstService['for_person'] as bool? ?? false,
      titleAr: titleMap['ar']?.toString() ?? '',
      titleEn: titleMap['en']?.toString() ?? '',
    );
  }

  // دالة مساعدة لإنشاء قائمة من الخدمات
  static List<Map<String, dynamic>> servicesListToJson(List<AddAdditionalServices> services) {
    return services.map((service) => {
      "price": service.price,
      "for_person": service.forPerson,
      "title": {
        "ar": service.titleAr,
        "en": service.titleEn,
      }
    }).toList();
  }
}