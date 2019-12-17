num = []
op = []

exp = "((-1)+(-4-(2+3)))"
flag = False

def cal(operator,num1,num2):
    if(operator == '+'):
        return int(num1) + int(num2)
    else:
        return int(num2)-int(num1)
before = ' '
for i in exp:
    if(i.isdigit()):
        if (flag):
            num.append(-int(i))
            flag = False
        else:
            num.append(int(i))
    elif(i=='(' or i == '+'):
        op.append(i)
    elif(i==')'):
        while(op[-1]!='('):
            operator = op.pop(-1)
            num1 = num.pop(-1)
            num2 = num.pop(-1)
            num.append(cal(operator,num1,num2))
        op.pop(-1)
        
    else:
        if(before =='('):
            flag = True
        else:
            op.append('-')
    before = i
        


