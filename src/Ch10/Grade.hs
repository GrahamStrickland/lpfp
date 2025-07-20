module Ch10.Grade where

data Grade = Grade String Int
             deriving (Eq,Show)

grades :: [Grade]
grades = [Grade "Albert Einstein" 89
         ,Grade "Isaac Newton"    95
         ,Grade "Alan Turing"     91
         ]

data GradeRecord = GradeRecord { name  :: String 
                               , grade :: Int
                               } deriving (Eq,Show)

gradeRecords1 :: [GradeRecord]
gradeRecords1 = [GradeRecord "Albert Einstein" 89
                ,GradeRecord "Isaac Newton"    95
                ,GradeRecord "Alan Turing"     91
                ]

gradeRecords2 :: [GradeRecord]
gradeRecords2 = [GradeRecord {name = "Albert Einstein", grade = 89}
                ,GradeRecord {name = "Isaac Newton"   , grade = 95}
                ,GradeRecord {name = "Alan Turing"    , grade = 91}
                ]
