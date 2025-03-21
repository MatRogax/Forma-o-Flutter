import 'dart:io';

class Person {
  late String name;
  late int age;
  late double weight;
  late double height;

  Person({
    required this.name,
    required this.age,
    required this.weight,
    required this.height,
  });

  void getInformationsPerson() {
    print("Informe seu nome:");
    String? name = stdin.readLineSync();
    print("Informe sua idade:");
    int? age = int.tryParse(stdin.readLineSync() ?? '');
    print("Informe seu peso:");
    double? weight = double.tryParse(stdin.readLineSync() ?? '');
    print("informe sua altura");
    double? height = double.tryParse(stdin.readLineSync() ?? '');

    if (name == null || name.isEmpty) {
      throw Exception('o campo nome correto');
    }
    if (age == null) {
      throw Exception('informe a idade corrreta');
    }
    if (weight == null) {
      Exception('informe o peso correto em (KG)');
    }
    if (height == null) {
      throw Exception('informe sua altura correta');
    }

    this.name = name;
    this.age = age;
    this.weight = weight!;
    this.height = height;
  }

  void readInformationsPerson() {
    print("Name: $name");
    print("Age: $age");
    print("Weight: $weight kg");
    print("Height: $height m");
  }

  double calculateBMI() {
    double bmi = weight / (height * height);
    return bmi;
  }

  String getBMICategory() {
    double bmi = calculateBMI();
    String categoryBmi = '';
    if (bmi < 16) {
      categoryBmi = 'Magrez Grave';
    } else if (bmi > 16 && bmi < 17) {
      categoryBmi = 'Magreza Moderada';
    } else if (bmi > 17 && bmi < 18.5) {
      categoryBmi = 'Magreza Leve';
    } else if (bmi > 18.5 && bmi < 25) {
      categoryBmi = 'saúdavel';
    } else if (bmi > 25 && bmi < 30) {
      categoryBmi = 'Sobrepeso';
    } else if (bmi > 30 && bmi < 35) {
      categoryBmi = 'Obesidade Grau I';
    } else if (bmi > 35 && bmi < 40) {
      categoryBmi = 'Obesidade Grau II(Severa)';
    } else {
      categoryBmi = 'Obesidade Grau III(Mórbida)';
    }
    return categoryBmi;
  }
}
