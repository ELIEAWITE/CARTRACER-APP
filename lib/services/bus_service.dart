import '../models/bus.dart';

class BusService {
  List<Bus> buses = [];

  void addBus(Bus bus) {
    buses.add(bus);
    // Logique pour enregistrer le bus (base de données, etc.)
  }
}
