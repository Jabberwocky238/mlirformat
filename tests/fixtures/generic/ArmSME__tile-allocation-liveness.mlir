"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[4]xf32>, index) -> (), sym_name = "constant_with_multiple_users"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: index):
    %0 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %1 = "arm_sme.insert_tile_slice"(%arg0, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
    %2 = "arm_sme.insert_tile_slice"(%arg1, %0, %arg2) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]x[4]xf32>, vector<[4]xf32>, vector<[4]xf32>, index) -> (), sym_name = "value_with_multiple_users"}> ({
  ^bb0(%arg0: vector<[4]x[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: index):
    %0 = "arm_sme.insert_tile_slice"(%arg1, %arg0, %arg3) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
    %1 = "arm_sme.insert_tile_slice"(%arg2, %arg0, %arg3) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "reuse_tiles_after_initial_use"}> ({
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %2 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %3 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%3) : (vector<[4]x[4]xf32>) -> ()
    %4 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %5 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %6 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %7 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.some_use"(%4) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%5) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%6) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%7) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "tile_live_ins"}> ({
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %1 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // pred: ^bb2
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "non_sequential_live_ins"}> ({
  ^bb0(%arg0: i1):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "cf.br"()[^bb2] : () -> ()
  ^bb1:  // pred: ^bb2
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "test.dummy"() : () -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    %1 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "cf.cond_br"(%arg0)[^bb1, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "non_overlapping_branches"}> ({
  ^bb0(%arg0: i1):
    %0 = "scf.if"(%arg0) ({
      %2 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
      "scf.yield"(%2) : (vector<[4]x[4]xf32>) -> ()
    }, {
      %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
      "scf.yield"(%1) : (vector<[4]x[4]xf32>) -> ()
    }) : (i1) -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) -> (), sym_name = "overlapping_branches"}> ({
  ^bb0(%arg0: i1, %arg1: vector<[4]x[4]xf32>, %arg2: vector<[4]x[4]xf32>):
    %0 = "scf.if"(%arg0) ({
      "scf.yield"(%arg1) : (vector<[4]x[4]xf32>) -> ()
    }, {
      "scf.yield"(%arg2) : (vector<[4]x[4]xf32>) -> ()
    }) : (i1) -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>) -> (), sym_name = "run_out_of_tiles_but_avoid_spill"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>):
    %0 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg4: index):
      %4:4 = "scf.for"(%1, %3, %2, %0, %0, %0, %0) ({
      ^bb0(%arg5: index, %arg6: vector<[4]x[4]xf32>, %arg7: vector<[4]x[4]xf32>, %arg8: vector<[4]x[4]xf32>, %arg9: vector<[4]x[4]xf32>):
        %5 = "arm_sme.insert_tile_slice"(%arg0, %arg6, %arg4) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
        %6 = "arm_sme.insert_tile_slice"(%arg1, %arg7, %arg4) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
        %7 = "arm_sme.insert_tile_slice"(%arg2, %arg8, %arg4) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
        %8 = "arm_sme.insert_tile_slice"(%arg3, %arg9, %arg4) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
        "scf.yield"(%5, %6, %7, %8) : (vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) -> ()
      }) : (index, index, index, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) -> (vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>)
      "test.some_use"(%4#0) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%4#1) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%4#2) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%4#3) : (vector<[4]x[4]xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>, vector<[4]xf32>) -> (), sym_name = "avoidable_spill"}> ({
  ^bb0(%arg0: vector<[4]xf32>, %arg1: vector<[4]xf32>, %arg2: vector<[4]xf32>, %arg3: vector<[4]xf32>):
    %0 = "arm_sme.zero"() : () -> vector<[4]x[4]xf32>
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%2, %4, %3) ({
    ^bb0(%arg4: index):
      "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
      %5 = "arm_sme.insert_tile_slice"(%arg0, %1, %2) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
      %6 = "arm_sme.insert_tile_slice"(%arg1, %1, %2) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
      %7 = "arm_sme.insert_tile_slice"(%arg2, %1, %2) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
      %8 = "arm_sme.insert_tile_slice"(%arg3, %1, %2) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
      "test.some_use"(%5) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%6) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%7) : (vector<[4]x[4]xf32>) -> ()
      "test.some_use"(%8) : (vector<[4]x[4]xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf32>) -> (), sym_name = "cond_branch_with_backedge"}> ({
  ^bb0(%arg0: vector<[4]xf32>):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %2 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %3 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = 10 : index}> : () -> index
    "cf.br"(%4, %0)[^bb1] : (index, vector<[4]x[4]xf32>) -> ()
  ^bb1(%7: index, %8: vector<[4]x[4]xf32>):  // 2 preds: ^bb0, ^bb2
    %9 = "arith.cmpi"(%7, %6) <{predicate = 2 : i64}> : (index, index) -> i1
    "cf.cond_br"(%9, %8, %1, %2, %3)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 4>}> : (i1, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>, vector<[4]x[4]xf32>) -> ()
  ^bb2:  // pred: ^bb1
    %10 = "arm_sme.insert_tile_slice"(%arg0, %8, %7) <{layout = #arm_sme.layout<horizontal>}> : (vector<[4]xf32>, vector<[4]x[4]xf32>, index) -> vector<[4]x[4]xf32>
    %11 = "arith.addi"(%7, %5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "cf.br"(%11, %10)[^bb1] : (index, vector<[4]x[4]xf32>) -> ()
  ^bb3(%12: vector<[4]x[4]xf32>, %13: vector<[4]x[4]xf32>, %14: vector<[4]x[4]xf32>, %15: vector<[4]x[4]xf32>):  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "fill_holes_in_tile_liveness"}> ({
  ^bb0(%arg0: i1):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "cf.cond_br"(%arg0)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "holes_in_tile_liveness_inactive_overlaps"}> ({
  ^bb0(%arg0: i1):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "cf.cond_br"(%arg0)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %1 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    "cf.br"(%1)[^bb3] : (vector<[4]x[4]xf32>) -> ()
  ^bb2:  // pred: ^bb0
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    %2 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "cf.br"(%2)[^bb3] : (vector<[4]x[4]xf32>) -> ()
  ^bb3(%3: vector<[4]x[4]xf32>):  // 2 preds: ^bb1, ^bb2
    "test.some_use"(%3) : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "spill_inactive_live_range"}> ({
  ^bb0(%arg0: i1):
    %0 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    "cf.cond_br"(%arg0)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %1 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[16]x[16]xi8>) -> ()
    "cf.br"(%1)[^bb3] : (vector<[16]x[16]xi8>) -> ()
  ^bb2:  // pred: ^bb0
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    %2 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    "test.some_use"(%0) : (vector<[16]x[16]xi8>) -> ()
    "cf.br"(%2)[^bb3] : (vector<[16]x[16]xi8>) -> ()
  ^bb3(%3: vector<[16]x[16]xi8>):  // 2 preds: ^bb1, ^bb2
    "test.some_use"(%3) : (vector<[16]x[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "reactivate_inactive_live_range"}> ({
  ^bb0(%arg0: i1):
    %0 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "cf.cond_br"(%arg0)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %1 = "arm_sme.get_tile"() : () -> vector<[16]x[16]xi8>
    "test.dummy"() : () -> ()
    "test.some_use"(%1) : (vector<[16]x[16]xi8>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    %2 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xf32>
    "test.dummy"() : () -> ()
    "test.dummy"() : () -> ()
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

