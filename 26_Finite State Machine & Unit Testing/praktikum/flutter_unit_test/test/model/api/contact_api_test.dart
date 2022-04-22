import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/models/contact_model.dart';
import 'package:flutter_unit_test/models/food_model.dart';
import 'package:flutter_unit_test/services/service_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'contact_api_test.mocks.dart';

@GenerateMocks([ServiceProvider])
void main() {
  group('Api', () {
    ServiceProvider service = MockServiceProvider();
    test('get all contact returns data', () async {
      when(service.fetchAllContact()).thenAnswer(
        (_) async => <ContactModel>[
          ContactModel(id: 1, name: 'opang', phone: '1'),
        ],
      );
      var contacts = await service.fetchAllContact();
      expect(contacts.isNotEmpty, true);
    });

    test('get all contact returns data', () async {
      when(service.fetchAllFood()).thenAnswer(
        (_) async => <FoodModel>[
          FoodModel(id: 1, name: 'Soto ayam'),
        ],
      );
      var foods = await service.fetchAllFood();
      expect(foods.isNotEmpty, true);
    });
  });
}
