import '../../domain/providers/providers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseProviderImpl extends FirebaseProvider {
  @override
  Future<String> getFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken() ?? '';
    return token;
  }
}
