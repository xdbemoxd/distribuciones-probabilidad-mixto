import numpy as np
from math import factorial
import matplotlib.pyplot as plt

#esta funcion me ayuda a calcular la probabilidad puntual de que ocurra un evento a traves de la distribucion de poisson
def poisson(esperanza, x):
    return ( np.exp(-esperanza) * esperanza ** x) / factorial(x)

#esto genera la distribución de poisson
muestra = np.random.poisson( 5, 10000 )

#en el siguiente segmento de codigo, calculo el porcentaje de frecuencia con el que aparece el numero 3
count = 0

for i in muestra:
    #simplemente cuento la cantidad de veces que aparecen
    if i == 3:
        count+=1

print( "con los datos simulados", count / 10000 )

print( "con la formula teorica", poisson( 5, 3 ) )

#aqui genero diferentes vectores para el histograma de la muestra de los 10000 numeros
frecuencias, bins = np.histogram(muestra)
porcentajes = frecuencias / len(muestra)

#aqui defino los clientes que llegan de forma teorica, para hacer una simulacion con la funcion poisson
clientes_teoricos = np.arange(0,20)
porcentaje_llegada = np.array([poisson( 5 , x ) for x in clientes_teoricos])

# Crear el gráfico de líneas
plt.hist( bins[:-1], bins, weights=porcentajes, color="yellow" )
plt.plot( clientes_teoricos, porcentaje_llegada, color="green" )

plt.legend( [ "con la formula de poisson", "con el vector de muestras"  ] )

# Añadir título y etiquetas a los ejes
plt.title("Gráfico del ejercicio 1")
plt.xlabel("N° de clientes que llegan")
plt.ylabel("Probabilidad de que lleguen esa cantidad de clientes")


# Mostrar el gráfico
plt.show()


