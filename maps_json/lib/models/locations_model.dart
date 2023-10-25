class Location {
  String nombre;
  double latitud;
  double longitud;

  Location({
    required this.nombre,
    required this.latitud,
    required this.longitud,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        nombre: json['nombre'],
        latitud: json['latitud'],
        longitud: json['longitud'],
      );
}
