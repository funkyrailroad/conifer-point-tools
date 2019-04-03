#! /usr/bin/python3

import matplotlib.pyplot as plt
import numpy as np

n_a = 6.0221409e23
x, y, dy = np.loadtxt('bar.xvg', skiprows=16).T
for (v, val) in enumerate(y):
    print(v, val)

print(sum(y))

# l1, l2, dg, ddg, a, b, c, d, e, f  = np.loadtxt('sample-data.txt', skiprows=1).T
# print(sum(dg))

plt.bar(x, y, yerr=dy)
plt.title('Free Energy Differences')
plt.xlabel('$\lambda$')
plt.ylabel('$\Delta G$ (kT)')
plt.show()



x, y = np.loadtxt('barint.xvg', skiprows=16).T
print(y)

plt.bar(x, y)
plt.title('Cumulative Free Energy Differences')
plt.xlabel('$\lambda$')
plt.ylabel('$\Delta G$ (kT)')
