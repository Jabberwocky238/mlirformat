"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "empty"}> ({
    %11 = "tensor.empty"() : () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:11)
    "func.return"(%11) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "empty_alloc"}> ({
    %10 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":9:11)
    "func.return"(%10) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "zeros"}> ({
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":13:10)
    %8 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":14:10)
    %9 = "linalg.generic"(%8) <{indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":16:10)):
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":17:7)
    }) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":15:10)
    "func.return"(%9) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "ones"}> ({
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":22:10)
    %5 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":23:10)
    %6 = "linalg.generic"(%5) <{indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg0: f32 loc("<stdin>":25:10)):
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":26:7)
    }) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":24:10)
    "func.return"(%6) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "func.call"() <{callee = @empty}> : () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":31:10)
    %1 = "func.call"() <{callee = @empty_alloc}> : () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:10)
    %2 = "func.call"() <{callee = @zeros}> : () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":33:10)
    %3 = "func.call"() <{callee = @ones}> : () -> tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":34:10)
    "sparse_tensor.print"(%0) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":35:5)
    "sparse_tensor.print"(%1) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":36:5)
    "sparse_tensor.print"(%2) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":37:5)
    "sparse_tensor.print"(%3) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":38:5)
    "bufferization.dealloc_tensor"(%0) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":39:5)
    "bufferization.dealloc_tensor"(%1) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":40:5)
    "bufferization.dealloc_tensor"(%2) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":41:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<10xf32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":42:5)
    "func.return"() : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":3:1)
