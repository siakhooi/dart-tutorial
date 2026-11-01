enum OptionType { flag, option }

class Option {
  Option(this.name, {
    required this.type,
    this.help,
    this.abbr,
    this.defaultValue,
    this.valueHelp,
  });

  final String name;
  final OptionType type;
  final String? help;
  final String? abbr;
  final Object? defaultValue;
  final String? valueHelp;

  String get usage {
    if (abbr != null){
      return '-$abbr,--$name: $help';
    }

    return '--$name: $help';
  }
}

class ArgResults {
  String? command;
  String? commandArg;
  Map<Option, Object?> options = {};

  // Return true if the flag exists and is true.

  bool flag (String name){
    for (var option in options.keys.where(
      (option)=>option.type == OptionType.flag, 
    )) {
      if (option.name == name ){
        return options[option] as bool;
      }
    }
    return false;
  }

  bool hasOption(String name){
    return options.keys.any((option)=>option.name == name);
  }

  ({Option option, Object? input }) getOption(String name) {
    var mapEntry = options.entries.firstWhere(
      (entry)=> entry.key.name == name || entry.key.abbr == name,
    );

    return (option: mapEntry.key, input: mapEntry.value);
  }
}
