"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32>, vector<[4]x[4]xi32>, vector<[4]x[4]xi32>, i1) -> (), sym_name = "selecting_between_different_tiles_is_unsupported"}> ({
  ^bb0(%arg0: memref<?x?xi32>, %arg1: vector<[4]x[4]xi32>, %arg2: vector<[4]x[4]xi32>, %arg3: i1):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "scf.if"(%arg3) ({
      "scf.yield"(%arg1) : (vector<[4]x[4]xi32>) -> ()
    }, {
      "scf.yield"(%arg2) : (vector<[4]x[4]xi32>) -> ()
    }) : (i1) -> vector<[4]x[4]xi32>
    "arm_sme.tile_store"(%1, %arg0, %0, %0) <{layout = #arm_sme.layout<horizontal>, operandSegmentSizes = array<i32: 1, 1, 2, 0>}> : (vector<[4]x[4]xi32>, memref<?x?xi32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

