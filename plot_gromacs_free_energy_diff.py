#! /usr/bin/python3

# import matplotlib.pyplot as plt
import numpy as np

nrow_skip = 17
k = 1.38064852e-23  # J/K
T = 298             # K
n_a = 6.02214086e23 # 1/mol

x, y, dy = np.loadtxt('bar.xvg', skiprows=nrow_skip).T

# plt.bar(x, y, yerr=dy)
# plt.title('Free Energy Differences')
# plt.xlabel('$\lambda$')
# plt.ylabel('$\Delta G$ (kT)')
# plt.show()



x, y = np.loadtxt('barint.xvg', skiprows=nrow_skip).T
print(y * k * T * n_a / ( 1000. * 4.184 ) )

# plt.bar(x, y)
# plt.title('Cumulative Free Energy Differences')
# plt.xlabel('$\lambda$')
# plt.ylabel('$\Delta G$ (kT)')
# plt.show()
