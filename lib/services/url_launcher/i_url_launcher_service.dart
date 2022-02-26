abstract class IUrlLauncherService{

  Future<bool> launchTel(String phoneNumber);

  Future<bool> launchUrl(String url);

  Future<bool> launchEmail(String email, String subject, String body);

  Future<bool> launchSMS(String phoneNumber);

}