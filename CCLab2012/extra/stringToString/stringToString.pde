//Load text file into an array
String lines[] = loadStrings("theText.txt");

println("there are " + lines.length + " lines");

for (int i =0 ; i < lines.length; i++) {
  println("line "+ i + ": "+ lines[i]);
}

//Checking lines for different chapters
int isChapter []= {};
String chapterName = "Chapter";
for (int i = 0; i < lines.length; i++) {
  String chapterCheck = lines[i].substring(0, 7);
  println(chapterCheck);
  if (chapterCheck.equals(chapterName)) {
    isChapter = append(isChapter, 1);
  } else {
    isChapter = append(isChapter, 0);
  }
}

//how many in the isChapter array
println("there are " + isChapter.length + " isChapters");

//shows which string is the chapter marker
for (int i =0 ; i < isChapter.length; i++) {
  println("isChapter "+ i + ": "+ isChapter[i]);
}

//Combining the many lines of each chapter into a single chapter

for (int i = 0; i < lines.length; i++) {
 if (isChapter[i] == 0) {
   
   lines[i-1] = lines[i-1] + " " + lines[i];
   println("line "+ i + ": "+ lines[i-1]);
 }
  
}


//println("there are " + lines.length + " lines");
//
//for (int i =0 ; i < lines.length; i++) {
//  println("line "+ i + ": "+ lines[i]);
//}
