// import 'package:app_testes/app_testes.dart' as app;
import 'package:app_testes/classes/viacep.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'app_testes_test.mocks.dart';

@GenerateMocks([MockViaCep])
void main() {
  test('Return CEP Data', () async {
    MockMockViaCep mockMockViaCep = MockMockViaCep();
    when(mockMockViaCep.retornarCep("01001000")).thenAnswer((realInvocation) => Future.value({
          "cep": "01001-000",
          "logradouro": "Praça da Sé",
          "complemento": "lado ímpar",
          "unidade": "",
          "bairro": "Sé",
          "localidade": "São Paulo",
          "uf": "SP",
          "estado": "São Paulo",
          "regiao": "Sudeste",
          "ibge": "3550308",
          "gia": "1004",
          "ddd": "11",
          "siafi": "7107",
        }));
    var bodyResponse = await mockMockViaCep.retornarCep("01001000");
    expect(bodyResponse["bairro"], equals("Sé"));
    expect(bodyResponse["logradouro"], equals("Praça da Sé"));
  });
}

class MockViaCep extends Mock implements ViaCep {}
