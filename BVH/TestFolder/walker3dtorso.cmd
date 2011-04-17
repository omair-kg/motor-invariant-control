# Automatically generated script by Houdini 10.0.528
# This file reproduces the geometric hierarchy of a motion capture file
# 
fset 2881
frange 1 2881
fps 120
set saved_path = `execute("oppwf")`
# Create Hierarchy 

opcf /obj


# Create Object 'root' and create its channels
opadd -n geo root
opcf root
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( -8.559 -9.8555 2.1513) prim0(  "0 1"  ) 
opwire add1 -0 merge1
opadd add add2
opparm add2 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( 8.559 -9.8555 2.1513) prim0(  "0 1"  ) 
opwire add2 -1 merge1
opadd add add3
opparm add3 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( 0 0 0) prim0(  "0 1"  ) 
opwire add3 -2 merge1
oplayout
opcf ..
chadd root ry rx rz tz ty tx 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/root:tx")' root/tx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/root:ty")' root/ty
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/root:tz")' root/tz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/root:rz")' root/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/root:rx")' root/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/root:ry")' root/ry
opparm root rOrd ( yxz) 
opparm root xOrd ( srt )


# Create Object 'rfemur' and create its channels
opadd -n geo rfemur
opcf rfemur
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( -7.2751 -41.2593 0) prim0(  "0 1"  ) 
opwire add1 -0 merge1
oplayout
opcf ..
opparm rfemur t ( -8.559 -9.8555 2.1513) 
chadd rfemur ry rx rz 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rfemur:rz")' rfemur/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rfemur:rx")' rfemur/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rfemur:ry")' rfemur/ry
opparm rfemur rOrd ( yxz) 
opparm rfemur xOrd ( srt )

opwire root -0 rfemur

# Create Object 'rtibia' and create its channels
opadd -n geo rtibia
opcf rtibia
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( -6.5686 -37.2525 -0) prim0(  "0 1"  ) 
opwire add1 -0 merge1
oplayout
opcf ..
opparm rtibia t ( -7.2751 -41.2593 0) 
chadd rtibia ry rx rz 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rtibia:rz")' rtibia/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rtibia:rx")' rtibia/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rtibia:ry")' rtibia/ry
opparm rtibia rOrd ( yxz) 
opparm rtibia xOrd ( srt )

opwire rfemur -0 rtibia

# Create Object 'rfoot' and create its channels
opadd -n geo rfoot
opcf rfoot
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( 3.2326 -4.186 10.4122) prim0(  "0 1"  ) 
opwire add1 -0 merge1
oplayout
opcf ..
opparm rfoot t ( -6.5686 -37.2525 -0) 
chadd rfoot ry rx rz 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rfoot:rz")' rfoot/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rfoot:rx")' rfoot/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rfoot:ry")' rfoot/ry
opparm rfoot rOrd ( yxz) 
opparm rfoot xOrd ( srt )

opwire rtibia -0 rfoot

# Create Object 'rtoes' and create its channels
opadd -n geo rtoes
opcf rtoes
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( 0 0 0) prim0(  "0 1"  ) 
opwire add1 -0 merge1
oplayout
opcf ..
opparm rtoes t ( 3.2326 -4.186 10.4122) 
chadd rtoes ry rx rz 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rtoes:rz")' rtoes/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rtoes:rx")' rtoes/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/rtoes:ry")' rtoes/ry
opparm rtoes rOrd ( yxz) 
opparm rtoes xOrd ( srt )

opwire rfoot -0 rtoes

# Create Object 'rtoesEnd' and create its channels
oplayout
opadd geo rtoesEnd
opparm rtoesEnd t ( 0 0 0) 
opparm rtoesEnd r ( 0 0 0) 

opparm rtoesEnd rOrd ( xyz) 
opparm rtoesEnd xOrd ( srt )

opwire rtoes -0 rtoesEnd

# Create Object 'lfemur' and create its channels
opadd -n geo lfemur
opcf lfemur
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( 7.2751 -41.2593 0) prim0(  "0 1"  ) 
opwire add1 -0 merge1
oplayout
opcf ..
opparm lfemur t ( 8.559 -9.8555 2.1513) 
chadd lfemur ry rx rz 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/lfemur:rz")' lfemur/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/lfemur:rx")' lfemur/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/lfemur:ry")' lfemur/ry
opparm lfemur rOrd ( yxz) 
opparm lfemur xOrd ( srt )

opwire root -0 lfemur

# Create Object 'ltibia' and create its channels
opadd -n geo ltibia
opcf ltibia
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( 6.5686 -37.2525 -0) prim0(  "0 1"  ) 
opwire add1 -0 merge1
oplayout
opcf ..
opparm ltibia t ( 7.2751 -41.2593 0) 
chadd ltibia ry rx rz 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/ltibia:rz")' ltibia/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/ltibia:rx")' ltibia/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/ltibia:ry")' ltibia/ry
opparm ltibia rOrd ( yxz) 
opparm ltibia xOrd ( srt )

opwire lfemur -0 ltibia

# Create Object 'lfoot' and create its channels
opadd -n geo lfoot
opcf lfoot
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( 3.2326 -4.186 10.4122) prim0(  "0 1"  ) 
opwire add1 -0 merge1
oplayout
opcf ..
opparm lfoot t ( 6.5686 -37.2525 -0) 
chadd lfoot ry rx rz 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/lfoot:rz")' lfoot/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/lfoot:rx")' lfoot/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/lfoot:ry")' lfoot/ry
opparm lfoot rOrd ( yxz) 
opparm lfoot xOrd ( srt )

opwire ltibia -0 lfoot

# Create Object 'ltoes' and create its channels
opadd -n geo ltoes
opcf ltoes
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( -0 -0 0) prim0(  "0 1"  ) 
opwire add1 -0 merge1
oplayout
opcf ..
opparm ltoes t ( 3.2326 -4.186 10.4122) 
chadd ltoes ry rx rz 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/ltoes:rz")' ltoes/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/ltoes:rx")' ltoes/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/ltoes:ry")' ltoes/ry
opparm ltoes rOrd ( yxz) 
opparm ltoes xOrd ( srt )

opwire lfoot -0 ltoes

# Create Object 'ltoesEnd' and create its channels
oplayout
opadd geo ltoesEnd
opparm ltoesEnd t ( -0 -0 0) 
opparm ltoesEnd r ( 0 0 0) 

opparm ltoesEnd rOrd ( xyz) 
opparm ltoesEnd xOrd ( srt )

opwire ltoes -0 ltoesEnd

# Create Object 'Torsoack' and create its channels
opadd -n geo Torsoack
opcf Torsoack
opadd merge merge1
opset -d on -r on merge1
opadd add add1
opparm add1 points (2) usept0 (on) usept1 (on) pt0 ( 0 0 0 ) pt1 ( -0 70 0) prim0(  "0 1"  ) 
opwire add1 -0 merge1
oplayout
opcf ..
opparm Torsoack t ( 0 0 0) 
chadd Torsoack ry rx rz 
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/Torsoack:rz")' Torsoack/rz
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/Torsoack:rx")' Torsoack/rx
chkey -f 1 -F 'chop("/ch/walker3dtorso/data/Torsoack:ry")' Torsoack/ry
opparm Torsoack rOrd ( yxz) 
opparm Torsoack xOrd ( srt )

opwire root -0 Torsoack

# Create Object 'TorsoackEnd' and create its channels
oplayout
opadd geo TorsoackEnd
opparm TorsoackEnd t ( -0 70 0) 
opparm TorsoackEnd r ( 0 0 0) 

opparm TorsoackEnd rOrd ( xyz) 
opparm TorsoackEnd xOrd ( srt )

opwire Torsoack -0 TorsoackEnd
opcf /obj
oplayout


# Create CHOP net to store this motion
opcf /ch
opadd ch walker3dtorso
opcf walker3dtorso
opadd file file1
opparm file1 file "walker3dtorso.bclip"
opparm file1 rate 120
opparm file1 rateoption override
opadd null data
opwire file1 -0 data
oplayout


opcf $saved_path
