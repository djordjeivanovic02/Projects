#include <iostream>
#include "structure.h"

using namespace std;

int main(){
    Stack* stack = new Stack(100);
    stack->push(1);
    stack->push(2);
    stack->push(3);
    stack->show();
    cout << stack->peek() << endl;
    stack->show();

    return 1;
}