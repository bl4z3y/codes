import math

"""
Cada matéria:
    ->Aferição Periódica (AP1+AP2+AP3)
    ->Avaliação Dissertativa
    ->Nota do Professor
    ->Simulado
    -->(AP+AD+NP+SI)/4 = Média Trimestral
Cada trimestre:
    ->10 matérias
    ->3 AP's
"""

class Boletim:
    def __init__(self, tri: int, mats: list):
        self.tri = tri
        self.mats = mats
        self.boletim = []
        self.materia = {}

    def notas(self):
        _ = input("A nota do simulado é global? ")
        si_glob = _ == "s" 
        if si_glob: 
            si = float(input("Digite a nota do simulado: "))
        for mat in self.mats:
            self.materia = {}
            self.materia['Mat'] = mat

            ##
            ##AFERIÇÃO PERIÓDICA
            ##
            for i in range(1,4,1):
                globals()[f'ap{i}'] = float(input(f"Digite a nota da sua AP{i} para {mat}: "))
            ap = round((ap1+ap2+ap3)/3,1)
            self.materia['AP'] = ap
            print(f"Média da AP: {ap}")
            
            ##
            ##AVALIAÇÃO DISSERTATIVA
            ##
            ad = round(float(input(f"Digite a nota da sua AD para {mat}: ")),1)
            self.materia['AD'] = ad

            ##
            ##NOTA DO PROFESSOR
            ##
            np = round(float(input(f"Digite a Nota do Professor para {mat}: ")),1)
            self.materia['NP'] = np

            ##
            ##SIMULADO
            ##
            if not si_glob:
                si = round(float(input(f"Digite a nota do Simulado para {mat}: ")),1)
            self.materia['SI'] = si

            ##
            ##MÉDIA TRIMESTRAL
            ##
            md = round((ap+ad+np+si)/4,1)
            self.materia['Media Tri'] = md
            print(self.materia, "\n\n")

            self.boletim.append(self.materia)
        
        return self.boletim

    def imprimir(self):
        """
        for i in range(0,11):
            for mat in self.mats:
                globals()[mat] = eval(self.boletim[i])
        """
        with open(f"Boletim {self.tri}ºTri.txt", 'w') as bol:    
            
            for i in range(0,10):
                # for mat in self.mats:
                bol.write(f"{self.boletim[i]['Mat']}\t AP: {self.boletim[i]['AP']}\t AD: {self.boletim[i]['AD']}\t NP: {self.boletim[i]['NP']}\t SI: {self.boletim[i]['SI']} \t\tMédia Trimestral: {self.boletim[i]['Media Tri']}\n")

def main():
    # MATERIAS = ['Português','Álgebra','Geometria','Ciências','História','Geografia','Inglês','Tecnologia','Redação','Atualidades']
    MATERIAS = ['Atualidades','Ciências','Geografia','História','Inglês','Português','Álgebra','Geometria','Redação','Tecnologia']
    stTri = Boletim(1, MATERIAS)
    stBol = stTri.notas()
    stTri.imprimir()
    
    ndTri = Boletim(2, MATERIAS)
    ndBol = ndTri.notas()
    ndBol.imprimir()
    
    rdTri = Boletim(3, MATERIAS)
    rdBol = rdTri.notas()
    rdBol.imprimir()


    print(stBol, ndBol, rdBol)

main()

