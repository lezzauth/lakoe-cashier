import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:point_of_sales_cashier/utils/constants/bank_name_strings.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

class THelper {
  static Future<Iterable<Contact>?> getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      return contacts;
    }

    return null;
  }

  static String getBankImage(String bankName) {
    switch (bankName) {
      case "bca":
        return TImages.bankBCALogo;
      case "bni":
        return TImages.bankBNILogo;
      case "bri":
        return TImages.bankBRILogo;
      case "bsi":
        return TImages.bankBSILogo;
      case "btn":
        return TImages.bankBTNLogo;
      case "cimb":
        return TImages.bankCIMBLogo;
      case "mandiri":
        return TImages.bankMandiriLogo;
      case "permata":
        return TImages.bankPermataLogo;
      default:
        return TImages.bankBCALogo;
    }
  }

  static String getBankName(String bankName) {
    switch (bankName) {
      case "bca":
        return TBankName.bca;
      case "bni":
        return TBankName.bni;
      case "bri":
        return TBankName.bri;
      case "bsi":
        return TBankName.bsi;
      case "btn":
        return TBankName.btn;
      case "cimb":
        return TBankName.cimb;
      case "mandiri":
        return TBankName.mandiri;
      case "permata":
        return TBankName.permata;
      default:
        return TBankName.bca;
    }
  }
}
