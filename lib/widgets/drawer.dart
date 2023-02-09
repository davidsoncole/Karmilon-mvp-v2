import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:karmilon/providers/get_auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, void Function() linkHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: const Color(0xff00966B),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xff00966B),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: linkHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<GetAuth>(context);
    return Drawer(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 90.0, 20.0, 20.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset('assets/avatar2.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          '${userData.lastName} ${userData.firstName}',
                          style: const TextStyle(
                            color: Color(0xff00966B),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          userData.email,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            buildListTile('Dashboard', Icons.dashboard_outlined, () {
              Navigator.of(context).pushNamed('/dashboard_screen');
            }),
            buildListTile('Transaction', Icons.insert_chart_outlined, () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/transaction_screen');
            }),
            buildListTile('Wallet', Icons.account_balance_wallet_outlined, () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/wallet_screen');
            }),
            // buildListTile('Get cash', Icons.monetization_on_outlined, () {
            //   Navigator.of(context).pushNamed('/convert_screen');
            // }),
            // buildListTile('Transfer airtime', Icons.card_giftcard_outlined, () {
            //   Navigator.of(context).pushNamed('/transfer_screen');
            // }),
            buildListTile('Buy airtime', Icons.shopping_basket_outlined, () {
              Navigator.of(context).pushNamed('/airtime_screen');
            }),
            buildListTile('Buy airtime', Icons.add_shopping_cart, () {
              Navigator.of(context).pushNamed('/data_screen');
            }),
            buildListTile('Smart topup', Icons.lightbulb_outline, () {
              Navigator.of(context).pushNamed('/smart_screen');
            }),
            // buildListTile('Notification', Icons.notifications_outlined, () {
            //   Navigator.of(context).pushNamed('/notification');
            // }),
            buildListTile('Settings', Icons.settings_outlined, () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/settings_screen');
            }),
          ],
        ),
      ),
    );
  }
}
