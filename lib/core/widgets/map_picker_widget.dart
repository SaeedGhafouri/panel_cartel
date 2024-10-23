import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPickerWidget extends StatefulWidget {
  final Function(LatLng) onLocationSelected;

  const MapPickerWidget({Key? key, required this.onLocationSelected}) : super(key: key);

  @override
  _MapPickerWidgetState createState() => _MapPickerWidgetState();
}

class _MapPickerWidgetState extends State<MapPickerWidget> {
  LatLng _selectedLocation = LatLng(35.6892, 51.3890);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // ارتفاع Container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: FlutterMap(
        options: MapOptions(
          initialCenter: _selectedLocation,
          initialZoom: 13.0,
          onTap: (tapPosition, latLng) {
            setState(() {
              _selectedLocation = latLng;
              widget.onLocationSelected(_selectedLocation);
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: _selectedLocation,
                child:  Container(
                  child: Icon(Icons.location_on, color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
