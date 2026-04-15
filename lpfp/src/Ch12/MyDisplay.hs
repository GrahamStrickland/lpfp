module Ch12.MyDisplay where

import Vis

myDisplay :: VisObject R -> IO ()
myDisplay pict = display defaultOpts (orient pict)
