import 'package:hayah_karema/services/logger/log.dart';
import 'package:intl/intl.dart';

int getDayFromDate(DateTime d) => d.day;

int getEGYDayIndex(String dayName){
  switch(dayName){
    case 'sat' : return 0;
    case 'sun' : return 1;
    case 'mon' : return 2;
    case 'tue' : return 3;
    case 'wed' : return 4;
    case 'thu' : return 5;
    case 'fri' : return 6;
  }
  return 1;
}

String getUTCDayName(int dayIndex){
  switch(dayIndex){
    case 1 : return 'mon';
    case 2 : return 'tue';
    case 3 : return 'wed';
    case 4 : return 'thu';
    case 5 : return 'fri';
    case 6 : return 'sat';
    case 7 : return 'sun';
  }
  return 'fri';
}

String getDayByDateName(String dayName) {
  try{
    final now = DateTime.now();
    final saturdayDate = now.subtract(Duration(days: getEGYDayIndex(getUTCDayName(now.weekday))));
    final day = '${getDayFromDate(saturdayDate.add(Duration(days: getEGYDayIndex(dayName.toLowerCase()))))}';
    Log.info('-->> $dayName:', day);
    return day;
  }catch (ex){
    Log.error('', ex);
    throw Exception('error: parse date to day --> $ex');
  }
}

String formatDateToDay(String dateString){
  if(dateString.isEmpty) return '0000-00-00';
  try{
    final date = DateTime.parse(dateString);
    final day = date.day<10? '0${date.day}': '${date.day}';
    final month = date.month<10? '0${date.month}': '${date.month}';
    return '${date.year}-$month-$day';
  }catch (ex){
    Log.error('parse operation_date error : ',ex);
  }
  return dateString;
}

String formatDateToDateTime(String dateString){
  if(dateString.isEmpty) return '0000-00-00 00:00 00';
  try{
    final date = DateTime.parse(dateString);
    final day = date.day<10? '0${date.day}': '${date.day}';
    final month = date.month<10? '0${date.month}': '${date.month}';

    final hours = date.hour<10? '0${date.hour}': '${date.hour}';
    final mins = date.minute<10? '0${date.minute}': '${date.minute}';
    final secs = date.second<10? '0${date.second}': '${date.second}';
    final time = '$hours:$mins';

    return '$time $day-$month-${date.year}';
  }catch (ex){
    Log.error('parse operation_date error : ',ex);
  }
  return dateString;
}

String formatTimeTo12Hrs(String time){
  if(time.isEmpty) return '00:00 --';
  final format = DateFormat("HH:mm:ss");
  final mTime = format.parse(time);
  return DateFormat("h:mm a").format(mTime);
}

int daysBetween({required DateTime from, required DateTime to}) {
  var newFrom = DateTime(from.year, from.month, from.day);
  var newTo = DateTime(to.year, to.month, to.day);
  return (newTo.difference(newFrom).inDays)+1;
}

String getCurrentDayName(){
  return DateFormat('EEEE').format(DateTime.now());
}