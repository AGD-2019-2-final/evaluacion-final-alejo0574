import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

  for line in sys.stdin:
      line = line.strip()
      splits = line.split("   ")
      #print("line " + str(len(splits)))
      line2 = line.split("   ")[1]
      line2 = line2.split("-")[1]
      sys.stdout.write("{}\t1\n".format(line2))