import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = 0
    conteo = 0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        count, key, val = line.split("\t")
        val = float(val)
        count = int(count)

        if key == curkey:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            total += val
            conteo += count
        else:
            ##
            ## Se cambio de clave. Se reinicia el
            ## acumulador.
            ##
            if curkey is not None:
                ##
                ## una vez se han reducido todos los elementos
                ## con la misma clave se imprime el resultado en
                ## el flujo de salida
                ##
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, str(total/conteo)))

            curkey = key
            total = val
            conteo = count

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, str(total/conteo)))
