import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

      for line in sys.stdin:
          line = line.strip()
          numero = line.split("\t")[0]
          numero = int(numero)
          letras = line.split("\t")[1]
          letras = letras.split(",")

          for l in letras:
              sys.stdout.write("{}\t{}\t{}\n".format(l+str(numero/100),l,numero))