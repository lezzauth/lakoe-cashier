import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class THelper {
  static Future<Iterable<Contact>?> getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      return contacts;
    }

    return null;
  }
}
