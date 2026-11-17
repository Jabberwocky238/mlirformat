"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[1, 10]>>, memref<4x5x6xf32, strided<[1, ?, 1000]>>, index, index) -> (), sym_name = "expand_collapse_shape_transposed_layout"}> ({
  ^bb0(%arg0: memref<?x?xf32, strided<[1, 10]>> loc("<stdin>":4:8), %arg1: memref<4x5x6xf32, strided<[1, ?, 1000]>> loc("<stdin>":4:50), %arg2: index loc("<stdin>":4:99), %arg3: index loc("<stdin>":4:113)):
    %0 = "memref.expand_shape"(%arg0, %arg2, %arg3) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, 5>}> : (memref<?x?xf32, strided<[1, 10]>>, index, index) -> memref<?x?x5xf32, strided<[1, 50, 10]>> loc("<stdin>":5:10)
    %1 = "memref.collapse_shape"(%0) <{reassociation = [[0], [1, 2]]}> : (memref<?x?x5xf32, strided<[1, 50, 10]>>) -> memref<?x?xf32, strided<[1, 10]>> loc("<stdin>":6:10)
    %2 = "memref.expand_shape"(%arg1) <{reassociation = [[0, 1], [2], [3, 4]], static_output_shape = array<i64: 2, 2, 5, 2, 3>}> : (memref<4x5x6xf32, strided<[1, ?, 1000]>>) -> memref<2x2x5x2x3xf32, strided<[2, 1, ?, 3000, 1000]>> loc("<stdin>":7:10)
    %3 = "memref.collapse_shape"(%2) <{reassociation = [[0, 1], [2], [3, 4]]}> : (memref<2x2x5x2x3xf32, strided<[2, 1, ?, 3000, 1000]>>) -> memref<4x5x6xf32, strided<[1, ?, 1000]>> loc("<stdin>":8:10)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
