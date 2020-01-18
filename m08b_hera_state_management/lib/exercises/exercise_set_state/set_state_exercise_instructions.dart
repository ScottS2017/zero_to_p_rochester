/// 1)
/// Create a class called SetStateExercise that extends StatefulWidget
/// Ensure the constructor is constant, takes a Key called key, calls the super and the super's key parameter is our key

/// 2)
/// In the state, create a private bool called isYellow but do a bad thing here and don't initialize it. We're doing this for a reason.

/// 3)
/// The reason is to force you to use initState(), reinforcing a good habit.
/// In the initState(), instantiate your _isYellow variable to true.

/// 4)
/// Now create a private function that returns void, takes no parameters and uses setState to toggle the bool you just created

/// 5)
/// The build function should return a Scaffold with a orange AppBar and a title that says 'setState Demo'
/// The body of the Scaffold:
/// Container with w&h double.infinity and center alignment > Container w&h 300 with this ternary for the color:
/// _isYellow ? Colors.orange : Colors.grey,
/// Add a orange FAB to the Scaffold that triggers your function that toggles the color variable
/// Use autoRenew for the FAB icon
