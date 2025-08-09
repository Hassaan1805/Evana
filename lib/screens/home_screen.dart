// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
// Import the new map packages
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'support_screen.dart'; // Keep this for the drawer

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Define the initial map center for India
  final LatLng _initialCenter = const LatLng(20.5937, 78.9629);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/evana_logo.png',
          height: 30,
          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : null,
        ),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          // Use the new FlutterMap widget
          FlutterMap(
            options: MapOptions(
              initialCenter: _initialCenter,
              initialZoom: 5.0,
            ),
            children: [
              // This is the map's visual layer
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'evana.com.evana_taxi',
              ),
              // We can add markers and other layers here later
            ],
          ),
          // The search UI remains the same
          Positioned(
            top: 10,
            left: 15,
            right: 15,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(decoration: InputDecoration(labelText: 'From: Current Location', prefixIcon: Icon(Icons.my_location))),
                    const SizedBox(height: 10),
                    const TextField(decoration: InputDecoration(labelText: 'To: Where are you going?', prefixIcon: Icon(Icons.location_on))),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                      onPressed: () { /* TODO: Navigate to Ride Offer Screen */ },
                      child: const Text('Confirm Ride'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// The AppDrawer code remains the same
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Text('Menu', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Account Settings'),
            onTap: () { Navigator.pop(context); },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Support / Help'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SupportScreen()));
            },
          ),
        ],
      ),
    );
  }
}