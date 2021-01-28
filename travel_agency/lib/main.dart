import 'dart:io';
import 'package:travel_agency/reservation.dart';

void main() {
  Reservation reservation=new Reservation();
  int num=1;
  do{
    print("\n\t\t\t\t----------------------------------------------------------------------------------------------------------------");
    print("\n\t\t\t\t1-Add Trip\t\t\t 2-Edit Trip\t\t 3-Delete Trip\t\t\t\t 4-Search By Price\t\t\t 5-Show Trips\n");
    print("\t\t\t\t6-Reverse\t\t\t 7-Discount\t\t\t 8-Show Latest Trips\t\t 9-Display passenger\t\t 10-Exit");
    print("\n\t\t\t\t----------------------------------------------------------------------------------------------------------------");
    print("\n\t\tChoose an option :");
    int id_method = int.parse(stdin.readLineSync());
    switch (id_method){
      case 1:reservation.addTrip(); break;
      case 2: reservation.editTrip(); break;
      case 3:reservation.deleteTrip();break;
      case 4:reservation.searchTrip();break;
      case 5:reservation.showTrips();break;
      case 6:reservation.reverseTrip();break;
      case 7:reservation.discount();break;
      case 8:reservation.latestTrips();break;
      case 9:reservation.displayPassenger();break;
      case 10: num=0;break;
      default : print("Enter number from 1 to 10");
    }
  }while(num == 1);
}


