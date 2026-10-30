import 'dart:io';

const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty || arguments.first == 'help'){
    printUsage();
  } else if (arguments.first == 'version'){
    print('Dartpedia CLI version $version');
  } else if (arguments.first == 'search'){
    final inputArgs= arguments.length >1 ? arguments.sublist(1): null;
    searchWikipedia(inputArgs);
  } else {
    printUsage();
  }
}

void printUsage(){
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}
void searchWikipedia(List<String>? arguments){
  final String articleTitle;

  if (arguments == null || arguments.isEmpty){
    print('Please provide an article title.');
    articleTitle=stdin.readLineSync()??'';
  }else {
    articleTitle = arguments.join(' ');
  }

  print('seachWikipedia received arguments: $articleTitle');
  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');

}
