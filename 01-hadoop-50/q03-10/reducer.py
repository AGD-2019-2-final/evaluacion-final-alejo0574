import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#
if __name__ == "__main__":

  for line in sys.stdin:
      line = line.strip()
      splits = line.split(",")
      col1 = splits[0]
      col2 = splits[1]
      sys.stdout.write("{},{}\n".format(col2,col1))




        
    