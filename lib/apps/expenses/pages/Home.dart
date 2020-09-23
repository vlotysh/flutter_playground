import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:playground/apps/expenses/entities/Transaction.dart';
import 'package:playground/apps/expenses/widgets/Chart.dart';
import 'package:playground/apps/expenses/widgets/CreateTransaction.dart';
import 'package:playground/apps/expenses/widgets/TransactionList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [
    Transaction(id: 'td1', amount: 23.99, title: 'Milk', date: DateTime.now()),
    Transaction(id: 'td2', amount: 12.99, title: 'Apple', date: DateTime.now())
  ];

  bool _showChart = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this); // init listener
    // TODO: implement initState
    super.initState();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) { // call from WidgetsBinding.instance.addObserver(this)
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);  // remove listener
    super.dispose();
  }

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((Transaction element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount, DateTime date) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: date);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((item) => item.id == id);
    });
  }

  void startAddNewTransaction(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: CreateTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Widget> _buildLandscapeContent(MediaQueryData mediaQuery,
      PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Show chart', style: Theme.of(context).textTheme.title),
          Switch.adaptive(
              activeColor: Theme.of(context).accentColor,
              value: _showChart,
              onChanged: (value) {
                setState(() {
                  _showChart = value;
                });
              })
        ],
      ),
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(_recentTransaction))
          : txListWidget
    ];
  }

  List<Widget> _buildPortraitContent(MediaQueryData mediaQuery,
      PreferredSizeWidget appBar, Widget txListWidget) {
    return [
      Container(
          height: (mediaQuery.size.height -
                  appBar.preferredSize.height -
                  mediaQuery.padding.top) *
              0.3,
          child: Chart(_recentTransaction)),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    PreferredSizeWidget _buildAppBar() {
      return Platform.isIOS
          ? CupertinoNavigationBar(
              middle: const Text('Expanses'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min, // get as need
                children: <Widget>[
                  GestureDetector(
                    child: const Icon(CupertinoIcons.add),
                    onTap: () => startAddNewTransaction(context),
                  )
                ],
              ),
            )
          : AppBar(
              title: Text('Expanses'),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => startAddNewTransaction(context),
                )
              ],
            );
    }

    final PreferredSizeWidget appBar = _buildAppBar();

    final txListWidget = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: TransactionList(_userTransactions, _removeTransaction));

    final body = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (isLandscape)
              ..._buildLandscapeContent(mediaQuery, appBar, txListWidget),
            if (!isLandscape)
              ..._buildPortraitContent(mediaQuery, appBar, txListWidget),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            resizeToAvoidBottomInset: false, // fix keyboard indent
            child: body,
            navigationBar: appBar,
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            // fix keyboard indent
            resizeToAvoidBottomPadding: false,
            //
            appBar: appBar,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => startAddNewTransaction(context),
                  ),
            body: body);
  }
}
