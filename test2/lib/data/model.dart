class Petfood {
  String? pet;
  String? brand;
  String? name;
  String? food_shape;
  String? size;
  List<String>? flavor;
  List<String>? alg;
  List<String>? health;
  String? explain;

  Petfood({
    this.pet,
    this.brand,
    this.name,
    this.food_shape,
    this.size,
    this.flavor,
    this.alg,
    this.health,
    this.explain,
  });

  Map<String, dynamic> toJson() {
    return {
      'pet': this.pet,
      'brand': this.brand,
      'name': this.name,
      'food_shape': this.food_shape,
      'size': this.size,
      'flavor': this.flavor,
      'alg': this.alg,
      'health': this.health,
      'explain': this.explain,
    };
  }

  factory Petfood.fromJson(Map<String, dynamic> json) {
    return Petfood(
      pet: json['name'],
      brand: json['brand'],
      name: json['name'],
      food_shape: json['food_shape'],
      size: json['size'],
      flavor: json['flavor'],
      alg: json['alg'],
      health: json['health'],
      explain: json['explain'],
    );
  }
}
