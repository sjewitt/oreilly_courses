void main() {
  Mammal stoat = Mammal("Stoaty mcstoatface","stoat",476);
  
  // or, superclass
  Animal shark = Animal("bitey mc bite bite");
  
  stoat.eat();
  stoat.sleep();
  stoat.info();
  
  shark.eat();
}

class Animal {
  String name;

  Animal(this.name);

  void eat() {
    print("$name is eating");
  }
  
  void sleep() {
    print("$name is sleeping");
  }
}

class Mammal extends Animal {
  String species;
  
  // and he uses 
  int age;
  
  // Mammal() : super(name);
  // Mammal(String name) : super(name);
  // like this:
  // ClassName(var superclassvarname, this.localvar): super(superclassvarname)
  Mammal(String name, this.species, this.age) : super(name);
  
  void info(){
    print("age: $age\nspecies: $species");
  }
}

// class Person {
//   String name;
//   int age;

//   Person(this.name, this.age);

//   // methods
//   void greeting() {
//     print("hello, I am $name");
//   }
// }
