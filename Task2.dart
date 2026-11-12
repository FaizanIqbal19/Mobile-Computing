class Car {
  String brand;
  String model;
  int year;

  Car(this.brand, this.model, this.year);

  void display() {
    print("$brand $model $year");
  }
}

void main() {
  Car car1 = Car("Toyota", "Corolla", 2020);
  Car car2 = Car("Honda", "Civic", 2022);

  car1.display();
  car2.display();
}