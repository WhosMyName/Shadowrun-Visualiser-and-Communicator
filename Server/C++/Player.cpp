#include "Player.hpp"

double Player::getHealth(){
    return this->health;
}

void Player::increaseHealth(double heal){
    this->health = this->health + heal;
}
void Player::decreaseHealth(double damage){
    this->health = this->health - damage;
}

double Player::getMana(){
    return this->mana;
}

void Player::increaseMana(double amount){
    this->mana = this->mana + amount;
}

void Player::decreaseMana(double amount){
    this->mana = this->mana - amount;
}

int Player::getAmmo(){
    return this->ammo;
}

void Player::increaseAmmo(double amount){
    this->ammo = this->ammo + amount;
}

void Player::decreaseAmmo(double amount){
    this->ammo = this->ammo - amount;
}

std::string Player::getName(){
    return this->name;
}

sf::Vector2f Player::getPos(){
    return this->sprite.getPosition();
}

void Player::moveSelector(){ //Trigger on Left Click
    this->selector.setPosition(Player::levelValue(sf::Mouse::getPosition().x, this->selectorSize.x), Player::levelValue(sf::Mouse::getPosition().y, this->selectorSize.y));
}

Player::Player(std::string n, double h, double m, int a, sf::Vector2f size){
    this->name = n;
    this->health = h;
    this->mana = m;
    this->ammo = a;
    this->selectorSize = size;
    this->selector.setSize(this->selectorSize);
    this->selector.setOutlineThickness(-3);
    this->selector.setOutlineColor(sf::Color::Black);
    this->selector.setOrigin(0,0);
    this->selector.setFillColor(sf::Color::Transparent); 
}

