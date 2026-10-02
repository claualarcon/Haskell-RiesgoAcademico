module Main where

import Modelo
import Riesgo
import Escenarios

estudiante1 :: Estudiante
estudiante1 = Estudiante
    { progresoAcademico = 25
    , asistencia = 55
    , inasistencias = 7
    , aniosCarrera = 3
    , intervenciones = 1
    , dificultadAprendizaje = True
    , derivacionDocente = False
    , tesisPendiente = False
    }

-- Evalúa una lista de estudiantes y devuelve
-- el nivel de riesgo de cada uno.
evaluarEscenarios :: [Estudiante] -> [NivelRiesgo]
evaluarEscenarios estudiantes =
    map evaluarRiesgo estudiantes

-- Describe el cambio producido en el puntaje.
mostrarCambio :: Int -> String
mostrarCambio cambio
    | cambio < 0 = "Disminuyo " ++ show (abs cambio) ++ " puntos"
    | cambio > 0 = "Aumento " ++ show cambio ++ " puntos"
    | otherwise  = "Sin cambios"

-- Muestra y compara los resultados de los escenarios.
mostrarResultados :: Estudiante -> [(Double, Estudiante)] -> IO ()
mostrarResultados inicial escenarios =
    mapM_ mostrar escenarios
    where
        mostrar (incremento, estudiante) = do
            let puntajeInicial = puntajeTotal inicial
            let puntajeActual = puntajeTotal estudiante
            let cambio = puntajeActual - puntajeInicial

            putStrLn ("+" ++ show incremento ++ "% de progreso")
            putStrLn ("  Progreso: " ++ show (progresoAcademico estudiante) ++ "%")
            putStrLn ("  Puntaje: " ++ show puntajeActual)
            putStrLn ("  Cambio de puntaje: " ++ mostrarCambio cambio)
            putStrLn ("  Riesgo: " ++ show (evaluarRiesgo estudiante))
            putStrLn ""

main :: IO ()
main = do
    putStrLn "=== MODELO FUNCIONAL DE RIESGO ACADEMICO ==="
    putStrLn ""

    putStrLn "ESTUDIANTE INICIAL"
    print estudiante1
    putStrLn ("Puntaje: " ++ show (puntajeTotal estudiante1))
    putStrLn ("Riesgo: " ++ show (evaluarRiesgo estudiante1))
    putStrLn ""

    -- Lista de modificaciones que queremos experimentar.
    let incrementos = [10, 20, 30]

    -- Generamos automáticamente los escenarios.
    let escenarios = escenariosProgreso incrementos estudiante1

    -- Asociamos cada incremento con su escenario.
    let escenariosConIncremento = zip incrementos escenarios

    putStrLn "ESCENARIOS AUTOMATICOS"
    putStrLn ""

    mostrarResultados estudiante1 escenariosConIncremento