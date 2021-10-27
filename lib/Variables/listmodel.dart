import 'dart:math';

class PetListModel {
  var dog = {
    'name': ['Tommy', 'Sam', 'lol'],
    'image': ['assets/dog2.jpg', 'assets/dog.jpg', 'assets/Dog 1.jpg'],
  };
  var cat = {
    'name': ['cat1', 'cat2'],
    'image': ['assets/cat.jpg', 'assets/cat3.jpg'],
  };
  var bird = {
    'name': ['bird1', 'bird2'],
    'image': ['assets/Heron bird.jpg', 'assets/bird.jpg'],
  };
  var hamster = {
    'name': ['hamster1', 'hamster2'],
    'image': ['assets/hamster1.jpg', 'assets/hamster2.jpg'],
  };

  var index = Random();
  List<String> displaypet = [];
  PetListModel() {
    //What if number repeats
    displaypet = [for (int i = 0; i < 7; i++) randompet(i)];
    displaypet.shuffle();
  }

  String randompet(int i) {
    if (i < 3)
      return dog['image']![index.nextInt(dog['image']!.length)];
    else if (i >= 3 && i < 5)
      return cat['image']![index.nextInt(cat['image']!.length)];
    else if (i >= 5 && i < 7)
      return hamster['image']![index.nextInt(hamster['image']!.length)];
    else
      return bird['image']![index.nextInt(bird['image']!.length)];
  }
}
