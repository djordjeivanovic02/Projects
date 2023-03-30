#include <iostream>
#include "structure.h"

using namespace std;

int main(){
    LinkedList* list1 = new LinkedList();
    list1->add(10);
    list1->add(20);
    list1->add(1, 30);
    list1->add(1, 40);
    int niz[] = {1, 2, 3, 4, 5, 6, 7};
    list1->addAll(niz, 7);
    list1->addAll(2, niz, 7);
    list1->addFirst(99);
    list1->show();

    cout << list1->lastIndexOf(7) << endl;

    // LinkedList* list2 = list1->clone();
    // list2->show();

    // list1->clear();
    // list1->show();

    
    return 1;
}