"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xi32>) -> index, sym_name = "dim_const"}> ({
  ^bb0(%arg0: memref<3x5xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<3x5xi32>, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xi32>, index) -> index, sym_name = "dim_any_static"}> ({
  ^bb0(%arg0: memref<3x5xi32>, %arg1: index):
    %0 = "memref.dim"(%arg0, %arg1) : (memref<3x5xi32>, index) -> index
    %1 = "test.reflect_bounds"(%0) : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x5xi32>) -> index, sym_name = "dim_dynamic"}> ({
  ^bb0(%arg0: memref<?x5xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<?x5xi32>, index) -> index
    %2 = "test.reflect_bounds"(%1) : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x5xi32>, index) -> index, sym_name = "dim_any_dynamic"}> ({
  ^bb0(%arg0: memref<?x5xi32>, %arg1: index):
    %0 = "memref.dim"(%arg0, %arg1) : (memref<?x5xi32>, index) -> index
    %1 = "test.reflect_bounds"(%0) : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x3x5xi32>, index) -> index, sym_name = "dim_some_omitting_dynamic"}> ({
  ^bb0(%arg0: memref<?x3x5xi32>, %arg1: index):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.maxsi"(%arg1, %0) : (index, index) -> index
    %2 = "memref.dim"(%arg0, %1) : (memref<?x3x5xi32>, index) -> index
    %3 = "test.reflect_bounds"(%2) : (index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xi32>) -> index, sym_name = "dim_unranked"}> ({
  ^bb0(%arg0: memref<*xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.dim"(%arg0, %0) : (memref<*xi32>, index) -> index
    %2 = "test.reflect_bounds"(%1) : (index) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

