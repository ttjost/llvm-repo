#include <string>
#include <iostream>
#include <memory>

struct Person {
	std::string name;
	int age;
	Person(std::string name, int age):
	  name(name), age(age) {
		std::cout << "Constructor from " << name << "\n";
	}
	~Person(){	
		std::cout << "Destructor from " << name << "\n";
	}
};

int main () {

	std::unique_ptr<Person> Pedro = std::make_unique<Person>("Pedro", 20);
	std::unique_ptr<Person> Joao = std::make_unique<Person>("Joao", 30);

	std::cout << "Name: " << Pedro->name << " age: " << Pedro->age  << "\n";
	std::cout << "Name: " << Joao->name << " age: " << Joao->age  << "\n";
	
	Joao = std::move(Pedro);
	std::cout << "Name: " << Joao->name << " age: " << Joao->age  << "\n";
        std::cout << "Name: " << Pedro->name << " age: " << Pedro->age  << "\n";

	return 0;	
}
