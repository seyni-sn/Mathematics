def afficheprime(n):
    p = 1
    for i in range(1,n):
        p=next_prime(p)
        print(p)

def listdiviseurprime(n):
    p = 1
    l=[]
    for i in range(1,n):
        p=next_prime(p)
        l.append(p)
    return l


def listfacteurpremier(n):
    l0 = []
    l1 = listdiviseurprime(n)
    for i in range(1, len(l1)):
        if (n%l1[i] == 0):
            l0.append(l1[i])
    return l0

def listexposant(n):
    l0 = []
    l1 = listfacteurpremier(n)
    for i in range(1, len(l1)):
        cmpt=1
        p=l1[i]
        while (n%p == 0):
            p = p*p
            compt + = 1
            l0.append(compt)
    return l0




def affichfactorprime(n):
    l0 = []
    l1 = []
    c=factor(n)
    for i in range(len(c)):
        a,b =(c[i])
        l0.append(a)
        l1.append(b)
    print(l0)
    print(l1)



affichfactorprime(factorial(15))
x=199
print(x.digits())


def testpuissanceme(n):
    if (n>=10000 & n<=99999):
        l=[]
        l = n.digits()
        l1=[]
        s=0
        for i in range(len(l)):
            r=(l[i])^5
            l1.append(r)
            s += l1[i]
    return s == n



y=[10000..99999]
for n in y:
    if testpuissanceme(n):
        print(n)

def bezoutab(a,b,c):
    d=gcd(a,b)
    if d==c:
        d,u,v=xgcd(a,b)
        L=[d,u,v]
    else:
        r= c/d
        d,u,v=xgcd(r*a,r*b)
        L=[d,u,v]
    return L

L=bezoutab(12357,456, 15)
print(L)
gcd(5*12357,5*456)

y = var('y')
x = var('x')
f = x^2 + 17*y^2
f.diff(x)
f.diff(y)


def derrivedefx():
    x = var('x')
    f = x^3*sin(2*x) + cos(x^3 + 2)
    return f.diff(x)

derrivedefx()

def montrerfpair():
    x = var('x')
    f = x^2*cos(x) + 1
    g = f(-x)
    if(f == g):
        print('f est pair')
    else:
        print('f n\'est pair')

montrerfpair()

def resoudremodulo(a1,a2,n1,n2):
    x = var('x')
    x = crt(a1, a2, n1, n2)
    return x

resoudremodulo(9,3,17,45)

def valeurapprocherpi(n):
    p = numerical_approx(pi, digits=n+1)
    return p

valeurapprocherpi(30)
#taylor ?

def DLordeNpoint0(od,pt):
    x = var('x')
    f = x^3*sin(2*x) + cos(x^3 + 2)
    return taylor(x,pt,od)

DLordeNpoint0(4,0)


def suitefonction1(n):
    alpha = var('alpha')
    u0=alpha
    i=1
    while(i<=n):
        u1=(u0+alpha/u0)*0.5
        #u0=u1
    return u1
