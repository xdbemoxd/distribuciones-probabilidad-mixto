# -----------------------------------------------
# Nombre: [Tu Nombre]
# Cédula: [Tu Cédula]
# Ejercicio 1: Distribución Exponencial
# -----------------------------------------------

# Parámetros
media <- 24
tasa <- 1/media  # λ = 1/24
n_muestras <- 50000

# a) Simulación de los tiempos de vida
set.seed(0)
tiempos_vida <- rexp(n_muestras, rate = tasa)

# b) Probabilidad de durar más de 36 meses
prob_simulada <- mean(tiempos_vida > 36)    # muestras> 36 es una condicion, lo que convierte al vector muestras en un vector de 1's y 0's y promedia los 1
prob_teorica <- 1 - pexp(36, rate = tasa)   #P(X > 36) = 1 - P(X ≤ 36)

# Comparación
cat("Probabilidad simulada (>36 meses):", prob_simulada, "\n")
cat("Probabilidad teórica (>36 meses):",  prob_teorica,  "\n")

# c) Histograma y densidad teórica
hist(
   tiempos_vida, 
   freq = FALSE,  # Mostrar densidades, no frecuencias
   breaks = 50,   # la cantidad de meses es demasiado alta y dificultad la visualizacion con barras
   main = "Tiempo de Vida de Servidores (Exponencial)",
   xlab = "Tiempo (meses)",
   ylab = "Densidad",
   col = "lightblue"
)

# Superponer densidad teórica
curve(
  dexp(x, rate = tasa), #al ser continua se necesita cubrir el eje x con decimales, por ello se utiliza "x"
  from = 0, 
  to = max(tiempos_vida), 
  col = "red", 
  lwd = 2, 
  add = TRUE
)

legend("topright", 
   legend = c("Simulación", "Teórica"),
   col = c("lightblue", "red"),
   fill = c("lightblue", "red")
)


