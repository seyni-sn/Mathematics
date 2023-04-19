︠ed19f9c6-f1fc-4fbb-8b7f-256a67d0d43bs︠
l = [2, 4, 6 , 8, 10]

d = min( p//2 for p in l)

d
︡8dfad568-fa79-43ea-b055-6f3bb52b657c︡{"stdout":"1\n"}︡{"done":true}
︠8ed87bc2-b05f-41c4-b661-1424b9cb0141s︠

#R.<x ,y ,z > = PolynomialRing ( QQ , 'x,y,z', order ='lex')

R.<x ,y ,z > = PolynomialRing ( QQ , 'x,y,z', order ='degrevlex')




︡e1fb6f75-8a35-44c6-993c-aca6fd82bb69︡{"done":true}
︠ee14cb63-5b17-422d-bdf2-4c496feee3f2s︠


RING = PolynomialRing ( QQ , 3 , "x ,y , z" , order = "lex" )
#RING = PolynomialRing ( QQ , 2 , "x ,y" , order = "lex" )
x, y, z = RING.gens()

P = x^2*y + x*y^2 + y^2
P
G_1 = x*y - 1; G_2 = y^2 - 1

Gs = [G_1, G_2]
Gs

︡fb02f4a1-e00b-40ab-aa7b-ed99a1da94cc︡{"stdout":"x^2*y + x*y^2 + y^2\n"}︡{"stdout":"[x*y - 1, y^2 - 1]\n"}︡{"done":true}
︠5dd4918e-ae01-48f3-90da-a5003047c176s︠
P = x^2*y + x*y^2 + y^2
P
G_1 = x*y - 1; G_2 = y^2 - 1

Gs = [G_1, G_2]
Gs

def funcDivisionPolynomial(P, Gs, RING):# P est le polynome a diviser et Gs = [G_1,G_2 ....] une liste de diviseur, et RING l'anneau de polynomes
    F = RING(P)
    l = len(Gs)# l est la longueur de la liste de diviseur
    Qs = l*[RING(0)] #Qs une liste de quotient initialiser a zeroes
    R = RING(0) # le reste
    while F != 0:
        i = 0
        test_division = False
        while i < l and test_division== False:
            if Gs[i].lt().divides(F.lt()):# si LT(G_i) divise LT(F)
                q= F.lt()//Gs[i].lt()
                Qs[i] += q
                F = F - q * Gs[i]
                test_division = True
            else:
                i += 1
        if test_division == False:
            r = F.lt()
            R += r
            F -= r
    return Qs, R

funcDivisionPolynomial(P, Gs, RING)
︡1c4d6865-9ac7-4b81-8e21-302b55a67595︡{"stdout":"x^2*y + x*y^2 + y^2\n"}︡{"stdout":"[x*y - 1, y^2 - 1]\n"}︡{"stdout":"([x + y, 1], x + y + 1)\n"}︡{"done":true}
︠466f8b1f-33ec-4de0-830e-f57e4b89aa0f︠
P = x^2*y + x*y^2 + y^2
Q = x*y - 1

def funcMcm(P, Q, RING):# Cette fonction retourn le ppcm(LM( P), LM( Q))
    u = P.lm().degrees()
    v = Q.lm().degrees()
    w = []
    for i in range (0, len(u)):
        w.append(max(u[i], v[i]) )
    A = x^w[0]*y^w[1]*z^w[2]
    return A

P.lm().degrees()

Q.lm().degrees()

funcMcm(P, Q, RING)



︡5fd4cbd4-dec1-4d6d-840d-1d076138948a︡{"stdout":"(2, 1, 0)\n"}︡{"stdout":"(1, 1, 0)\n"}︡{"stdout":"x^2*y\n"}︡{"done":true}
︠07c09083-4c2d-490c-9217-a5a220f4c07fs︠


def funcSpolynome(P, Q, RING):
    p = funcMcm(P.lt(), Q.lt(), RING) #calcule du ppcm(LM( P), LM( Q))
    S = (p.quo_rem(P.lt())[0])*P - (p.quo_rem(Q.lt())[0])*Q #Calcule du S-polynôme de P et Q
    return S# retourn le S-polynôme de P et Q

funcSpolynome(P, Q, RING)
︡13d52145-0ef8-46b9-8dcd-fde7959dcd20︡{"stdout":"x*y^2 + x + y^2\n"}︡{"done":true}
︠7a7a9286-f295-42bc-84ea-eb4b35e41e92s︠

#Gs = [y^2 + x, x*y]

Gs = [y^2 + x, x*y]

#Gs = [x^2 + y^2 - 1, x*y -1/2]







def funcBuchberger(Gs, RING):
    l = len(Gs)
    i = 0
    j = 0
    for i in [0 .. l - 2]:
        for j in [i + 1 .. l - 1]:
            S = funcSpolynome(Gs[i],Gs[j], RING) #calcule du S-polynôme de P et Q Spoly( G_i, G_j) i != j
            #print S
            R = funcDivisionPolynomial(S, Gs, RING)[1] # calcule Spoly( G_i, G_j) modulo Gs
            #print r
            if R != 0:# si Spoly( G_i, G_j) != 0 modulo Gs
                return funcBuchberger(Gs + [R], RING)# on fait une appel recursive cette fois ci sur sur la liste Gs+[R] =[G_1, ..., G_l, R]
    return Gs# retourne une base de Grobner



funcBuchberger(Gs, RING)

︡0f998ca3-c8c1-4b0e-9ca7-c1e4187f0017︡{"stdout":"[y^2 + x, x*y, x^2]\n"}︡{"done":true}
︠c578bf6a-60d2-425d-bf19-33734afed21ds︠

Gs = funcBuchberger(Gs, RING)

def funcReduction(Gs, RING):
    Gsc = copy ( Gs )
    Gs1 = []

    while len(Gsc) > 0:
        d = min(p.degree() for p in Gsc)
        #P = (p for p in Gsc and p.degree() == d)
        P = RING(0)
        for p in Gsc:
            if p.degree() == d:
                P = p
                break
        Gs1.append(P)
        #Gsc = [G for G in Gsc and G.lm().quo_rem(P.lm())[1] != o]
        Gscc = []
        for G in Gsc:
            if G.lm().quo_rem(P.lm())[1] != 0:
                Gscc.append(G)
        Gsc = Gscc

    Gs2 = []
    #Gs11 = [G for G in Gs1 and G not in Gs]
    Gs11 = []
    for G in Gs1:
        if G not in Gs:
            Gs11.append(G)
    for G in Gs1:
        R = funcDivisionPolynomial(G, Gs11, RING)[1]
        Gs2.append(R)
    return Gs2

funcReduction(Gs, RING)
︡65a76fd0-1e52-49f8-801e-a3e3cd4f0062︡{"stdout":"[x + y^2, x*y, x^2]\n"}︡{"done":true}









