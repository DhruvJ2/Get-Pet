import 'dart:math';

class PetListModel {
  Map<String, List<String>> dog = {
    'name': ['Tommy', 'Sam', 'lol', 'Josh'],
    'image': [
      'assets/dog2.jpg',
      'assets/dog.jpg',
      'assets/Dog 1.jpg',
      'assets/dog3.jpg'
    ],
    'breed': [
      'german shepherd',
      'Golden Retriver',
      'Poodle',
      'Golden Retriver'
    ],
  };
  var cat = {
    'name': ['killer', 'cat2'],
    'image': ['assets/cat.jpg', 'assets/cat3.jpg'],
    'breed': ['Munchkin Cat', 'Munchkin Cat'],
  };
  var bird = {
    'name': ['bird1'],
    'image': ['assets/bird.jpg'],
    'breed': ['Kingfisher'],
  };
  var hamster = {
    'name': ['hamster1', 'hamster2', 'hamster3'],
    'image': [
      'assets/hamster1.jpg',
      'assets/hamster2.jpg',
      'assets/hamsters.jpg'
    ],
    'breed': [
      'Syriam (Golden) Hamster',
      'Dwarf Campbell Russian Hamster',
      'Syriam Hamster'
    ],
  };

  List<int> numberList = [];
  var random = Random();
  late int index;
  Map<String, List<String>> displaypet = {
    'name': [],
    'image': [],
    'breed': [],
  };
  PetListModel() {
    for (int i = 0; i < 7; i++) {
      if (i == 2 || i == 4) numberList.clear();
      randompet(i);
    }
  }
  // displaypet map shuffling left

  void assignvalue(int index, String category) {
    switch (category) {
      case 'Dogs':
        displaypet['name']!.add(dog['name']![index]);
        displaypet['image']!.add(dog['image']![index]);
        displaypet['breed']!.add(dog['breed']![index]);
        break;
      case 'Cats':
        displaypet['name']!.add(cat['name']![index]);
        displaypet['image']!.add(cat['image']![index]);
        displaypet['breed']!.add(cat['breed']![index]);
        break;
      case 'Birds':
        displaypet['name']!.add(bird['name']![index]);
        displaypet['image']!.add(bird['image']![index]);
        displaypet['breed']!.add(bird['breed']![index]);
        break;
      case 'Hamsters':
        displaypet['name']!.add(hamster['name']![index]);
        displaypet['image']!.add(hamster['image']![index]);
        displaypet['breed']!.add(hamster['breed']![index]);
        break;
    }
  }

  void randompet(int i) {
    switch (i) {
      case 0:
      case 1:
        index = random.nextInt(dog['image']!.length);
        while (numberList.contains(index)) {
          index = random.nextInt(dog['image']!.length);
        }
        numberList.add(index);
        assignvalue(index, 'Dogs');
        break;
      case 2:
      case 3:
        index = random.nextInt(cat['image']!.length);
        while (numberList.contains(index)) {
          index = random.nextInt(cat['image']!.length);
        }
        numberList.add(index);
        assignvalue(index, 'Cats');
        break;
      case 4:
      case 5:
        index = random.nextInt(hamster['image']!.length);
        while (numberList.contains(index)) {
          index = random.nextInt(hamster['image']!.length);
        }
        numberList.add(index);
        assignvalue(index, 'Hamsters');
        break;
      default:
        index = random.nextInt(bird['image']!.length);
        assignvalue(index, 'Birds');
        break;
    }
  }
}
