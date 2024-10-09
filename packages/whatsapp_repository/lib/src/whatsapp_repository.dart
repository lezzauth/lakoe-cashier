import 'package:whatsapp_repository/src/whatsapp_auth_repository.dart';
import 'package:whatsapp_repository/src/whatsapp_session_repository.dart';

abstract class WhatsappRepository {
  WhatsappSessionRepository get session;
  WhatsappAuthRepository get auth;
}

class WhatsappRepositoryImpl implements WhatsappRepository {
  @override
  WhatsappSessionRepository get session => WhatsappSessionRepositoryImpl();

  @override
  WhatsappAuthRepository get auth => WhatsappAuthRepositoryImpl();
}
