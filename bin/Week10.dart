abstract class Inspectable {
  void performInspection();
}

mixin ElectricPowered {
  void chargeBattery() {
    print("Charging: Connected to a high-speed EV charging station.");
  }
}

class CarBrand {
  String _brand;

  CarBrand(this._brand);

  String get brand => _brand;

  void shout() {
    final lowerBrand = _brand.toLowerCase();
    
    if (lowerBrand == "toyota") {
      print("CarBrand ($_brand): Built for reliability and efficiency!");
    } else if (lowerBrand == "bmw") {
      print("CarBrand ($_brand): The ultimate driving machine!");
    } else if (lowerBrand == "ferrari") {
      print("CarBrand ($_brand): Pure speed and passion on the track!");
    } else {
      print("CarBrand ($_brand): Ready for the open road!");
    }
  }
}

class LuxuryCarBrand extends CarBrand implements Inspectable {
  final double luxuryRating;

  LuxuryCarBrand(String brand, this.luxuryRating) : super(brand);

  @override
  void shout() {
    print("LuxuryCarBrand ($brand): Rated $luxuryRating/10 for unmatched comfort and elegance!");
  }

  @override
  void performInspection() {
    print("Inspecting $brand: Testing active noise cancellation and premium leather seating.");
  }
}

class SportsCarBrand extends CarBrand implements Inspectable {
  final int topSpeedKmH;

  SportsCarBrand(String brand, this.topSpeedKmH) : super(brand);

  @override
  void shout() {
    print("SportsCarBrand ($brand): High performance engineered for $topSpeedKmH km/h top speeds!");
  }

  @override
  void performInspection() {
    print("Inspecting $brand: Checking carbon ceramic brakes and turbocharger pressure.");
  }
}

class ElectricScooter with ElectricPowered {
  final String modelName;

  ElectricScooter(this.modelName);

  void ride() {
    print("Riding $modelName scooter smoothly through city streets.");
  }
}

void main() {
  print("=== SHOWROOM DEMO ===");

  final List<CarBrand> showroom = [
    CarBrand("Toyota"),
    LuxuryCarBrand("Rolls-Royce", 9.9),
    SportsCarBrand("Ferrari", 340),
    LuxuryCarBrand("BMW", 8.8),
  ];

  for (final carBrand in showroom) {
    carBrand.shout();
    
    if (carBrand is Inspectable) {
      (carBrand as Inspectable).performInspection();
    }
    print("--------------------------------------------------");
  }

  print("\n=== MIXIN DEMO ===");

  final scooter = ElectricScooter("e-Glide Pro");
  scooter.ride();
  scooter.chargeBattery();
}
