// ignore_for_file: file_names

class LettersTestModel {
  final String name;
  final String img;
  final String value;
  bool accepting;

  LettersTestModel(
      {required this.name,
      required this.value,
      required this.img,
      this.accepting = false}); //remove required
}
