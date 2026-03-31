void main() {
  final _movielist = <String>[
    "The Shawshank Redemption",
    "The Godfather",
    "The Dark Knight",
    "The Godfather: Pt 2",
    "The Lord of the Rings: Return of the King",
    "Pulp Fiction",
    "Schindler's List",
    "The Terminator",
  ];
  print(_movielist[2]);

  // a for loop!!
  for (String thing in _movielist) {
    print(thing);
  }

  // or
  for (int x = 0; x < _movielist.length; x++) {
    print(_movielist[x]);
  }
  print(0);
}

// iteration part 2:
void main() {
  final _movielist = <String>[
    "The Shawshank Redemption",
    "The Godfather",
    "The Dark Knight",
    "The Godfather: Pt 2",
    "The Lord of the Rings: Return of the King",
    "Pulp Fiction",
    "Schindler's List",
    "The Terminator",
  ];
  print(_movielist[2]);

  // section 8.4, list addition etc.
  // OK so this is a use-case for `var`
  // see https://dart.dev/language/generics
  var ages = <int>[];
  for (int a = 0; a < 10; a++) {
    ages.add(a + 12);
    ages.add(a + 12);
  }
  // remove 1 item matching this value
  ages.remove(17);
  var result = ages.remove(2345);
  print(result);

  print(ages);

  // a for loop!!
  for (String thing in _movielist) {
    print(thing);
  }

  // or
  for (int x = 0; x < _movielist.length; x++) {
    print(_movielist[x]);
  }
  print(0);
}

