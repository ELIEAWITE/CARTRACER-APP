import 'package:flutter/material.dart';
import '../services/location_service.dart';
import 'package:geolocator/geolocator.dart'; //


class DriverScreen extends StatefulWidget {
  @override
  _DriverScreenState createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  final LocationService _locationService = LocationService();
  String departure = '';
  String arrival = '';
  bool hasAvailableSeats = false;
  Position? currentPosition;

  void _submitTrip() {
    // Logique pour soumettre le trajet
    // Ex: calculer l'itinéraire et la distance
    print('Départ: $departure, Arrivée: $arrival, Places disponibles: $hasAvailableSeats');
  }

  Future<void> _getCurrentLocation() async {
    currentPosition = await _locationService.getCurrentLocation();
    print('Localisation actuelle: ${currentPosition?.latitude}, ${currentPosition?.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tableau de Bord Chauffeur')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nom de l\'arrêt de départ'),
              onChanged: (value) => departure = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Nom de l\'arrêt d\'arrivée'),
              onChanged: (value) => arrival = value,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: hasAvailableSeats,
                  onChanged: (value) {
                    setState(() {
                      hasAvailableSeats = value!;
                    });
                  },
                ),
                Text('Places disponibles')
              ],
            ),
            ElevatedButton(
              onPressed: _getCurrentLocation,
              child: Text('Activer la géolocalisation'),
            ),
            ElevatedButton(
              onPressed: _submitTrip,
              child: Text('Soumettre le trajet'),
            ),
          ],
        ),
      ),
    );
  }
}
