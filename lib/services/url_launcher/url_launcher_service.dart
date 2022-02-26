
import 'package:hayah_karema/services/url_launcher/i_url_launcher_service.dart';
import 'url_launcher_lib.dart';

class UrlLauncherService implements IUrlLauncherService{

  @override
  Future<bool> launchEmail(String email, String subject, String body) async{
    final Uri _emailLaunchUri = Uri(scheme: 'mailto', path: email, queryParameters: {subject: body});
    return await _launchURL(_emailLaunchUri.toString());
  }

  @override
  Future<bool> launchSMS(String phoneNumber) async{
    final Uri _phoneLaunchUri = Uri(scheme: 'sms', path: phoneNumber);
    return await _launchURL(_phoneLaunchUri.toString());
  }

  @override
  Future<bool> launchTel(String phoneNumber) async{
    final Uri _phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);
    return await _launchURL(_phoneLaunchUri.toString());
  }

  @override
  Future<bool> launchUrl(String url) async{
    return await _launchURL(url);
  }

  Future<bool>_launchURL(String value) async {
    if (await canLaunch(value)) {
      await launch(value);
      return true;
    } else {
      throw 'Could not launch $value';
    }
  }

}