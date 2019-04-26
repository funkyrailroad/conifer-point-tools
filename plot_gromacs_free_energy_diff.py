#! /usr/bin/python3

# import matplotlib.pyplot as plt
import numpy as np

nrow_skip = 17
k = 1.38064852e-23  # J/K
T = 298             # K
n_a = 6.02214086e23 # 1/mol

x, y, dy = np.loadtxt('bar.xvg', skiprows=nrow_skip).T


y_kj  =  y * k * T * n_a /  1000. 
dy_kj = dy * k * T * n_a /  1000. 

y_kcal  =  y_kj * 4.184
dy_kcal = dy_kj * 4.184


y_sum = sum(y)
y_kj_sum    = sum(y_kj)
y_kcal_sum  = sum(y_kcal)

dy_sum      = np.sqrt( sum( dy**2 ) )
dy_kj_sum   = np.sqrt( sum( dy_kj**2 ) )
dy_kcal_sum = dy_kj_sum * 4.184

print("With imprecise numbers")
print( "{:.3f} +/- {:.3f} kT".format( sum(y), sum(dy) ) )
print( "{:.3f} +/- {:.3f} kJ/mol".format( y_kj_sum, dy_kj_sum ) )
print( "{:.3f} +/- {:.3f} kcal/mol".format( y_kcal_sum, dy_kcal_sum ) )


# plt.bar(x, y, yerr=dy)
# plt.title('Free Energy Differences')
# plt.xlabel('$\lambda$')
# plt.ylabel('$\Delta G$ (kT)')
# plt.show()



x, y = np.loadtxt('barint.xvg', skiprows=nrow_skip).T
y_sum = sum( y )
y_joule = y * k * T * n_a / 1000.
y_kcal = y_joule * 4.184

print("With more precise numbers")
# exit()
print( "{:.3f}  kT".format( y_sum ) )
print(y_joule[-1], "kJ/mol" )
print(y_kcal[-1], "kcal/mol" )

# plt.bar(x, y)
# plt.title('Cumulative Free Energy Differences')
# plt.xlabel('$\lambda$')
# plt.ylabel('$\Delta G$ (kT)')
# plt.show()
