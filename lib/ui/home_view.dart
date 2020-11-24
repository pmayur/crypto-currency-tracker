import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'add_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double _heightOfHeader = MediaQuery.of(context).size.height * 0.4;

    cryptoPortfolioItem(IconData icon, String name, double amount, double rate,
            String percentage) =>
        Card(
          elevation: 1.0,
          child: InkWell(
            onTap: () {
              print('clickclick');
              _scaffoldKey.currentState.openDrawer();
            },
            child: Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0, right: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Image.network("https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1547033579"),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Text("\$$amount",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("$rate BTC",
                                style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal)),
                            Text("+ \$$percentage",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.red[500],
                                ))
                          ],
                        )
                      ],
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
        );

    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        width: 150,
        child: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              DrawerHeader(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 100,
                      ),
                      Text('mayur@gmail.com')
                    ],
                  ),
                ),
              ),
              ListTile(
                title: Text('Add Coin'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddView(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Remove Coin'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SafeArea(
                    child: ListTile(
                      title: Text('Log Out'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Container(
              height: _heightOfHeader,
              padding: EdgeInsets.only(top: 55, left: 20, right: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF095759),
                    const Color(0xFF4f97af),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      ),
                      Spacer(),
                      Text(
                        "YOUR PORTFOLIO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Spacer(),
                          Text(
                            r" $43,729.00",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Text(
                            r"+ $3,157.67 (23%)",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Spacer(
                            flex: 2,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: _heightOfHeader - 35,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // FontAwesomeIcons.btc
                        // https://assets.coingecko.com/coins/images/976/thumb/Tezos-logo.png?1547034862
                        cryptoPortfolioItem(FontAwesomeIcons.btc, "BTC", 410.80,
                            0.0036, "82.19(92%)"),
                        cryptoPortfolioItem(FontAwesomeIcons.ethereum, "ETH",
                            1089.86, 126.0, "13.10(2.3%)"),
                        cryptoPortfolioItem(FontAwesomeIcons.xRay, "XRP",
                            22998.13, 23000, "120(3.6%)"),
                        cryptoPortfolioItem(FontAwesomeIcons.btc, "BTC", 410.80,
                            0.0036, "82.19(92%)"),
                        cryptoPortfolioItem(FontAwesomeIcons.ethereum, "ETH",
                            1089.86, 126.0, "13.10(2.3%)"),
                        cryptoPortfolioItem(FontAwesomeIcons.xRay, "XRP",
                            22998.13, 23000, "120(3.6%)"),
                        cryptoPortfolioItem(FontAwesomeIcons.btc, "BTC", 410.80,
                            0.0036, "82.19(92%)"),
                        cryptoPortfolioItem(FontAwesomeIcons.ethereum, "ETH",
                            1089.86, 126.0, "13.10(2.3%)"),
                        cryptoPortfolioItem(FontAwesomeIcons.xRay, "XRP",
                            22998.13, 23000, "120(3.6%)"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
