import 'dart:io';
import 'package:cli_assignment/repositories/parking.dart';
import 'package:cli_assignment/repositories/vehicle.dart';
import 'package:cli_assignment/repositories/parkingspace.dart';

void handleParkingMenu(ParkingRepository parkingRepository, VehicleRepository vehicleRepository, ParkingSpaceRepository parkingSpaceRepository) {
  while (true) {
    print('1. Skapa ny Parkering');
    print('2. Visa alla Parkeringar');
    print('3. Uppdatera Parkering');
    print('4. Ta bort Parkering');
    print('5. Tillbaka till huvudmenyn');
    stdout.write('Välj ett alternativ: ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        createParking(parkingRepository, vehicleRepository, parkingSpaceRepository);
        break;
      case '2':
        showAllParkings(parkingRepository);
        break;
      case '3':
        updateParking(parkingRepository);
        break;
      case '4':
        deleteParking(parkingRepository);
        break;
      case '5':
        return;
      default:
        print('Ogiltigt val, försök igen.');
    }
  }
}

void createParking(ParkingRepository parkingRepository, VehicleRepository vehicleRepository, ParkingSpaceRepository parkingSpaceRepository) {
  // Implement the logic to create a new parking
}

void showAllParkings(ParkingRepository parkingRepository) {
  // Implement the logic to show all parkings
}

void updateParking(ParkingRepository parkingRepository) {
  // Implement the logic to update a parking
}

void deleteParking(ParkingRepository parkingRepository) {
  // Implement the logic to delete a parking
}