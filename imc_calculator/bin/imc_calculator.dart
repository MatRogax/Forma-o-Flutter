import 'package:imc_calculator/classes/Person_mode.dart';

void main(List<String> arguments) {
  late String bmiCategory;
  Person person = Person(age: 0, name: "", height: 0.0, weight: 0.0);
  person.getInformationsPerson();
  bmiCategory = person.getBMICategory();
  print("\n Categoria de IMC: $bmiCategory\n");
  person.readInformationsPerson();
}
