
# import from _my_library.os (less preferably)
import _my_library
var_1 = _my_library.funzione()
print "2 == " + str(var_1) + " ?"

# import from my_library.py (more preferably)
import my_library
var_2 = my_library.funzione()
print "2 == " + str(var_2) + " ?"
