import 'package:imc_calculator/classes/Person_mode.dart';
import 'package:test/test.dart';
// Importa a classe Person

void main() {
  group('Person Tests', () {
    test('Test BMI calculation', () {
      var person = Person(name: 'Matheus', age: 25, weight: 70.0, height: 1.75);
      var bmi = person.calculateBMI();

      expect(bmi, closeTo(22.86, 0.01));
    });

    test('Test BMI category', () {
      var person = Person(name: 'Matheus', age: 25, weight: 70.0, height: 1.75);
      var bmiCategory = person.getBMICategory();

      expect(bmiCategory, equals('saúdavel'));
    });

    test('Test invalid inputs', () {
      var person = Person(name: '', age: 0, weight: 0.0, height: 0.0);

      expect(() => person.getInformationsPerson(), throwsA(isA<Exception>()));
    });
  });
}
