#include <stdio.h>

int func(int param1 ,int param2,int param3)
{
        int var1 = param1;
        int var2 = param2;
        int var3 = param3;
 
 
        return var1;
}
 
int main(int argc, char* argv[])
{
        int result = func(1,2,3);
 
        return 0; 
}