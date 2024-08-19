import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_body_s.dart';
import 'package:point_of_sales_cashier/common/widgets/ui/typography/text_heading_4.dart';
import 'package:point_of_sales_cashier/utils/constants/colors.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';
import 'package:point_of_sales_cashier/utils/helpers/helper.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> _contacts = [
    Contact(displayName: "Umum", phones: [
      Item(label: "-", value: "-"),
    ]),
  ];

  Future<void> getContacts() async {
    try {
      var contacts = await THelper.getContacts();
      if (contacts != null) {
        setState(() {
          _contacts = [
            Contact(displayName: "Umum", phones: [
              Item(label: "-", value: "-"),
            ]),
            ...contacts
          ];
        });
      }
      print('aowekoek');
    } catch (e) {
      print('getContacts');
      print(e);
      // Fluttertoast.showToast(msg: "Cannot get contacts permission");
    }
  }

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: (context, index) {
        Contact contact = _contacts.elementAt(index);

        return ListTile(
          leading: SvgPicture.asset(
            TImages.contactAvatar,
            height: 40,
            width: 40,
          ),
          title: TextHeading4(contact.displayName ?? ""),
          subtitle: TextBodyS(
            contact.phones!.isNotEmpty ? contact.phones!.first.value! : '-',
            color: TColors.neutralDarkLight,
          ),
        );
      },
    );
  }
}
