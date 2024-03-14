#include <iostream>
#include "structure.h"
#include <list>
#include <iterator>

using namespace std;

int main(){
    // Ovo je sve test
    // LinkedList* list1 = new LinkedList();
    // list1->add(10);
    // list1->add(20);
    // list1->add(1, 30);
    // list1->add(1, 40);
    // int niz[] = {1, 2, 3, 4, 5, 6, 7};
    // list1->addAll(niz, 7);
    // list1->addAll(2, niz, 7);
    // list1->addFirst(99);
    // list1->show();

    // cout << list1->lastIndexOf(7) << endl;
    // list<int>::iterator it = list1->listIterator(5);

    // list1->offer(10);
    // list1->show();
    // cout << list1->peekLast() << endl;

    // cout << list1->pollLast() << endl;
    // list1->show();

    // list1->remove(2);
    // list1->show();
    
    // list1->set(5, 55);
    // list1->show();

    // LinkedList* list2 = list1->clone();
    // list2->show();

    // list1->clear();
    // list1->show();

    LinkedList* l1 = new LinkedList();
    l1->add(1);
    l1->add(2);
    l1->add(1);
    l1->add(3);
    l1->add(1);

    l1->show();

    l1->removeDuplicates();
    l1->show();
    
    return 1;
}
