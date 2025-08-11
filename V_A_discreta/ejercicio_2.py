import numpy as np
from scipy.stats import binom
import matplotlib.pyplot as plt

muestra = np.random.binomial(50, 0.85, 20000)

count = 0

for i in muestra:
    if i >= 45:
        count+=1
    
print( "probabilidad simulada: ", count / 20000 )

prob_teorica = binom.cdf(k=44,n=50, p=0.85)

print( "probabilidad teorica: ", 1-prob_teorica )

frecuencias, bins = np.histogram(muestra)
porcentajes = frecuencias / len(muestra)

cantidad_test_unitario = np.arange(0,51)
porcentaje_exito = np.array([binom.pmf(k=x,n=50, p=0.85) for x in cantidad_test_unitario])

# Crear el gráfico de líneas
plt.hist( bins[:-1], bins, weights=porcentajes, color="yellow" )
plt.plot( cantidad_test_unitario, porcentaje_exito, color="green" )

plt.legend( [ "con la formula de poisson", "con el vector de muestras"  ] )

# Añadir título y etiquetas a los ejes
plt.title("Gráfico del ejercicio 2")
plt.xlabel("N° de test unitario")
plt.ylabel("Probabilidad de exito")


# Mostrar el gráfico
plt.show()
