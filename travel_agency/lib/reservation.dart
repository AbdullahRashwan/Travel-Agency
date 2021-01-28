import 'dart:io';

import 'package:travel_agency/trip.dart';

class Reservation {
  List<Trip> trip = []; // list of all trip
  List<int> available_number=[];// A list store number of passengers available and updated after each reservation
  void addTrip() {
    print("\n\ID =>");
    int id = int.parse(stdin.readLineSync());
    print("Location =>");
    String location = stdin.readLineSync();
    print("Passenger limit =>");
    int passenger_limit = int.parse(stdin.readLineSync());
    print("Date in format (23/1/2021) =>");
    String date = stdin.readLineSync();
    print("Price =>");
    double price = double.parse(stdin.readLineSync());
    trip.add(new Trip(id, location, passenger_limit, date, price));
    print("\n\t\t\t\t=>Successful add of trip ^-^");
  }

  void editTrip() {
    print("\n\t=>Enter id of trip want to edit");
    int id = int.parse(stdin.readLineSync());
    //check if empty
    if (trip.isEmpty) {
      print("\n\t\t\t\t=>The trip does not exist!");
    }
    else {
      int check_id=0; //to check id that user enter exist or not
      for (int i = 0; i < trip.length; i++) {
        if (trip[i].id == id) {
          check_id=1;
          print("\nID =>");
          int id = int.parse(stdin.readLineSync());
          trip[i].id=id;
          print("Location =>");
          String location = stdin.readLineSync();
          trip[i].location=location;
          print("Passenger limit =>");
          int passenger_limit = int.parse(stdin.readLineSync());
          trip[i].passenger_limit=passenger_limit;
          print("Date in format (23/1/2021) =>");
          String date = stdin.readLineSync();
          trip[i].date=date;
          print("Price =>");
          double price = double.parse(stdin.readLineSync());
          trip[i].price=price;
          print("\n\t\t\t\t=>successful edit of trip ^-^");
          break;
        }

      }
      //to check id that user enter exist or not
      if(check_id==0){
        print("\n\t\t\t\t=>The trip does not exist!");
      }
    }
  }

  void deleteTrip() {
    print("=>Enter id of trip want to delete");
    int id = int.parse(stdin.readLineSync());
    if (trip.isEmpty) {
      print("\n\t\t\t\t=>The trip does not exist!");
    }
    else {
      int check_id=0;
      for (int i = 0; i < trip.length; i++) {
        if (trip[i].id == id) {
          check_id=1;
          trip.removeAt(i);
          print("\n\t\t\t\t=>The trip has been deleted ^-^");
          break;
        }
      }
      //to check id that user enter exist or not
      if(check_id==0){
        print("\n\t\t\t\t=>The trip does not exist!");
      }
    }
  }

  void searchTrip() {
    print("=>Enter price of trip you want!");
    int price = int.parse(stdin.readLineSync());
    if (trip.isEmpty) {
      print("\n\t\t\t\t=>The trip does not exist!");
    }
    else {
      print("\n\t\t\t\t   _________________________________________________________________________________________________________");
      print("\t\t\t\t   ID \t\tLocation\t\t Price\t\t passenger limit\t\t Date ");
      print("\t\t\t\t   _________________________________________________________________________________________________________");
      int check_price=0; //to check price that user enter exist or not
      for (int i = 0; i < trip.length; i++) {
        if (trip[i].price == price) {
          check_price=1;
          print( "\n\t\t\t\t\t"+trip[i].id.toString()  +"\t\t "+
              trip[i].location +"\t\t\t " +trip[i].price.toString()+"\t\t\t"+
              trip[i].passenger_limit.toString() +"\t\t\t\t\t"+ trip[i].date.toString());
        }
      }
      //to check price that user enter exist or not
      if(check_price==0){
        print("\n\t\t\t\t=>The trip does not exist!");
      }
    }
  }

  void reverseTrip() {
    print("\n\t=>Enter id of trip want to reverse");
    int id = int.parse(stdin.readLineSync());
    if (trip.isEmpty) {
      print("\n\t\t\t\t=>The trip does not exist");
    }
    else {
      int check_id=0;//to check price that user enter exist or not
      for (int i = 0; i < trip.length; i++) {
        if (trip[i].id == id) {
          check_id=1;
          available_number.add(trip[i].passenger_limit);
          print("\nEnter number of passenger=>");
          int passenger = int.parse(stdin.readLineSync());
          if (passenger > available_number[i]) {
            print("\n\t\t\t\t=>Unfortunately! the number available is " +
                available_number[i].toString());
          }
          else {
            available_number[i] -= passenger;
            print("\n\t\t\t\t=>Done ^-^");
          }
        }
      }
      //to check price that user enter exist or not
      if(check_id==0){
        print("\n\t\t\t\t=>The trip does not exist");
      }
    }
  }

  void showTrips() {
    List<DateTime> datetime = [];//to order trips by date
      for(int i=0;i<trip.length;i++){
        datetime.add(trip[i].date);
      }
      datetime.sort((a,b) => a.compareTo(b));
    print("\n\t\t\t\t   _________________________________________________________________________________________________________");
    print("\t\t\t\t   ID \t\tLocation\t\t Price\t\t passenger limit\t\t Date ");
    print("\t\t\t\t   _________________________________________________________________________________________________________");
      for(int i=0;i<trip.length;i++){
        for(int j=0;j<trip.length;j++){
          if(datetime[i]==trip[j].date){
            print( "\n\t\t\t\t\t"+trip[j].id.toString()  +"\t\t "+
                trip[j].location +"\t\t\t " +trip[j].price.toString()+"\t\t\t"+
                trip[j].passenger_limit.toString() +"\t\t\t\t\t"+ trip[j].date.toString());
          }
        }
      }
    }
//Bonus
  void discount(){
    double discount;
    int check_price=0;//to check price that user enter exist or not
    for(int i=0;i<trip.length;i++){
      if(trip[i].price>10000){
        check_price=1;
       discount= trip[i].price * 0.20;
       trip[i].price=trip[i].price - discount;
       print("\n\t\t\t\t=> Done ^-^ trip id ("+ trip[i].id.toString()+") has offer 20 %");
      }
    }
    //to check price that user enter exist or not
    if(check_price ==0){
     print("\n\t\t\t\t=>There is no trip has discount!");
    }

  }

  void latestTrips(){
    if(trip.length>=10){
      print("\n\t\t\t\t   _________________________________________________________________________________________________________");
      print("\t\t\t\t   ID \t\tLocation\t\t Price\t\t passenger limit\t\t Date ");
      print("\t\t\t\t   _________________________________________________________________________________________________________");
      for(int i =trip.length-1; i>=trip.length-10;i--){
        print( "\n\t\t\t\t\t"+trip[i].id.toString()  +"\t\t "+
            trip[i].location +"\t\t\t " +trip[i].price.toString()+"\t\t\t"+
            trip[i].passenger_limit.toString() +"\t\t\t\t\t"+ trip[i].date.toString());
      }
    }
    else{
      print("\n\t\t\t\t=>The number of trips leaser than 10!");
    }
  }

  void displayPassenger(){
    int passenger_number;
    int total_passenger_number=0;
    if(available_number.length>=1){
      for(int i=0;i<available_number.length;i++){
        passenger_number=trip[i].passenger_limit-available_number[i];
        total_passenger_number+=passenger_number;
        print("\n\t\t\t\t=>number of passenger in trip id ("+trip[i].id.toString() + ") is ("+passenger_number.toString()+") ^_^");
      }
      print("\n\t\t\t\t=>total number of passenger in all trip is ("+total_passenger_number.toString()+") ^_^");
    }
    else{
      print("There are no reservations in any flight, so the number of passengers per flight = 0 and the total number of passengers on all flights = 0");
    }


  }

  }
