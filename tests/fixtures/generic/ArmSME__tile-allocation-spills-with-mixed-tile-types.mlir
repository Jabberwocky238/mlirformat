"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf16>) -> (vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[8]x[8]xf16>), sym_name = "always_spill_larger_or_equal_tile_type"}> ({
  ^bb0(%arg0: memref<?x?xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %2 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %3 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %4 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %5 = "arm_sme.tile_load"(%arg0, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xf16>, index, index) -> vector<[8]x[8]xf16>
    "func.return"(%1, %2, %3, %4, %5) : (vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[8]x[8]xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (vector<[16]x[16]xi8>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>), sym_name = "spill_larger_tile_type"}> ({
  ^bb0(%arg0: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arm_sme.zero"() : () -> vector<[16]x[16]xi8>
    %2 = "arm_sme.tile_load"(%arg0, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32>
    %3 = "arm_sme.tile_load"(%arg0, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32>
    %4 = "arm_sme.tile_load"(%arg0, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32>
    %5 = "arm_sme.tile_load"(%arg0, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32>
    "func.return"(%1, %2, %3, %4, %5) : (vector<[16]x[16]xi8>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) -> ()
  }) : () -> ()
}) : () -> ()

