import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    count = 0
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        codigo, letra, valor = line.split("\t")
        
        if letra == curkey:
            ##
            ## No se ha cambiado de clave. Aca se
            ## acumulan los valores para la misma clave.
            ##
           
            lista.append(str(int(valor)))
            #sys.stdout.write("{}\n".format(lista))
            
            
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
                nums = ','.join(lista)  
                sys.stdout.write("{}\t{}\n".format(curkey, nums))

            curkey = letra
            total = valor
            lista = []
            lista.append(str(int(valor)))
            
    nums = ','.join(lista)  
    sys.stdout.write("{}\t{}\n".format(curkey, nums))
            
              

             
    

