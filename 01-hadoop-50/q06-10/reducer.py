import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    total = None
    total2 = None

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val = float(val)
        
        if total  is None:
          total = val
          total2 = val

        if key == curkey:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
            total = max(total, val)
            total2 = min(total2, val)
            
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
                sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, total2))

            curkey = key
            total = val
            total2 = val 
            
    sys.stdout.write("{}\t{}\t{}\n".format(curkey, total, total2))