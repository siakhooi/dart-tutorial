import 'dart:async';
import 'arguments.dart';

class HelpCommand extends Command {
  HelpCommand(){
    addFlag(
      'verbose',
      abbr: 'v',
      help: 'Prints verbose usage for the specified command.',
    );
  }

  @override
  String get name => 'help';

  @override
  String get description => 'Prints usage information to the command line.';

  @override
  String? get help => 'Prints this usage information';

  @override
  FutureOr<Object?> run(ArgResults args) async {
    var usage = runner.usage;
    for (var command in runner.commands){
      usage += '\n ${command.usage}';
    }

    return usage;
  }
}
