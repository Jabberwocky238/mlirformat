"builtin.module"() ({
  "func.func"() <{function_type = (memref<512xf32, affine_map<(d0) -> (d0 floordiv 32, d0 mod 32)>>) -> (), sym_name = "prefetch_normalize"}> ({
  ^bb0(%arg9: memref<512xf32, affine_map<(d0) -> (d0 floordiv 32, d0 mod 32)>> loc("<stdin>":12:8)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (8)>}> ({
    ^bb0(%arg10: index loc("<stdin>":14:10)):
      "affine.prefetch"(%arg9, %arg10) <{isDataCache = true, isWrite = false, localityHint = 3 : i32, map = affine_map<(d0) -> (d0)>}> : (memref<512xf32, affine_map<(d0) -> (d0 floordiv 32, d0 mod 32)>>, index) -> () loc("<stdin>":15:7)
      "affine.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (memref<5x7xf32>, memref<5x7xf32>, memref<5x7xf32>) -> (), sym_name = "test_reinterpret_cast"}> ({
  ^bb0(%arg4: memref<5x7xf32> loc("<stdin>":21:8), %arg5: memref<5x7xf32> loc("<stdin>":21:32), %arg6: memref<5x7xf32> loc("<stdin>":21:56)):
    %4 = "memref.reinterpret_cast"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 5, 7>, static_strides = array<i64: 7, 1>}> : (memref<5x7xf32>) -> memref<5x7xf32, affine_map<(d0, d1) -> (d0 * 7 + d1)>> loc("<stdin>":22:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (5)>}> ({
    ^bb0(%arg7: index loc("<stdin>":24:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (7)>}> ({
      ^bb0(%arg8: index loc("<stdin>":26:12)):
        %5 = "affine.load"(%4, %arg7, %arg8) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<5x7xf32, affine_map<(d0, d1) -> (d0 * 7 + d1)>>, index, index) -> f32 loc("<stdin>":27:14)
        %6 = "affine.load"(%arg5, %arg7, %arg8) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<5x7xf32>, index, index) -> f32 loc("<stdin>":28:14)
        %7 = "arith.subf"(%5, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":29:14)
        "affine.store"(%7, %arg6, %arg7, %arg8) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<5x7xf32>, index, index) -> () loc("<stdin>":30:9)
        "affine.yield"() : () -> () loc("<stdin>":31:9)
      }) : () -> () loc("<stdin>":25:7)
      "affine.yield"() : () -> () loc("<stdin>":33:7)
    }) : () -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (index, memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>, memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>, memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>) -> (memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<2x17xf32>, memref<1x10x17xi32>, memref<1x10x17xf32>), sym_name = "reinterpret_cast_non_zero_offset"}> ({
  ^bb0(%arg0: index loc("<stdin>":38:8), %arg1: memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>> loc("<stdin>":38:22), %arg2: memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>> loc("<stdin>":38:81), %arg3: memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>> loc("<stdin>":38:140)):
    %0 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10x17xi32> loc("<stdin>":39:10)
    %1 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x17xf32> loc("<stdin>":40:10)
    %2 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x10x17xf32> loc("<stdin>":41:10)
    "cf.br"()[^bb1] : () -> () loc("<stdin>":42:5)
  ^bb1:  // pred: ^bb0
    %3 = "memref.reinterpret_cast"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 27>, static_sizes = array<i64: 1, 5>, static_strides = array<i64: 17, 1>}> : (memref<2x17xf32>) -> memref<1x5xf32, strided<[17, 1], offset: 27>> loc("<stdin>":44:10)
    "func.return"(%3, %3, %1, %0, %2) : (memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<2x17xf32>, memref<1x10x17xi32>, memref<1x10x17xf32>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":37:3)
}) : () -> () loc("<stdin>":10:1)
