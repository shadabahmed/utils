#include<stdio.h>
void par(int open,int close,int n,int idx)
{
  static char a[1000];
  if(close==n)
  {
    printf(a);
    return;
  }
  if(close<open)
  {
    a[idx]=")";
    par(open,close+1,n,idx+1,a);
  }
  if(open<n)
  {
    a[idx]="(";
    par(open+1,close,n,idx+1,a
  } 
}

void main(){

  par(3);
}
