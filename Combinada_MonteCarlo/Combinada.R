# -----------------------------------------------
# Nombre: [Tu Nombre]
# Cédula: [Tu Cédula]
# Aplicación Combinada: Tiempos de respuesta API
# -----------------------------------------------

# Parámetros
media <- 0.5          #μ=0.5
desv_estandar <- 0.1       #σ=0.1
n_muestras_x <- 100000
umbral_lento <- 0.65  #bandera

# a) Simulación de tiempos de respuesta
set.seed(0)
tiempos_respuesta <- rnorm(n_muestras_x, mean = media, sd = desv_estandar)

# b) Probabilidad de respuesta lenta (>0.65s)
prob_simulada <- mean(tiempos_respuesta > umbral_lento)                 # probabilidad calculada con la simulacion
prob_teorica  <- 1 - pnorm(umbral_lento, media, desv_estandar)          # probabilidad teorica por valores de entrada

cat("Probabilidad simulada de llamada lenta:", prob_simulada,"\n")
cat("Probabilidad teórica de llamada lenta:",  prob_teorica, "\n")

# c) Distribución para Y (número de llamadas lentas en 100 llamadas)
# Justificación: 
# - Cada llamada es un ensayo Bernoulli independiente con probabilidad de éxito p = prob_simulada
# - Y = suma de 100 ensayos Bernoulli independientes → Binomial(n=100, p=prob_simulada)

# d) Simulación de Y (número de llamadas lentas en 100 llamadas)
n_muestras_y <- 100000
var_Y <- rbinom(n_muestras_y, size = 100, prob = prob_simulada)         # se usa la prob_simulada, pues es un vector de muestras simuladas

# Probabilidad de más de 5 llamadas lentas
probabilidad_mayor5_simulada <- mean(var_Y > 5)                         # se calcula con promedio
probabilidad_mayor5_teorica <- 1 - pbinom(5, 100, prob_teorica)         # se calcula por funcion, asi que se usa la prob_teorica

cat("Probabilidad simulada de >5 lentas en 100 llamadas:", probabilidad_mayor5_simulada, "\n")
cat("Probabilidad teórica de >5 lentas en 100 llamadas:",  probabilidad_mayor5_teorica,  "\n")

# Grafico de la variable Y (Para documentacion)
hist(
  var_Y, 
  breaks = round(max(var_Y)),
  freq = FALSE,
  main = "Número de Llamadas Lentas en 100 Llamadas",
  xlab = "Número de llamadas lentas",
  ylab = "Probabilidad",
  col = "lightblue"
)

# Superponer distribución binomial teórica
valores_xlab <- 0:100           #vector de valores discretos
lines(
  valores_xlab, 
  dbinom(valores_xlab, 100, prob_teorica), 
  type = "b", 
  col = "red", 
  lwd = 2
)
