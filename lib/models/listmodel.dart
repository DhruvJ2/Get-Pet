import 'dart:math';

import 'package:pet_adopter/UI/category.dart';

class PetListModel {
  Map<String, List<String>> adoptedpets = {
    'name': [],
    'breed': [],
    'category': [],
    'image': [],
  };
  Map<String, List<String>> dog = {
    'category': ['Dog'],
    'name': [
      'Max',
      'Sam',
      'Duke',
      'Rocky',
      'Bear and Ajax',
      'Milo',
    ],
    'image': [
      'assets/Dogs/d.jpeg',
      'assets/Dogs/d1.jpeg',
      'assets/Dogs/d2.jpg',
      'assets/Dogs/d4.jpg',
      'assets/Dogs/d5.jpg',
      'assets/Dogs/d6.jpg',
    ],
    'breed': [
      'Beagle',
      'Finnish Spitz',
      'Poodle',
      'Golden Retriver',
      'german shepherd',
      'Golden Retriver',
    ],
  };
  var cat = {
    'category': ['Cat'],
    'name': [
      'Luna',
      'Lucy',
      'Leo',
      'Stella',
      'Micky',
      'Fitz',
    ],
    'image': [
      'assets/Cats/c.jpeg',
      'assets/Cats/c1.jpeg',
      'assets/Cats/c2.jpeg',
      'assets/Cats/c3.jpeg',
      'assets/Cats/c4.jpg',
      'assets/Cats/c5.jpg'
    ],
    'breed': [
      'American Bobtail',
      'Korat',
      'Abyssinian',
      'Sphynx',
      'Munchkin Cat',
      'Munchkin Cat',
    ],
  };
  var bird = {
    'category': ['Bird'],
    'name': [
      'Sunny and Ava',
      'Coco',
      'Kiwi',
      'Daisy',
      'Pepper',
      'Tori',
    ],
    'image': [
      'assets/Birds/b.jpeg',
      'assets/Birds/b1.jpeg',
      'assets/Birds/b2.jpeg',
      'assets/Birds/b3.jpeg',
      'assets/Birds/b4.jpeg',
      'assets/Birds/b5.jpg',
    ],
    'breed': [
      'Parakeets',
      'Cockatoo',
      'Parrot',
      'Amazon Parrot',
      'Lesser Sulphur-crested Cockatoo',
      'Kingfisher',
    ],
  };
  var hamster = {
    'category': ['Hamster'],
    'name': [
      'Gizmo',
      'Duncan',
      'Hamlet',
      'Patches',
      'Whiskers',
      'Chomper',
      'Spaz',
    ],
    'image': [
      'assets/Hamsters/h.jpeg',
      'assets/Hamsters/h1.jpeg',
      'assets/Hamsters/h2.jpeg',
      'assets/Hamsters/h3.jpeg',
      'assets/Hamsters/h4.jpg',
      'assets/Hamsters/h5.jpg',
      'assets/Hamsters/h6.jpg',
    ],
    'breed': [
      'Syrian',
      'Syrian',
      'Syrian',
      'Dwarf Roborovski',
      'Syrian (Golden) Hamster',
      'Dwarf Campbell Russian Hamster',
      'Syrian Hamster',
    ],
  };

  List<int> numberList = [];
  var random = Random();
  late int index;
  Map<String, List<String>> displaypet = {
    'category': [],
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
        displaypet['category']!.add(dog['category']![0]);
        break;
      case 'Cats':
        displaypet['name']!.add(cat['name']![index]);
        displaypet['image']!.add(cat['image']![index]);
        displaypet['breed']!.add(cat['breed']![index]);
        displaypet['category']!.add(cat['category']![0]);
        break;
      case 'Birds':
        displaypet['name']!.add(bird['name']![index]);
        displaypet['image']!.add(bird['image']![index]);
        displaypet['breed']!.add(bird['breed']![index]);
        displaypet['category']!.add(bird['category']![0]);
        break;
      case 'Hamsters':
        displaypet['name']!.add(hamster['name']![index]);
        displaypet['image']!.add(hamster['image']![index]);
        displaypet['breed']!.add(hamster['breed']![index]);
        displaypet['category']!.add(hamster['category']![0]);
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
