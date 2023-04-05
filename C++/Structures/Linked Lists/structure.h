#include <iostream>
#include <iterator>
#include <list>

using namespace std;

struct Node{
    int data;
    struct Node* next;
    struct Node* prev;

    Node(){
        this->data = 0;
        this->next = this->prev = NULL;
    }
    Node(int data){
        this->data = data;
        this->next = this->prev = NULL;
    }
};
struct LinkedList{
    struct Node* head;
    int size;
    LinkedList(){
        this->head = NULL;
        this->size = 0;
    }
    bool add(int data){
        try{
            struct Node* temp = new Node(data);
            if(this->head == NULL)
                this->head = temp;
            else{
                struct Node* currentNode = head;
                while(currentNode->next != NULL)
                    currentNode = currentNode->next;
                currentNode->next = temp;
                temp->prev = currentNode;
            }
            this->size++;
            return true;
        }catch(exception e){
            return false;
        }
    }
    void add(int index, int data){
        if(index == 0){
            struct Node* temp = new Node(data);
            temp->next = head;
            head->prev = temp;
            head = temp;
            temp->prev = NULL;
            this->size++;
        }
        else if(index == size){
            struct Node* temp = new Node(data);
            struct Node* currentNode = head;
            while(currentNode->next != NULL)
                currentNode = currentNode->next;
            currentNode->next = temp;
            temp->prev = currentNode;
            this->size++;
        }else if(index > 0 && index < size){
            struct Node* temp = new Node(data);
            struct Node* currentNode = head;
            for(int i = 0; i < index-1; i++)
                currentNode = currentNode->next;
            temp->next = currentNode->next;
            temp->prev = currentNode;
            currentNode->next = temp;
            this->size++;
        }
        else
            cout << "Invalid index value!" << endl;
    }
    bool addAll(int* collection, int n){
        for(int i = 0; i < n; i++)
            this->add(*(collection+i));
        this->size += n;
        return true;
    }
    bool addAll(int index, int* collection, int n){
        if(index == 0){
            struct Node* temp = this->head;
            this->head = NULL;
            addAll(collection, n);
            struct Node* currentNode = head;
            while(currentNode->next != NULL) currentNode = currentNode->next;
            currentNode->next = temp;
            temp->prev = currentNode;
        }else if(index == size) addAll(collection, n);
        else if(index > 0 && index < size){
            struct Node* currentNode = head;
            for(int i = 0; i < index-1; i++)
                currentNode = currentNode->next;
            struct Node* temp = currentNode->next;
            currentNode->next = NULL;
            addAll(collection, n);
            currentNode = head;
            while(currentNode->next != NULL) currentNode = currentNode->next;
            currentNode->next = temp;
            temp->prev = currentNode;
        }else
            cout << "Invalid index value!" << endl;
        return true;
    }
    void show(){
        if(this->head != NULL){
            struct Node* currentNode = head;
            while(currentNode != NULL){
                cout << currentNode->data << " <=> ";
                currentNode = currentNode->next;
            }
            cout << "NULL" << endl;
        }else
            cout << "List is empty!" << endl;
    }
    void addFirst(int data){
        struct Node* temp = new Node(data);
        if(this->head != NULL){
            temp->next = this->head;
            this->head->prev = temp;
            this->head = temp;
        }
        else this->head = temp;
        this->size++;
    }
    void addLast(int data){
        add(data);
    }
    void clear(){
        this->head = NULL;
        this->size = 0;
    }
    LinkedList* clone(){
        LinkedList* pom = new LinkedList();
        struct Node* currentNode = this->head;
        while(currentNode != NULL){
            pom->add(currentNode->data);
            currentNode = currentNode->next;
        }
        return pom;
    }
    bool contains(int data){
        struct Node* currentNode = head;
        while(currentNode != NULL){
            if(currentNode->data == data) return true;
            currentNode = currentNode->next;
        }
        return false;
    }
    int element(){
        if(this->head != NULL)
            return this->head->data;
        cout << "list is empty! " << endl;
        return 0;
    }
    int get(int index){
        if(index == 0) return element();
        else if(index > 0 && index < size){
            struct Node* currentNode = head;
            for(int i = 0; i < index; i++)
                currentNode = currentNode->next;
            return currentNode->data;
        }
        cout << "Invalid index value!" << endl;
        return 0;
    }
    int getFirst(){
        return element();
    }
    int getLast(){
        if(this->head != NULL){
            struct Node* currentNode = head;
            while(currentNode->next != NULL)
                currentNode = currentNode->next;
            return currentNode->data;
        }
        cout << "List is empty!" << endl;
        return 0;
    }
    int indexOf(int data){
        if(this->head != NULL){
            struct Node* currentNode = head;
            int i = 0;
            while(currentNode != NULL){
                if(currentNode->data == data) return i;
                i++;
                currentNode = currentNode->next;
            }
            cout << "Element doesn't exist!" << endl;
            return 0;
        }
        cout << "List is empty!" << endl;
        return 0;
    }
    int lastIndexOf(int data){
        if(this->head != NULL){
            struct Node* currentNode = head;
            int pos = 0, i = 0, founded = 0;
            while(currentNode != NULL){
                if(currentNode->data == data) {
                    pos = i;
                    founded = 1;
                }
                currentNode = currentNode->next;
                i++;
            }
            if(founded == 1) return pos;
            cout << "Element doesn't exist!" << endl;
            return 0;
        }
        cout << "List is empty!" << endl;
        return 0;
    }
    list<int>::iterator listIterator(int index){
        list<int> tempList;
        struct Node* currentNode = head;
        int count = 0;
        while(currentNode != NULL){
            if(count >= index){
                tempList.push_back(currentNode->data);
            }
            currentNode = currentNode->next;
            count++;
        }
        return next(tempList.begin(), size-index);
    }
    bool offer(int data){
        add(data);
        return true;
    }
    bool offerFirst(int data){
        addFirst(data);
        return true;
    }
    bool offerLast(int data){
        add(data);
        return true;
    }
    int peek(){
        if(this->head != NULL)
            return this->head->data;
        return 0;
    }
    int peekFirst(){
        return peek();
    }
    int peekLast(){
        if(this->head != NULL){
            struct Node* currentNode = head;
            while(currentNode->next != NULL)
                currentNode = currentNode->next;
            return currentNode->data;
        }
        return 0;
    }
    int poll(){
        if(this->head != NULL){
            struct Node* temp = head;
            head = head->next;
            head->prev = NULL;
            return temp->data;
        }
        return 0;
    }
    int pollFirst(){
        return poll();
    }
    int pollLast(){
        if(this->head != NULL){
            struct Node* currentNode = head;
            while(currentNode->next != NULL)
                currentNode = currentNode->next;
            struct Node* temp = currentNode;
            currentNode->prev->next = NULL;
            currentNode->prev = NULL;
            return temp->data;
        }
        return 0;
    }
    int pop(){
        return pollLast();
    }
    void push(int data){
        add(data);
    }
    int remove(){
        return pollFirst();
    }
    bool remove(int data){
        if(this->head != NULL){
            struct Node* currentNode = this->head;
            while(currentNode->data != data && currentNode->next != NULL)
                currentNode = currentNode->next;
            currentNode->prev->next = currentNode->next;
            currentNode->next = NULL;
            currentNode->prev;
            delete currentNode;
            return true;
        }
        return false;
    }
    int removeFirst(){
        return poll();
    }
    bool removeFirstOccurrence(int data){
        return remove(data);
    }
    int removeLast(){
        return pollLast();
    }
    bool removeLastOccurrence(int data){
        pollLast();
        return true;
    }
    int set(int index, int data){
        if(index == 0){
            struct Node* temp = this->head;
            this->head->data = data;
            return temp->data;
        }else if(index == this->size-1){
            struct Node* currentNode = this->head;
            while(currentNode->next != NULL)
                currentNode = currentNode->next;
            struct Node* temp = currentNode;
            currentNode->data = data;
            return temp->data;
        }else if(index > 0 && index < this->size-1){
            struct Node* currentNode = this->head;
            int count = 0;
            while(currentNode != NULL && count != index){
                currentNode = currentNode->next;
                count++;
            }
            struct Node* temp = currentNode;
            currentNode->data = data;
            return temp->data;
        }
        cout << "List is empty!" << endl;
        return 0;
    }
    int* toArray(){
        int result[this->size];
        int x = 0;
        struct Node* currentNode = head;
        while(currentNode->next != NULL){
            result[x++] = currentNode->data;
            currentNode = currentNode->next;
        }
        return result;
    }
    void removeDuplicates(){
        if(this->head == NULL || this->head->next == NULL)
            return;
        Node* prevNode = this->head;
        Node* currNode = this->head->next;
        while(prevNode->next != NULL){
            while(currNode != NULL){
                if(prevNode->data == currNode->data){
                    Node* tmp = currNode;
                    currNode->prev->next = currNode->next;
                    currNode->prev = tmp->prev;
                }
                currNode = currNode->next;
            }
            prevNode = prevNode->next;
        }
    }
};