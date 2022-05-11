import 'PlacementTestModel.dart';

PlacementTestModel loadQuestion(int questionIndex) {
  List<PlacementTestModel> questionList = [
    PlacementTestModel("ماذا تمثل الاشارة؟", "0.png", "رقم الصفر", [
      "حرف السين",
      "رقم التسعة",
    ]),
    PlacementTestModel(
        "ماذا تمثل الاشارة", "6.png", "رقم الستة", ["حرف الواو", "رقم الواحد"]),
    PlacementTestModel(
        "ماذا تمثل الاشارة؟", "N.png", "حرف النون", ["حرف الهاء", "حرف الجيم"]),
    PlacementTestModel("ماذا تمثل الاشارة؟", "9.png", "رقم التسعة",
        ["حرف الدال", "حرف الباء"]),
    PlacementTestModel("ماذا تمثل الاشارة؟", "7.png", "رقم السبعة",
        ["رقم الثمانية", "حرف الطاء"]),
    PlacementTestModel(
        "ماذا تمثل الاشارة؟", "M.png", "حرف الميم", ["حرف السين", "حرف الياء"]),
    PlacementTestModel("ماذا تمثل الاشارة؟", "R.png", "حرف الراء", [
      "حرف الباء",
      "رقم الاثنين",
    ]),
    PlacementTestModel(
        "ماذا تمثل الاشارة؟", "A.png", "حرف الألف", ["حرف الثاء", "حرف الياء"]),
    PlacementTestModel(
        "ماذا تمثل الاشارة؟", "S.png", "حرف السين", ["حرف الصاد", "حرف الذال"]),
    PlacementTestModel("ماذا تمثل الاشارة؟", "Y.png", "حرف الياء",
        ["حرف الهاء", "رقم الاربعة"]),
  ];
  return questionList[questionIndex];
}
