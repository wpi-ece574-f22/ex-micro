export DESIGN_NAME = gcd
export PLATFORM    = sky130hd

export VERILOG_FILES = /OpenROAD-flow-scripts/flow/mydesign/solve-ho-gcd/rtl/gcd.v
export SDC_FILE      = /OpenROAD-flow-scripts/flow/mydesign/solve-ho-gcd/config/constraint.sdc

# These values must be multiples of placement site
export DIE_AREA    =  0    0  80  80
export CORE_AREA   =  10  10  70  70
