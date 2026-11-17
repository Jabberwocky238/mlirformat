"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16>) -> (vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[8]x[8]xf16>), sym_name = "always_spill_larger_or_equal_tile_type"}> ({
  ^bb0(%arg0: memref<?x?xf16> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32> loc("<stdin>":5:10)
    %2 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32> loc("<stdin>":6:10)
    %3 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32> loc("<stdin>":7:10)
    %4 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32> loc("<stdin>":8:10)
    %5 = "arm_sme.tile_load"(%arg0, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xf16>, index, index) -> vector<[8]x[8]xf16> loc("<stdin>":9:10)
    "func.return"(%1, %2, %3, %4, %5) : (vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[8]x[8]xf16>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
