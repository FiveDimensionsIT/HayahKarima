import 'package:hayah_karema/utils/serialization/serialization_lib.dart';

class AnswerRequest extends Serializable{
  String? userId;
  String? questionId;
  String? answerOptionId;

  AnswerRequest({this.userId, this.questionId, this.answerOptionId, });

  @override
  void fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    questionId = map['questionId'];
    answerOptionId = map['answerOptionId'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['questionId'] = this.questionId;
    data['answerOptionId'] = this.answerOptionId;
    return data;
  }
}

