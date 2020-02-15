import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

  for line in sys.stdin:
      valor1= line.split(',')[3]
      valor2= line.split(',')[4]
      sys.stdout.write("{}\t{}\n".format(valor1,valor2))