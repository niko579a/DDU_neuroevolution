//populationSize: Hvor mange "controllere" der genereres, controller = bil & hjerne & sensorer
int       populationSize  = 100; 

float[] bestWeights = {0,0,0,0,0,0,0,0};

float[] bestBiases = {0,0,0};

float bestLab = 1000;

int resetCounter;

float generation = 1;

//CarSystem: Indholder en population af "controllere" 
CarSystem carSystem       = new CarSystem(populationSize);

//trackImage: RacerBanen , Vejen=sort, Udenfor=hvid, Målstreg= 100%grøn 
PImage    trackImage;

void setup() {
  size(500, 600);
  trackImage = loadImage("track.png");
}

void draw() {
  clear();
  fill(255);
  rect(0,50,1000,1000);
  image(trackImage,0,80);  

  carSystem.updateAndDisplay();
  
  if(resetCounter < frameCount - 500){
    generation ++;
    carSystem = new CarSystem(populationSize); 
    resetCounter = frameCount;
  }

}
