module Ch15Test where

import qualified Ch10.SimpleVec as SimpleVec
import qualified Ch15.Mechanics1D as Mechanics1D
import qualified Ch14.Newton2 as Newton2
import Test.HUnit

ch15Tests :: Test
ch15Tests =
    TestLabel "Chapter 15 Tests" $
        TestList
            [testCh15Mechanics1D]

springForce :: SimpleVec.R -> Mechanics1D.MState -> Mechanics1D.Force
springForce k (_,_,x0,_) = -k * x0

dampedHOForces :: [Mechanics1D.MState -> Mechanics1D.Force]
dampedHOForces = [springForce 0.8
                 ,\(_,_,_,v0) -> Newton2.fAir 2 1.225 (pi * 0.02**2) v0
                 ,\(_,m,_,_) -> -m * 9.80665
                 ]

testCh15Mechanics1D :: Test
testCh15Mechanics1D =
    TestLabel "Ch15.Mechanics1D tests" $
        TestList
            [ TestCase $ assertEqual "(pingpongPosition 0) (positionFtxv2 0.001 (0,0.0027,0.1,0) dampedHOForces 0)" (Mechanics1D.pingpongPosition 0) (Mechanics1D.positionFtxv2 0.001 (0,0.0027,0.1,0) dampedHOForces 0)
            , TestCase $ assertEqual "(pingpongPosition 1) (positionFtxv2 0.001 (0,0.0027,0.1,0) dampedHOForces 1)" (Mechanics1D.pingpongPosition 1) (Mechanics1D.positionFtxv2 0.001 (0,0.0027,0.1,0) dampedHOForces 1)
            ]
