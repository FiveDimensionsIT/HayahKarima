import 'package:get/get.dart';
import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class TrainingCourseController extends GetxController {


   List<TrainingCourseModel> _allCourses = [
    TrainingCourseModel(
        image: 'assets/images/course.png',
        nameCourse: 'بناء المواقع الإلكترونية باستخدام وورد برس المواقـ',
        hourCourse: '20 ساعة',
        trainerName: 'أحمد محمد',
        imageTrainer: 'assets/images/person.png',
        language: 'Html5',
        sectionCourse: '30 مقطع',
        rate: 4.5,
       aboutCourse: 'يعتبر الووردبريس أشهر نظام لإدارة المحتوى وإنشاء المواقع في العالم حيث يشكل 27% من المواقع على الإنترنت اليوم. ومن أهم مميزاته سهولة البدء في استعماله، وتستطيع متى أتقنته إنشاء أي موقع إنترنت يخطر على بالك في وقت قصير. سواء إذا كنت ترغب في إنشاء موقع تجارة إلكترونية متكامل أو موقع لشركتك أو حتى مدونة تشارك عليها أفكارك فهو مناسب لذلك. كما أنك تستطيع تخصيص موقعك بناءً على ما تريد بناءه وإظهاره للمستخدمين من خلال القوالب المجانية المتاحة على موقع ووردبريس والعديد من المواقع على الانترنت.',
      whatLearn: [
      "التعرف على واجهة المستخدم لنظام الووردبريس أساسيات الووردبريس: كيف تنشئ الصفحات, والتعرف على قوائم الووردبريس",
      "كيف تتحكم في شكل الموقع و الخواص التي يشملها من خلال الثيم و البلاجنز",
      "كيف تستطيع تعديل و تخصيص موقعك بأفضل الطرق ليوائم البراند الخاصة بك"
      ]
    ),
    TrainingCourseModel(
        image: 'assets/images/excel.png',
        nameCourse: 'الإكسل: من الصفر إلى الاحتراف',
        hourCourse: '30 ساعة',
        trainerName: 'أحمد خالد',
        imageTrainer: 'assets/images/person.png',
        language: 'Html5',
        sectionCourse: '30 مقطع',
        rate: 4.5,
    aboutCourse: 'الإكسل هو أحد أشهر البرامج المستخدمة عالميًا، والأكثر استخدام في تصنيفه رغم وجود العديد من البرامج المشابهه وهذا نتيجة مرونته القوية والعالية. وهو يعتبر أحد برامج العمل بالجداول (Spreadsheet)، والأول عالميًا في هالمجال',
      whatLearn: [
      "التعرف على واجهة المستخدم لنظام الاكسل أساسيات الاكسل: كيف تنشئ الصفحات, والتعرف على قوائم الووردبريس",
      "كيف تتحكم في شكل الموقع و الخواص التي يشملها من خلال الثيم و البلاجنز",
      "كيف تستطيع تعديل و تخصيص موقعك بأفضل الطرق ليوائم البراند الخاصة بك"
      ],
    ),
     TrainingCourseModel(

         image: 'assets/images/course.png',
         nameCourse: 'بناء المواقع الإلكترونية باستخدام وورد برس المواقـ',
         hourCourse: '20 ساعة',
         trainerName: 'أحمد محمد',
         imageTrainer: 'assets/images/person.png',
         language: 'Html5',
         sectionCourse: '30 مقطع',
         rate: 4.5,
     aboutCourse: 'يعتبر الووردبريس أشهر نظام لإدارة المحتوى وإنشاء المواقع في العالم حيث يشكل 27% من المواقع على الإنترنت اليوم. ومن أهم مميزاته سهولة البدء في استعماله، وتستطيع متى أتقنته إنشاء أي موقع إنترنت يخطر على بالك في وقت قصير. سواء إذا كنت ترغب في إنشاء موقع تجارة إلكترونية متكامل أو موقع لشركتك أو حتى مدونة تشارك عليها أفكارك فهو مناسب لذلك. كما أنك تستطيع تخصيص موقعك بناءً على ما تريد بناءه وإظهاره للمستخدمين من خلال القوالب المجانية المتاحة على موقع ووردبريس والعديد من المواقع على الانترنت.',
       whatLearn: [
       "التعرف على واجهة المستخدم لنظام الووردبريس أساسيات الووردبريس: كيف تنشئ الصفحات, والتعرف على قوائم الووردبريس",
       "كيف تتحكم في شكل الموقع و الخواص التي يشملها من خلال الثيم و البلاجنز",
       "كيف تستطيع تعديل و تخصيص موقعك بأفضل الطرق ليوائم البراند الخاصة بك"
       ],
     ),
  ];

  RxList<TrainingCourseModel> coursesList = <TrainingCourseModel>[].obs;
  RxBool apiLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    coursesList.assignAll(_allCourses);
  }

  @override
  void onReady() {
    super.onReady();
  }


  void filterCourse(String courseName) {
    // List<TrainingCourseModel> results = [];
    // if (courseName.isEmpty) {
    //   results = allCourses;
    // } else {
    //   results = allCourses
    //       .where((element) => element.nameCourse
    //           .toString()
    //           .toLowerCase()
    //           .contains(courseName.toLowerCase()))
    //       .toList();
    // }
    // coursesList.value = results;
  }
}

class TrainingCourseModel extends Serializable{
  String? nameCourse;
  String? image;
  String? trainerName;
  String? language;
  String? imageTrainer;
  String? hourCourse;
  String? sectionCourse;
  num? rate;
  String? aboutCourse;
  List<String?>? whatLearn;

  TrainingCourseModel({this.nameCourse, this.image, this.trainerName, this.language, this.imageTrainer, this.hourCourse, this.sectionCourse, this.rate, this.aboutCourse, this.whatLearn, });

  @override
  void fromMap(Map<String, dynamic> map) {
    nameCourse = map['nameCourse'];
    image = map['image'];
    trainerName = map['trainerName'];
    language = map['language'];
    imageTrainer = map['imageTrainer'];
    hourCourse = map['hourCourse'];
    sectionCourse = map['sectionCourse'];
    rate = map['rate'];
    aboutCourse = map['aboutCourse'];
    if (map['whatLearn'] != null) {
      whatLearn = [];
      map['whatLearn'].forEach((v) {
        whatLearn!.add(v);
      });
    }
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameCourse'] = this.nameCourse;
    data['image'] = this.image;
    data['trainerName'] = this.trainerName;
    data['language'] = this.language;
    data['imageTrainer'] = this.imageTrainer;
    data['hourCourse'] = this.hourCourse;
    data['sectionCourse'] = this.sectionCourse;
    data['rate'] = this.rate;
    data['aboutCourse'] = this.aboutCourse;
    if (this.whatLearn != null) {
      data['whatLearn'] = this.whatLearn!.map((v) => v).toList();
    }
    return data;
  }
}

