// ignore_for_file: sort_constructors_first

class Country {
  var name;

  Country({this.name});

  @override
  String toString() {
    return 'Country: {name: $name}';
  }
}
