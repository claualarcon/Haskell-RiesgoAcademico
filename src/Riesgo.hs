module Riesgo
    ( puntajeProgreso
    , puntajeAsistencia
    , puntajeInasistencias
    , puntajeIntervenciones
    , puntajeDificultad
    , puntajeDerivacion
    , puntajeTesis
    , puntajeTotal
    , clasificarRiesgo
    , evaluarRiesgo
    ) where

import Modelo


puntajeProgreso :: Double -> Int
puntajeProgreso progreso
    | progreso >= 70 = 0
    | progreso >= 50 = 1
    | progreso >= 30 = 2
    | otherwise      = 3


puntajeAsistencia :: Double -> Int
puntajeAsistencia asistencia
    | asistencia >= 80 = 0
    | asistencia >= 60 = 1
    | asistencia >= 40 = 2
    | otherwise        = 3


puntajeInasistencias :: Int -> Int
puntajeInasistencias inasistencias
    | inasistencias <= 3  = 0
    | inasistencias <= 6  = 1
    | inasistencias <= 10 = 2
    | otherwise            = 3


puntajeIntervenciones :: Int -> Int
puntajeIntervenciones intervenciones
    | intervenciones == 0 = 0
    | intervenciones == 1 = 1
    | intervenciones == 2 = 2
    | otherwise            = 3


puntajeDificultad :: Bool -> Int
puntajeDificultad dificultad
    | dificultad = 2
    | otherwise  = 0


puntajeDerivacion :: Bool -> Int
puntajeDerivacion derivacion
    | derivacion = 2
    | otherwise  = 0


puntajeTesis :: Bool -> Int
puntajeTesis tesis
    | tesis = 1
    | otherwise = 0


puntajeTotal :: Estudiante -> Int
puntajeTotal estudiante =
    puntajeProgreso (progresoAcademico estudiante)
    + puntajeAsistencia (asistencia estudiante)
    + puntajeInasistencias (inasistencias estudiante)
    + puntajeIntervenciones (intervenciones estudiante)
    + puntajeDificultad (dificultadAprendizaje estudiante)
    + puntajeDerivacion (derivacionDocente estudiante)
    + puntajeTesis (tesisPendiente estudiante)


clasificarRiesgo :: Int -> NivelRiesgo
clasificarRiesgo puntaje
    | puntaje <= 4  = Bajo
    | puntaje <= 8  = Medio
    | puntaje <= 12 = Alto
    | otherwise     = Critico


evaluarRiesgo :: Estudiante -> NivelRiesgo
evaluarRiesgo estudiante =
    clasificarRiesgo (puntajeTotal estudiante)