"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %17 = "arith.constant"() <{value = 256 : i32}> : () -> i32
    "func.call"(%17) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @pack_unpack_with_scalable_inner_tile}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "pack_unpack_with_scalable_inner_tile"}> ({
    %8 = "arith.constant"() <{value = 4 : index}> : () -> index
    %9 = "vector.vscale"() : () -> index
    %10 = "arith.muli"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AINNER TILE SIZE (run-time value): "}> : () -> ()
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    %11 = "arith.constant"() <{value = dense<[[1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6], [4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6], [4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6]]> : tensor<7x12xi32>}> : () -> tensor<7x12xi32>
    %12 = "func.call"(%11, %10) <{callee = @pack_main}> : (tensor<7x12xi32>, index) -> tensor<2x?x4x?xi32>
    %13 = "func.call"(%12, %10) <{callee = @unpack_main}> : (tensor<2x?x4x?xi32>, index) -> tensor<7x12xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AINPUT MATRIX (before packing)\0A"}> : () -> ()
    %14 = "tensor.cast"(%11) : (tensor<7x12xi32>) -> tensor<*xi32>
    "func.call"(%14) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AINPUT MATRIX (after packing)\0A"}> : () -> ()
    %15 = "tensor.cast"(%12) : (tensor<2x?x4x?xi32>) -> tensor<*xi32>
    "func.call"(%15) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AINPUT MATRIX (after unpacking)\0A"}> : () -> ()
    %16 = "tensor.cast"(%13) : (tensor<7x12xi32>) -> tensor<*xi32>
    "func.call"(%16) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<7x12xi32>, index) -> tensor<2x?x4x?xi32>, sym_name = "pack_main", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<7x12xi32>, %arg3: index):
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "tensor.dim"(%arg2, %2) : (tensor<7x12xi32>, index) -> index
    %4 = "arith.ceildivui"(%3, %arg3) : (index, index) -> index
    %5 = "arith.constant"() <{value = 123 : i32}> : () -> i32
    %6 = "tensor.empty"(%4, %arg3) : (index, index) -> tensor<2x?x4x?xi32>
    %7 = "linalg.pack"(%arg2, %6, %5, %arg3) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_inner_tiles = array<i64: 4, -9223372036854775808>}> : (tensor<7x12xi32>, tensor<2x?x4x?xi32>, i32, index) -> tensor<2x?x4x?xi32>
    "func.return"(%7) : (tensor<2x?x4x?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x?x4x?xi32>, index) -> tensor<7x12xi32>, sym_name = "unpack_main", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<2x?x4x?xi32>, %arg1: index):
    %0 = "tensor.empty"() : () -> tensor<7x12xi32>
    %1 = "linalg.unpack"(%arg0, %0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 4, -9223372036854775808>}> : (tensor<2x?x4x?xi32>, tensor<7x12xi32>, index) -> tensor<7x12xi32>
    "func.return"(%1) : (tensor<7x12xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

