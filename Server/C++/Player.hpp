// A2DD.h
#ifndef A2DD_H
#define A2DD_H

#include <stdio.h>
#include <stdlib.h>
//#include <iostream>
#include <string>
#include <SFML/Graphics/Sprite.hpp>
#include <SFML/Graphics/RectangleShape.hpp>
#include <SFML/Window/Event.hpp>

class Player{

    protected:
    sf::Sprite sprite;
    std::string name;
    double health;
    double mana;
    int ammo;
    sf::Vector2f selectorSize;
    sf::RectangleShape selector;

    public:
    Player(std::string, double, double, int, sf::Vector2f);
    double getHealth();
    void increaseHealth(double);
    void decreaseHealth(double);
    double getMana();
    void increaseMana(double);
    void decreaseMana(double);
    int getAmmo();
    void increaseAmmo(double);
    void decreaseAmmo(double);
    sf::Vector2f getPos();
    std::string getName();
    void moveSelector();
    int levelValue(double x, double y){
        int a = (int) x;
        int b = (int) y;
        if (a % b != 0){
            int factor = a % b;
            //std::cout << "A:\t" << a << "\tB:\t" << b << "\tRemainder:\t" << factor << "\tReturn:\t" << a - factor << std::endl;
            return (int) a - factor;
        } 
        else{
            return (int) a;
        } 
    } 
};

#endif