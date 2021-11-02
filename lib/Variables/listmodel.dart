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

  List<int> numberList = [];
  var random = Random();
  late int index;
  List<String> displaypet = [];
  PetListModel() {
    for (int i = 0; i < 7; i++) {
      if (i == 2 || i == 4) numberList.clear();
      displaypet.add(randompet(i));
    }
    displaypet.shuffle();
  }

  String randompet(int i) {
    switch (i) {
      case 0:
      case 1:
        index = random.nextInt(dog['image']!.length);
        while (numberList.contains(index)) {
          index = random.nextInt(dog['image']!.length);
        }
        numberList.add(index);
        return dog['image']![index];
      case 2:
      case 3:
        index = random.nextInt(cat['image']!.length);
        while (numberList.contains(index)) {
          index = random.nextInt(cat['image']!.length);
        }
        numberList.add(index);
        return cat['image']![index];
      case 4:
      case 5:
        index = random.nextInt(hamster['image']!.length);
        while (numberList.contains(index)) {
          index = random.nextInt(hamster['image']!.length);
        }
        numberList.add(index);
        return hamster['image']![index];
      default:
        return bird['image']![random.nextInt(bird['image']!.length)];
    }
  }
}
