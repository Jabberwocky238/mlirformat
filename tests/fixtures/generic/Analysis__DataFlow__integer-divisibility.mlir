"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "constant"}> ({
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index
    %1 = "test.int_divisibility"(%0) : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "muli_constant"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.muli"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %2 = "test.int_divisibility"(%1) : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "addi_gcd_of_muli_operands"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index
    %1 = "arith.constant"() <{value = 12 : index}> : () -> index
    %2 = "arith.muli"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %3 = "arith.muli"(%arg1, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "arith.addi"(%2, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %5 = "test.int_divisibility"(%4) : (index) -> index
    "func.return"(%5) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "addi_same_divisibility"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 16 : index}> : () -> index
    %1 = "arith.muli"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %2 = "arith.muli"(%arg1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %3 = "arith.addi"(%1, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "test.int_divisibility"(%3) : (index) -> index
    "func.return"(%4) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 16)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_apply_mul"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.muli"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %2 = "affine.apply"(%1) <{map = #map}> : (index) -> index
    %3 = "test.int_divisibility"(%2) : (index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 16)>
#map1 = affine_map<(d0) -> (d0 floordiv 4)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_apply_mul_then_floordiv"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    %1 = "affine.apply"(%0) <{map = #map1}> : (index) -> index
    %2 = "test.int_divisibility"(%1) : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 16)>
#map1 = affine_map<(d0) -> (d0 mod 16)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_apply_mod_zero"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    %1 = "affine.apply"(%0) <{map = #map1}> : (index) -> index
    %2 = "test.int_divisibility"(%1) : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (64)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_constant"}> ({
    %0 = "affine.apply"() <{map = #map}> : () -> index
    %1 = "test.int_divisibility"(%0) : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "scf_for_constant_step"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 64 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    "scf.for"(%0, %1, %2) ({
    ^bb0(%arg0: index):
      %3 = "test.int_divisibility"(%arg0) : (index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "scf_for_nontrivial_gcd"}> ({
    %0 = "arith.constant"() <{value = 12 : index}> : () -> index
    %1 = "arith.constant"() <{value = 100 : index}> : () -> index
    %2 = "arith.constant"() <{value = 18 : index}> : () -> index
    "scf.for"(%0, %1, %2) ({
    ^bb0(%arg0: index):
      %3 = "test.int_divisibility"(%arg0) : (index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "scf_for_coprime"}> ({
    %0 = "arith.constant"() <{value = 15 : index}> : () -> index
    %1 = "arith.constant"() <{value = 100 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    "scf.for"(%0, %1, %2) ({
    ^bb0(%arg0: index):
      %3 = "test.int_divisibility"(%arg0) : (index) -> index
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 * 8 + 16)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_apply_mul_plus_const"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 4 : index}> : () -> index
    %1 = "arith.muli"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %2 = "affine.apply"(%1) <{map = #map}> : (index) -> index
    %3 = "test.int_divisibility"(%2) : (index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

