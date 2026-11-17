"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %17 = "arith.constant"() <{value = 256 : i32}> : () -> i32 loc("<stdin>":3:11)
    "func.call"(%17) <{callee = @setArmVLBits}> : (i32) -> () loc("<stdin>":4:5)
    "func.call"() <{callee = @pack_unpack_with_scalable_inner_tile}> : () -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "pack_unpack_with_scalable_inner_tile"}> ({
    %8 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":9:10)
    %9 = "vector.vscale"() : () -> index loc("<stdin>":10:10)
    %10 = "arith.muli"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":11:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AINNER TILE SIZE (run-time value): "}> : () -> () loc("<stdin>":12:5)
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":13:5)
    %11 = "arith.constant"() <{value = dense<[[1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3], [4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6], [4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6], [4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6]]> : tensor<7x12xi32>}> : () -> tensor<7x12xi32> loc("<stdin>":14:11)
    %12 = "func.call"(%11, %10) <{callee = @pack_main}> : (tensor<7x12xi32>, index) -> tensor<2x?x4x?xi32> loc("<stdin>":15:11)
    %13 = "func.call"(%12, %10) <{callee = @unpack_main}> : (tensor<2x?x4x?xi32>, index) -> tensor<7x12xi32> loc("<stdin>":16:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AINPUT MATRIX (before packing)\0A"}> : () -> () loc("<stdin>":17:5)
    %14 = "tensor.cast"(%11) : (tensor<7x12xi32>) -> tensor<*xi32> loc("<stdin>":18:11)
    "func.call"(%14) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":19:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AINPUT MATRIX (after packing)\0A"}> : () -> () loc("<stdin>":20:5)
    %15 = "tensor.cast"(%12) : (tensor<2x?x4x?xi32>) -> tensor<*xi32> loc("<stdin>":21:11)
    "func.call"(%15) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":22:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "\0AINPUT MATRIX (after unpacking)\0A"}> : () -> () loc("<stdin>":23:5)
    %16 = "tensor.cast"(%13) : (tensor<7x12xi32>) -> tensor<*xi32> loc("<stdin>":24:11)
    "func.call"(%16) <{callee = @printMemrefI32}> : (tensor<*xi32>) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<7x12xi32>, index) -> tensor<2x?x4x?xi32>, sym_name = "pack_main", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<7x12xi32> loc("<stdin>":29:8), %arg3: index loc("<stdin>":29:33)):
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":30:10)
    %3 = "tensor.dim"(%arg2, %2) : (tensor<7x12xi32>, index) -> index loc("<stdin>":31:10)
    %4 = "arith.ceildivui"(%3, %arg3) : (index, index) -> index loc("<stdin>":32:10)
    %5 = "arith.constant"() <{value = 123 : i32}> : () -> i32 loc("<stdin>":33:10)
    %6 = "tensor.empty"(%4, %arg3) : (index, index) -> tensor<2x?x4x?xi32> loc("<stdin>":34:10)
    %7 = "linalg.pack"(%arg2, %6, %5, %arg3) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_inner_tiles = array<i64: 4, -9223372036854775808>}> : (tensor<7x12xi32>, tensor<2x?x4x?xi32>, i32, index) -> tensor<2x?x4x?xi32> loc("<stdin>":35:10)
    "func.return"(%7) : (tensor<2x?x4x?xi32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (tensor<2x?x4x?xi32>, index) -> tensor<7x12xi32>, sym_name = "unpack_main", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<2x?x4x?xi32> loc("<stdin>":39:8), %arg1: index loc("<stdin>":39:36)):
    %0 = "tensor.empty"() : () -> tensor<7x12xi32> loc("<stdin>":40:10)
    %1 = "linalg.unpack"(%arg0, %0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 4, -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 1>} : (tensor<2x?x4x?xi32>, tensor<7x12xi32>, index) -> tensor<7x12xi32> loc("<stdin>":41:10)
    "func.return"(%1) : (tensor<7x12xi32>) -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":38:3)
  "func.func"() <{function_type = (tensor<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":46:3)
}) : () -> () loc("<stdin>":1:1)
