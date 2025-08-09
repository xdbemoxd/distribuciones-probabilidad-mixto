# -----------------------------------------------
# Nombre: [Tu Nombre]
# Cédula: [Tu Cédula]
# Ejercicio 2: Distribución Gamma
# -----------------------------------------------

# Parámetros
k <- 3                # Parámetro de forma
theta <- 2            # Parámetro de escala
n_muestras <- 15000

# a) Simulación de tiempos de corrección
set.seed(1)
tiempos_correccion <- rgamma(n_muestras, shape = k, scale = theta)

# b) Probabilidad de tardar >8 horas
prob_simulada <- mean(tiempos_correccion > 8)             # muestras> 8 es una condicion, lo que convierte al vector muestras en un vector de 1's y 0's y promedia los 1         
prob_teorica <- 1 - pgamma(8, shape = k, scale = theta)   #P(X>8) = 1 - P(X≤8)

# Comparación
cat("Probabilidad simulada (>8 horas):", prob_simulada, "\n")
cat("Probabilidad teórica (>8 horas):",  prob_teorica,  "\n")

# c) Histograma y densidad teórica
hist(
  tiempos_correccion,                            #vector de valores
  freq = FALSE,                                  #falso, dara la probabilidad de aparicion
  breaks = round(max(tiempos_correccion)),       #barras para cada valor
  main = "Distribucion Gamma (k=3, θ=2)",        #titulo del plot
  xlab = "Tiempo (horas)",                       #titulo del eje x
  ylab = "Densidad",                             #titulo del eje y
  col = "lightblue",
)

# Superponer densidad teórica
curve(
  dgamma(x, shape = k, scale = theta),           #al ser continua se necesita cubrir el eje x con decimales, por ello se utiliza "x"
  from = 0,                                      
  to = max(tiempos_correccion), 
  col = "red", 
  lwd = 2, 
  add = TRUE
)

legend(
  "topright", 
  legend = c("Simulación", "Teórica"),
  col = c("lightblue", "red"),
  fill = c("lightblue", "red")
)

