import 'package:get/get.dart';

class TrainingCourseController extends GetxController {


   List<TrainingCourse> allCourses = [
    TrainingCourse(
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
    TrainingCourse(
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
     TrainingCourse(

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
  ].obs;
  Rx<List<TrainingCourse>> foundCourses = Rx<List<TrainingCourse>>([]);

  @override
  void onInit() {
    super.onInit();
    foundCourses.value = allCourses;

  }

  @override
  void onReady() {
    super.onReady();
  }


  void filterCourse(String courseName) {
    List<TrainingCourse> results = [];
    if (courseName.isEmpty) {
      results = allCourses;
    } else {
      results = allCourses
          .where((element) => element.nameCourse
              .toString()
              .toLowerCase()
              .contains(courseName.toLowerCase()))
          .toList();
    }
    foundCourses.value = results;
  }
}

class TrainingCourse {
  late String nameCourse;
  late String image;
  late String trainerName;
  late String language;
  late String imageTrainer;
  late String hourCourse;
  late String sectionCourse;
  late double rate;
  late String aboutCourse;
  late List<String> whatLearn;
  TrainingCourse(
      {required this.nameCourse,
      required this.image,
      required this.trainerName,
      required this.language,
      required this.imageTrainer,
      required this.hourCourse,
      required this.sectionCourse,
      required this.rate,
      required this.aboutCourse,
        required this.whatLearn,
      });
}
