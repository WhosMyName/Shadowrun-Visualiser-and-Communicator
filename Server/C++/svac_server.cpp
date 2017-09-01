#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <sstream>
#include <fstream>
#include <iomanip> 
#include <iostream>
//#include <map>
#include "base64.cpp"
#include <openssl/md5.h>
#include <chrono>
#include <SFML/Graphics.hpp>
#include "Player.cpp"


sf::RenderWindow window;
sf::Event event;
sf::Font font;
sf::Text text;
std::string fontfile = "hachicro.ttf" ;
int w = 1650;
int h = 720;


#define swifty(name) #name

std::string stringToBase64(std::string inputstring){
    std::vector<BYTE> input(inputstring.begin(), inputstring.end());
    return base64_encode(&input[0], input.size());
}

std::string base64ToString(std::string inputstring){
    std::vector<BYTE> decodedData = base64_decode(inputstring);
    std::string output(decodedData.begin(), decodedData.end());
    return output;
}
/*
class Runner{
    std::map<std::string,std::string> members;
    
    Runner(std::string runnername){//Initializes Runner
        std::string savename(runnername + ".charsheet");
        std::fstream inputfile(savename.c_str(), std::fstream::in | std::fstream::out);
        std::string line;
        while (std::getline(inputfile, line)){
            line = base64ToString(line);
            members.insert(line.substr(0, (line.find(":") - 1)), line.substr((line.find(":") + 1), line.length()));
        }
    }  
    
}; 
*/
std::string toMD5(std::string inputstring){
    unsigned char result[MD5_DIGEST_LENGTH];
    MD5((unsigned char*)inputstring.c_str(), inputstring.size(), result);

    std::stringstream ss;
    ss << std::hex << std::setfill('0');
    for(auto c: result){
        ss << std::setw(2) << c;
    }
    return ss.str();
}

std::string checkUser(std::string md5digest){
    std::fstream inputfile("autho.rize", std::fstream::in | std::fstream::out);
    std::string line;
    while (std::getline(inputfile, line)){
        std::istringstream iss(line);
        if (iss.str().find(md5digest) != std::string::npos){
            return iss.str();
        }
    }
    return "Error: User not found";
}

int main(){
    window.create(sf::VideoMode(w, h, 32), "Ye Unum Aedis Scriptum Casus"); //Creates Window
    window.setFramerateLimit(30);
    if (!font.loadFromFile(fontfile)){ //Loads Font
    std::cout << "Could not Load font !" << std::endl;
    }
    else{
        //Initialize all Font related Vars
    }
    while (window.isOpen()){    // run the program as long as the window is open 
        while (window.pollEvent(event)){
            if (event.type == sf::Event::Closed || sf::Keyboard::isKeyPressed(sf::Keyboard::Escape)){
                window.clear(sf::Color::Black);
                window.close(); // "close requested" event: we close the window                
            }
            //Call all important Functions here
        }
    }
    std::cout << base64ToString("eJxjYBj6gBeIeZAwH5H6OIFYBQvmooEbBwoAAO2gAQc=") << std::endl;
    //checkUser(toMD5("gg"));
    //std::cout << swifty(checkUser) << std::endl;
    exit(0);
}

