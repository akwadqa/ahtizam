class PaymentMethod {
  final String icon;
  final String title;
  final String id;

  const PaymentMethod({
    required this.icon,
    required this.title,
    required this.id,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      icon: json['icon'] as String,
      title: json['title'] as String,
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon,
      'title': title,
      'id': id,
    };
  }
} 