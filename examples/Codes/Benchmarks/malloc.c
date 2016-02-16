#include "soft_malloc.c"

int main()
{
   char *str;

   /* Initial memory allocation */
   str = (char *) soft_malloc(15);
   strcpy(str, "tutorialspoint");
   printf("String = %s,  Address = %u\n", str, str);

   free(str);
   
   return(0);
}
