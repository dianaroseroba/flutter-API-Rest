class User {
  final Name name;
  final String email;
  final String phone;
  final String cell;
  final Login login;
  final Location location;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.cell,
    required this.login,
    required this.location,
  });

  // Método para convertir un JSON a un objeto User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: Name.fromJson(json['name']),
      email: json['email'],
      phone: json['phone'],
      cell: json['cell'],
      login: Login.fromJson(json['login']),
      location: Location.fromJson(json['location']),
    );
  }
}

// Modelo para el nombre del usuario
class Name {
  final String title;
  final String first;
  final String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }

  String get fullName => "$first $last";
}

// Modelo para la información de inicio de sesión
class Login {
  final String username;

  Login({required this.username});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(username: json['username']);
  }
}

// Modelo para la ubicación del usuario
class Location {
  final Street street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final Coordinates coordinates;

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(), // Puede ser int o string
      coordinates: Coordinates.fromJson(json['coordinates']),
    );
  }
}

// Modelo para la calle
class Street {
  final int number;
  final String name;

  Street({required this.number, required this.name});

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'],
      name: json['name'],
    );
  }
}

// Modelo para coordenadas
class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
