import 'dart:io';
import 'package:cli_assignment/models/models.dart';
import 'package:cli_assignment/repositories/person.dart';

void handlePersonMenu(PersonRepository personRepository) {
  while (true) {
    print('1. Skapa ny Person');
    print('2. Visa alla Personer');
    print('3. Uppdatera Person');
    print('4. Ta bort Person');
    print('5. Tillbaka till huvudmenyn');
    stdout.write('Välj ett alternativ: ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        createPerson(personRepository);
        break;
      case '2':
        showAllPersons(personRepository);
        break;
      case '3':
        updatePerson(personRepository);
        break;
      case '4':
        deletePerson(personRepository);
        break;
      case '5':
        return;
      default:
        print('Ogiltigt val, försök igen.');
    }
  }
}


void createPerson(PersonRepository personRepository) {
  stdout.write('Ange namn: ');
  var name = stdin.readLineSync();
  stdout.write('Ange personnummer: ');
  var personalNumber = stdin.readLineSync();

  if (name != null && personalNumber != null) {
    var person = Person(name: name, personalNumber: personalNumber);
    personRepository.add(person);
    print('Person skapad.');
  } else {
    print('Ogiltig input.');
  }
}

void showAllPersons(PersonRepository personRepository) async {
  var persons = await personRepository.getAll();
  if (persons.isEmpty) {
    print('Inga personer funna.');
  } else {
    for (var person in persons) {
      print('Namn: ${person.name}, Personnummer: ${person.personalNumber}');
    }
  }
}

void updatePerson(PersonRepository personRepository) async {
  stdout.write('Ange personnummer för personen som ska uppdateras: ');
  var personalNumber = stdin.readLineSync();
  var person = await personRepository.getById(personalNumber!);

  if (person != null) {
    stdout.write('Ange nytt namn: ');
    var newName = stdin.readLineSync();
    if (newName != null) {
      person.name = newName;
      personRepository.update(personalNumber, person);
      print('Person uppdaterad.');
    } else {
      print('Ogiltig input.');
    }
  } else {
    print('Person ej funnen.');
  }
}

void deletePerson(PersonRepository personRepository) async {
  stdout.write('Ange personnummer för personen som ska tas bort: ');
  var personalNumber = stdin.readLineSync();
  await personRepository.delete(personalNumber!);
  print('Person borttagen.');
}