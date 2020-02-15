import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':


    count = 0
    tope =7


    for line in sys.stdin:

        codigo, letra, fecha, valor = line.split("\t")

        if count < 6:
            sys.stdout.write("{}\t{}\t{}".format(letra, fecha, valor))
            count += 1   

