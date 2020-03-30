#include <iostream>
#include "SingletonInstance.h"

int main(){
    std::cout << "hello world.\n";
    SingletonInstance::instance()->info();
    return 0;
}