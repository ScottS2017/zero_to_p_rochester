/// 1)
/// Create a class called ProviderExerciseModel that extends ChangeNotifier.
/// "getset" a bool called isPink. Delete the setter.
/// Create a void function called toggleProviderModelColor that toggles _isPink and notifies listeners.

/// 2)
/// Create a class called ProviderAppExercise that extends StatelessWidget
/// Ensure the constructor is constant, takes a Key called key, calls the super and the super's key parameter is our key
/// The build method returns a ChangeNotifierProvider, its builder calls our ProviderExerciseModel constructor
/// The child of the ChangeNotifierProvider should be a MaterialApp with it's home set to ProviderExerciseHome (create that next)

/// 3)
/// Create a class called ProviderExerciseHome, extending StatelessWidget
/// Create a constant constructor with a Key and use that key in a call to super. (This approach should be you default for any Widget)
/// The build method returns a Scaffold with a red Appbar and the title text is "Provider Demo"
/// The body is a container wdi, hdi, align center
/// Child is a Consumer of type ProviderExerciseModel. Just to help you understand, use "myMadeUpObjectInstanceName" for the second parameter
///   of the builder. The builder should return a container with height and width of 300 and use the following ternary for the color:
///   myMadeUpObjectInstanceName.isPink == true ? Colors.pink : Colors.grey,
/// Add a pink FAB that returns a Provider.of with type ProviderExerciseModel, has listen set to false and calls toggleProviderModelColor
/// Use autoRenew for the icon
