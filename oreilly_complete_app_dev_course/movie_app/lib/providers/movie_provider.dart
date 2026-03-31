import 'package:flutter/material.dart';

// this extends chagenotifier so the changes are - um -notified to the UI:
class MovieProvider extends ChangeNotifier{
  
  // init
  MovieProvider();

  // This provider - ultimately - will be form a database (just wait...)
  // but for now will provide instances of Movie:
  final List<String> _movieList = [
    "The Shawshank Redemption",
    "The Godfather",
    "The Dark Knight",
    "The Godfather: Pt 2",
    "The Lord of the Rings: Return of the King",
    "Pulp Fiction",
    "Schindler's List",
    "The Terminator",
    "True Lies",
  ];


  // getter - remember the syntax:
  List<String> get movieList => _movieList;

  // and a method (whcih will be updated later)
  List<String> loadMovies(){
    return _movieList;
  }
}

