#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<10xf32, #sparse>, sym_name = "empty"}> ({
    %11 = "tensor.empty"() : () -> tensor<10xf32, #sparse>
    "func.return"(%11) : (tensor<10xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<10xf32, #sparse>, sym_name = "empty_alloc"}> ({
    %10 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<10xf32, #sparse>
    "func.return"(%10) : (tensor<10xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<10xf32, #sparse>, sym_name = "zeros"}> ({
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %8 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<10xf32, #sparse>
    %9 = "linalg.generic"(%8) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32):
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<10xf32, #sparse>) -> tensor<10xf32, #sparse>
    "func.return"(%9) : (tensor<10xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<10xf32, #sparse>, sym_name = "ones"}> ({
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %5 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<10xf32, #sparse>
    %6 = "linalg.generic"(%5) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg0: f32):
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<10xf32, #sparse>) -> tensor<10xf32, #sparse>
    "func.return"(%6) : (tensor<10xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "func.call"() <{callee = @empty}> : () -> tensor<10xf32, #sparse>
    %1 = "func.call"() <{callee = @empty_alloc}> : () -> tensor<10xf32, #sparse>
    %2 = "func.call"() <{callee = @zeros}> : () -> tensor<10xf32, #sparse>
    %3 = "func.call"() <{callee = @ones}> : () -> tensor<10xf32, #sparse>
    "sparse_tensor.print"(%0) : (tensor<10xf32, #sparse>) -> ()
    "sparse_tensor.print"(%1) : (tensor<10xf32, #sparse>) -> ()
    "sparse_tensor.print"(%2) : (tensor<10xf32, #sparse>) -> ()
    "sparse_tensor.print"(%3) : (tensor<10xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%0) : (tensor<10xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<10xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<10xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<10xf32, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

