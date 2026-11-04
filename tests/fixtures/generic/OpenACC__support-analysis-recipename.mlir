"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_private_2d_memref"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.recipe_name = #acc.recipe_kind<private_recipe>} : () -> memref<5x10xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_firstprivate_2d_memref"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.recipe_name = #acc.recipe_kind<firstprivate_recipe>} : () -> memref<8x16xf64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_reduction_2d_memref"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.recipe_name = #acc.recipe_kind<reduction_recipe>} : () -> memref<4x8xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x10xi32>) -> (), sym_name = "test_private_dynamic_memref"}> ({
  ^bb0(%arg0: memref<5x10xi32>):
    %0 = "memref.cast"(%arg0) {test.recipe_name = #acc.recipe_kind<private_recipe>} : (memref<5x10xi32>) -> memref<?x10xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_private_scalar_memref"}> ({
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> {test.recipe_name = #acc.recipe_kind<private_recipe>} : () -> memref<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xi32>) -> (), sym_name = "test_private_unranked_memref"}> ({
  ^bb0(%arg0: memref<10xi32>):
    %0 = "memref.cast"(%arg0) {test.recipe_name = #acc.recipe_kind<private_recipe>} : (memref<10xi32>) -> memref<*xi32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

