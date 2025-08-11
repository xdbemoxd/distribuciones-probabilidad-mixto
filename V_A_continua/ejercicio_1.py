import numpy as np
from scipy.stats import expon
import matplotlib.pyplot as plt

def dist_expo( lam, x ):
    return lam * ( np.exp(-x*lam))

mu = 24
lam = 1/mu

muestra = np.random.exponential( lam, 50000 )

frecuencias, bins = np.histogram(muestra)
porcentajes = frecuencias / len(muestra)

# Densidad exponencial teórica:
prob_teorica= expon.cdf(x=36, scale=lam)


print(muestra)

print( "probabilidad teorica: ", prob_teorica )


# Crear el gráfico de líneas
plt.hist( bins[:-1], bins, weights=porcentajes, color="yellow" )
plt.plot( cantidad_test_unitario, porcentaje_exito, color="green" )

plt.legend( [ "con la formula de ", "con el vector de muestras"  ] )

# Añadir título y etiquetas a los ejes
plt.title("Gráfico del ejercicio 2")
plt.xlabel("N° de test unitario")
plt.ylabel("Probabilidad de exito")


# Mostrar el gráfico
plt.show()




