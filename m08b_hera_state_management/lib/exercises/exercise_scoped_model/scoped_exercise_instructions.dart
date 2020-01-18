/// 1)
/// Create a class called ScopedModelExerciseModel that extends Model.
/// "getset" a bool called isOrange.
/// Create a void function called toggleScopedModelColor that takes no parameters, toggles _isOrange and notifies listeners.

/// 2)
/// Create a class called ScopedModelAppExercise that extends StatelessWidget (MATERIAL)
/// Declare a ScopedModelExerciseModel named model.
/// Ensure the constructor is constant (requires final fields), requires the model parameter, takes a Key called key, calls the super and the super's key parameter is our key
/// The build method returns a ScopedModel of type ScopedModelExerciseModel, its model parameter is our model variable
/// The child of the ScopedModel should be a MaterialApp with it's home set to ScopedModelExerciseHome (create that next)

/// 3)
/// Create a class called ScopedModelExerciseHome, extending StatelessWidget
/// Create a constant constructor with a Key and use that key in a call to super. (This approach should be you default for any Widget)
/// The build method returns a Scaffold with an orange Appbar and the title text is "ScopedModel Demo"
/// The body is a container wdi, hdi, align center
/// Child is a ScopedModelDescendant of type ScopedModelExerciseModel.
///   The builder's parameters should be our context, child (used for things outside our lesson scope) and, most importantly, our model that we
///
///
///   should return a container with height and width of 300 and use the following ternary for the color:
///   color: model.isOrange == true ? Colors.orange : Colors.orange,
///   ****************
/// For the floatingActionButton: Add another ScopedModelDescendant of type ScopedModelExerciseModel
///   Again, the parameters are context, child and model
///   The builder should return an orange FAB that calls model.toggleScopedModelColor (no parenthesis) when triggered
///   Use autoRenew for the icon
