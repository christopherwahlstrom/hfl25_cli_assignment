import '/models/models.dart';

class PersonRepository {
  final List<Person> _persons = [];

    Future<void> add(Person person) async {
      _persons.add(person);
    }

    Future<List<Person>> getAll() async {
      return _persons;
    }

    Future<Person?> getById(String personalNumber) async {
      try {
        return _persons.firstWhere(
          (person) => person.personalNumber == personalNumber,
        );
      } catch (e) {
        return null; 
      }
    }

    Future<void> update(String personalNumber, Person updatedPerson) async {
    var index = _persons.indexWhere((person) => person.personalNumber == personalNumber);
    if (index != -1) {
      _persons[index] = updatedPerson;
    } else {
      throw Exception('Person with personal number $personalNumber not found');
    }
  }

  Future<void> delete(String personalNumber) async {
    var index = _persons.indexWhere((person) => person.personalNumber == personalNumber);
    if (index != -1) {
      _persons.removeAt(index);
    } else {
      throw Exception('Person with personal number $personalNumber not found');
    }
  }
}
