#include<stdio.h>
int calop(char op,int num1,int num2){
	if(op=='+')
		return num1+num2;
	else
		return num2-num1;

}
int isdig(char i){
	if (i<='9'&&i>='0')
		return 1;
	else
		return 0;	
}
int main(){
	char exp[20];
	int num[20];
	char op[20];
	int ptrnum=0;
	int ptrop=0;
	int flag = 0;
	char before = '0';
	scanf("%s",exp);
	for (int i=0;exp[i];i++){
		if(isdig(i))
			if(flag){
				flag = 0;
				num[ptrnum++] = -(i-'0');
			}
			else
				num[ptrnum++]=i-'0';
		else if(i=='(' || i=='+')
			op[ptrop++]=i;
		else if(i==')'){
			if(op[ptrop]!='('){	//这里不写while是因为最多仅一括号
				char cal = op[ptrop--];
				int num1 = num[ptrnum--];
				int num2 = num[ptrnum--];
				num[ptrnum++] = calop(cal,num1,num2);
			}
			op[ptrop--]='\0';
		}
		else{
			if(before == '(')
				flag = 1;
			else
				op[ptrop--]='-';
		
		}
		before = i;	
		
	}

	printf("%d\n",num[0]);
}
