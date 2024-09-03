class TCategoryIconFormatter {
  TCategoryIconFormatter._();

  static String beerMug = "assets/icons/categories/beer-mug.svg";
  static String beerPitch = "assets/icons/categories/beer-pitch.svg";
  static String burger = "assets/icons/categories/burger.svg";
  static String cakeSlice = "assets/icons/categories/cake-slice.svg";
  static String cheese = "assets/icons/categories/cheese.svg";
  static String chickenGrilled = "assets/icons/categories/chicken-grilled.svg";
  static String coffeeBean = "assets/icons/categories/coffee-bean.svg";
  static String donut = "assets/icons/categories/donut.svg";
  static String forkSpoon = "assets/icons/categories/fork-spoon.svg";
  static String iceCream = "assets/icons/categories/ice-cream.svg";
  static String milkshake = "assets/icons/categories/milkshake.svg";
  static String popcorn = "assets/icons/categories/popcorn.svg";
  static String shrimp = "assets/icons/categories/shrimp.svg";
  static String teaCup = "assets/icons/categories/tea-cup.svg";
  static String toast = "assets/icons/categories/toast.svg";
  static String waterGlass = "assets/icons/categories/water-glass.svg";
  static String servingDome = "assets/icons/categories/serving-dome.svg";

  static String getIcon(String icon) {
    switch (icon) {
      case "beer-mug":
        return beerMug;
      case "beer-pitch":
        return beerPitch;
      case "burger":
        return burger;
      case "cake-slice":
        return cakeSlice;
      case "cheese":
        return cheese;
      case "chicken-grilled":
        return chickenGrilled;
      case "coffee-bean":
        return coffeeBean;
      case "donut":
        return donut;
      case "fork-spoon":
        return forkSpoon;
      case "ice-cream":
        return iceCream;
      case "milkshake":
        return milkshake;
      case "popcorn":
        return popcorn;
      case "shrimp":
        return shrimp;
      case "tea-cup":
        return teaCup;
      case "toast":
        return toast;
      case "water-glass":
        return waterGlass;
      case "serving-dome":
        return servingDome;
      default:
        return servingDome;
    }
  }
}
