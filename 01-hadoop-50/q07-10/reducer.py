import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    for line in sys.stdin:
        codigo, letra, fecha, valor = line.split("\t")
        sys.stdout.write("{}\t{}\t{}".format(letra,fecha,valor))