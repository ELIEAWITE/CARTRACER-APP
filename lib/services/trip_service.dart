import '../models/trip.dart';

class TripService {
  List<Trip> trips = [];

  void addTrip(Trip trip) {
    trips.add(trip);
    // Logique pour enregistrer le trajet (base de données, etc.)
  }
}
