// To read in an image: 
// 1. instantiate the PImage class & 
// 2. declare the image object 
PImage backgroundmap;

// An array of arrays of coordinate of a taxi in Vancouver
int[][] coords = {{274,487},{274,487},{318,441},{328,428},{341,419},{353,410},{362,399},{365,392},{407,426},{447,446},{462,455},{506,473},{517,478},{526,484},{547,493},{551,497},{556,503},{559,507},{559,507},{566,512},{566,512},{573,518},{573,518},{581,524},{586,533},{598,542},{598,547},{584,560},{578,568},{567,578},{556,586},{549,597},{529,613},{523,619},{523,619},{521,622},{548,646},{562,658},{566,667},{556,681},{551,685},{534,668},{517,657},{508,648},{501,642},{491,656},{468,680},{457,671},{445,653},{430,636},{414,622},{398,607},{382,595},{350,571},{334,556},{346,544},{359,533},{339,504},{329,493},{319,483},{326,476},{335,468},{342,460},{336,448},{327,443},{315,451},{304,459},{293,466},{288,471},{278,479},{271,488},{267,476},{264,466},{257,456},{247,448},{237,442},{237,442},{231,436},{231,436},{224,430},{201,416},{200,415},{197,396},{200,381},{200,369},{200,369},{198,355},{189,345},{184,339},{201,335},{214,328},{228,324},{248,321},{261,316},{278,308},{314,302},{324,310},{326,313},{336,322},{339,316},{354,310},{361,311},{386,304},{394,298},{420,307},{422,310},{430,321},{437,321},{445,307},{454,296},{476,291},{481,293},{498,294},{507,288},{514,286},{533,284},{548,287},{556,281},{561,277},{561,270},{561,248},{552,254},{547,259},{532,262},{529,261},{511,254},{505,252},{476,244},{463,235},{452,223},{449,222},{419,214},{411,212},{403,207},{390,192},{383,176},{374,161},{353,148},{346,139},{341,128},{338,102},{330,88},{317,76},{306,64},{295,51},{288,84},{285,109},{263,108},{254,97},{260,85},{265,77},{268,63},{262,54},{260,42},{254,36},{237,39},{222,53},{206,62},{186,72},{178,90},{166,99},{153,105},{135,125},{130,150},{140,182},{140,205},{131,222},{120,230},{101,236},{89,256},{86,282},{93,293},{113,302},{133,303},{156,317},{170,328},{178,332},{196,333},{233,324},{264,322},{274,316},{289,301},{306,298},{320,303},{329,323},{331,345},{344,367},{355,378},{372,392},{390,409},{396,420},{414,438},{431,450},{439,460},{452,467},{460,476},{461,478},{448,502},{433,498},{424,490},{409,471},{401,463},{395,459},{393,467},{383,472},{375,467},{369,462},{363,467},{360,471},{360,476},{374,484},{386,495},{388,498},{392,504},{401,512},{402,513},{415,522},{422,532},{423,539},{413,544},{405,550},{396,556},{394,562},{402,567},{416,578},{421,582},{417,598},{397,616},{388,624},{373,632},{369,639},{366,647},{366,652},{376,661},{383,666},{377,676},{365,679},{348,688},{340,693},{333,697},{307,709},{291,717},{269,728},{256,735},{236,743},{228,757},{229,771},{228,782},{241,783},{265,783},{272,783},{275,784},{276,785},{281,800},{284,815},{299,826},{302,824},{310,805},{321,799},{345,784},{355,772},{357,770},{384,744},{387,736},{391,730},{399,725},{404,724},{417,721},{423,716},{432,706},{435,705},{446,698},{452,692},{478,665},{485,658},{487,655},{501,647},{513,632},{525,621},{538,608},{549,598},{556,591},{576,573},{589,551},{595,544},{609,552},{620,573},{632,582},{653,593},{681,599},{701,604},{737,606},{764,603},{765,613},{765,632},{763,650},{764,657},{783,658},{803,664},{804,679},{785,671},{752,663},{727,669},{709,671},{680,671},{661,666},{651,662},{638,649},{619,639},{601,624},{596,620},{589,614},{578,603},{571,594},{564,586}};

// global counter variable i to increment the animation
int i = 0;

// set the size and background color
void setup() {
  size(960, 840);
  background(255);
  // read in the map image
  // Images must be in the "data" directory to load correctly
  backgroundmap = loadImage("backgroundmap_960x840.png");
  
  // reduce the frame rate to slow the animation
  frameRate(20);
}


// the draw function
void draw(){
  // load the image each frame to create animation frame
  image(backgroundmap, 0, 0);
  
  // add annotations
  //  fill(255);
  //  stroke(255);
  //  rect(width*0.60, 35, 500, 50);
  //  
  //  fill(255, 0, 0);
  //  textSize(32);
  //  text("click to show the route", width*0.62, 40, width*0.75, 200);

  // animate the taxi as long as there data data available
  // by incrementing i by 1 each frame
  if(i+1 < coords.length){
    i++;
    fill(255, 214, 46, 75);
    strokeWeight(3);
    stroke(255, 214, 46);
    ellipse(coords[i][0], coords[i][1], 20, 20);
  }
  
  // if the mouse is pressed, draw the entire route of the taxi in red
  if(mousePressed){
    // using a for loop, we iterate through all the data points
    // to draw the whole taxi route 
    for(int j = 0; j < coords.length - 1; j++){
      strokeWeight(4);
      stroke(255, 0, 0, 85);
      // draw a line from position x1, y1 to x2, y2
      line(coords[j][0], coords[j][1], coords[j+1][0], coords[j+1][1]);
    }
  }
}
