module Modelo
    ( Estudiante(..)
    , NivelRiesgo(..)
    ) where

data NivelRiesgo
    = Bajo
    | Medio
    | Alto
    | Critico
    deriving (Show, Eq, Ord)

data Estudiante = Estudiante
    { progresoAcademico     :: Double
    , asistencia            :: Double
    , inasistencias         :: Int
    , aniosCarrera          :: Int
    , intervenciones        :: Int
    , dificultadAprendizaje :: Bool
    , derivacionDocente     :: Bool
    , tesisPendiente        :: Bool
    } deriving (Show, Eq)