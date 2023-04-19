
########################Donnees de Test #####################################
RING = PolynomialRing ( QQ , 3 , "x ,y , z " , order = " lex " ) #definition de l'anneau des polynomes
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

#Pour tester la fonction
funcDivisionPolynomial(P, Gs, RING)


#############################################################################################


#Calcul des S-polynôme
######Donnees Test##############
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



def funcSpolynome(P, Q, RING):
    p = funcMcm(P.lt(), Q.lt(), RING) #calcule du ppcm(LM( P), LM( Q))
    S = (p.quo_rem(P.lt())[0])*P - (p.quo_rem(Q.lt())[0])*Q #Calcule du S-polynome de P et Q
    return S# retourn le S-polynome de P et Q

funcSpolynome(P, Q, RING)


#################################################################################################3

#Algorithme 2 : Algorithme de Buchberger, definie comme un fonction

#Gs = [y^2 + x, x*y]

Gs = [x^2 + y^2 - 1, x*y -1/2]

def funcBuchberger(Gs, RING):
    l = len(Gs)
    i = 0
    j = 0
    for i in [0 .. l - 2]:
        for j in [i + 1 .. l - 1]:
            S = funcSpolynome(Gs[i],Gs[j], RING) #calcule du S-polynome de P et Q Spoly( G_i, G_j) i != j
            R = funcDivisionPolynomial(S, Gs, RING)[1] # calcule Spoly( G_i, G_j) modulo Gs
            if R != 0:# si Spoly( G_i, G_j) != 0 modulo Gs
                return funcBuchberger(Gs + [R], RING)# on fait une appel recursive cette fois ci sur sur la liste Gs+[R] =[G_1, ..., G_l, R]
    return Gs# retourne une base de Grobner


funcBuchberger(Gs, RING)



#################################################################################################

#Algorithme 3 : Réduction d’une base de Gröbner, definie comme un fonction



def funcReduction(Gs, RING):
    Gsc = copy ( Gs )
    Gs1 = []

    while len(Gsc) > 0:
        d = min(p.degree() for p in Gsc)
        P = RING(0)
        for p in Gsc:
            if p.degree() == d:
                P = p
                break
        Gs1.append(P)
        Gscc = []
        for G in Gsc:
            if G.lm().quo_rem(P.lm())[1] != 0:
                Gscc.append(G)
        Gsc = Gscc
    Gs2 = []
    Gs11 = []
    for G in Gs1:
        if G not in Gs:
            Gs11.append(G)
    for G in Gs1:
        R = funcDivisionPolynomial(G, Gs11, RING)[1]
        Gs2.append(R)
    return Gs2

funcReduction(Gs, RING)
