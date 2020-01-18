import 'package:flutter/material.dart';
import 'package:m08_state_management_overview/examples/example_bloc/bloc_example.dart';
import 'package:m08_state_management_overview/examples/example_provider/provider_example.dart';
import 'package:m08_state_management_overview/examples/example_provider/selector_example.dart';
import 'package:m08_state_management_overview/examples/example_provider/value_notifiers/value_notifier_no_type_restrictions.dart';
import 'package:m08_state_management_overview/examples/example_provider/value_notifiers/value_notifier_one_per_type.dart';
import 'package:m08_state_management_overview/examples/example_scoped_model/scoped_example.dart';
import 'package:m08_state_management_overview/examples/example_set_state/set_state_example.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final PageView pageView = PageView(
    children: <Widget>[
      const SetStateDemo(),
      ScopedModelExamplePage(
        exampleModelInstanceForTheGreenModel: ExampleGreenModelObject(),
        exampleModelInstanceForTheBlueModel: ExampleBlueModelObject(),
      ),
      const ProviderAppExample(),
      const SelectorAppExample(),
      BlocExample(),
      const ValueNotifierOnePerTypeApp(),
      const ValueNotifierNotRestrictedToTypeApproachApp(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return pageView;
  }
}