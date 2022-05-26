import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class QuestionResponse extends Serializable{
  int? question_id;
  String? question_text;
  int? points;
  int? answer_option_id;
  String? answer_option_text;

  QuestionResponse({this.question_id, this.question_text, this.points, this.answer_option_id, this.answer_option_text, });

  @override
  void fromMap(Map<String, dynamic> map) {
    question_id = map['question_id'];
    question_text = map['question_text'];
    points = map['points'];
    answer_option_id = map['answer_option_id'];
    answer_option_text = map['answer_option_text'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.question_id;
    data['question_text'] = this.question_text;
    data['points'] = this.points;
    data['answer_option_id'] = this.answer_option_id;
    data['answer_option_text'] = this.answer_option_text;
    return data;
  }
}

