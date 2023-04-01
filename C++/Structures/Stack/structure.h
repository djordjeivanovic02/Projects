#include <iostream>

using namespace std;

struct Stack{
    int max_size;
    int top;
    int* arr;

    Stack(){
        this->top = -1; //postavlja se na -1
        this->arr = nullptr;
    }
    Stack(int max_size){
        this->top = -1;
        this->max_size = max_size;
        this->arr = new int[max_size];
    }
    void push(int data){
        if(this->top < this->max_size)
            this->arr[++this->top] = data;
        else 
            cout << "Stack is full!" << endl; 
    }
    int pop(){
        if(this->top >= 0)
            return this->arr[this->top--];
        cout << "Stack is empty!" << endl;
        return 0;
    }
    int peek(){
        if(this->top >= 0)
            return this->arr[this->top];
        cout << "Stack is empty!" << endl;
        return 0;
    }
    bool isFull(){
        return this->top == this->max_size-1;
    }
    bool isEmpty(){
        return this->top == -1;
    }
    void show(){
        for(int i = this->top; i >= 0; i--)
            cout << this->arr[i] << endl;
    }
};