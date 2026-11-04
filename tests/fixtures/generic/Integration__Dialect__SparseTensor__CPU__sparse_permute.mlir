#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d2 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d0 : compressed, d2 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d1 : compressed, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64>) -> (), sym_name = "dump"}> ({
  ^bb0(%arg30: tensor<2x3x4xf64>):
    %38 = "arith.constant"() <{value = 0 : index}> : () -> index
    %39 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %40 = "vector.transfer_read"(%arg30, %38, %38, %38, %39) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map}> : (tensor<2x3x4xf64>, index, index, index, f64) -> vector<2x3x4xf64>
    "vector.print"(%40) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>, sym_name = "linalg1"}> ({
  ^bb0(%arg27: tensor<2x3x4xf64, #sparse>):
    %36 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %37 = "linalg.generic"(%arg27, %36) <{doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg28: f64, %arg29: f64):
      "linalg.yield"(%arg28) : (f64) -> ()
    }) : (tensor<2x3x4xf64, #sparse>, tensor<2x3x4xf64>) -> tensor<2x3x4xf64>
    "func.return"(%37) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>, sym_name = "convert1"}> ({
  ^bb0(%arg26: tensor<2x3x4xf64, #sparse>):
    %35 = "sparse_tensor.convert"(%arg26) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>
    "func.return"(%35) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "foo1"}> ({
  ^bb0(%arg25: !llvm.ptr):
    %32 = "sparse_tensor.new"(%arg25) : (!llvm.ptr) -> tensor<2x3x4xf64, #sparse>
    %33 = "func.call"(%32) <{callee = @linalg1}> : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>
    "func.call"(%33) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    %34 = "func.call"(%32) <{callee = @convert1}> : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64>
    "func.call"(%34) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%33) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%32) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%34) : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64>, sym_name = "linalg2"}> ({
  ^bb0(%arg22: tensor<2x3x4xf64, #sparse1>):
    %30 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %31 = "linalg.generic"(%arg22, %30) <{doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg23: f64, %arg24: f64):
      "linalg.yield"(%arg23) : (f64) -> ()
    }) : (tensor<2x3x4xf64, #sparse1>, tensor<2x3x4xf64>) -> tensor<2x3x4xf64>
    "func.return"(%31) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64>, sym_name = "convert2"}> ({
  ^bb0(%arg21: tensor<2x3x4xf64, #sparse1>):
    %29 = "sparse_tensor.convert"(%arg21) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64>
    "func.return"(%29) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "foo2"}> ({
  ^bb0(%arg20: !llvm.ptr):
    %26 = "sparse_tensor.new"(%arg20) : (!llvm.ptr) -> tensor<2x3x4xf64, #sparse1>
    %27 = "func.call"(%26) <{callee = @linalg2}> : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64>
    "func.call"(%27) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    %28 = "func.call"(%26) <{callee = @convert2}> : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64>
    "func.call"(%28) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%27) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%26) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%28) : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>, sym_name = "linalg3"}> ({
  ^bb0(%arg17: tensor<2x3x4xf64, #sparse2>):
    %24 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %25 = "linalg.generic"(%arg17, %24) <{doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg18: f64, %arg19: f64):
      "linalg.yield"(%arg18) : (f64) -> ()
    }) : (tensor<2x3x4xf64, #sparse2>, tensor<2x3x4xf64>) -> tensor<2x3x4xf64>
    "func.return"(%25) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>, sym_name = "convert3"}> ({
  ^bb0(%arg16: tensor<2x3x4xf64, #sparse2>):
    %23 = "sparse_tensor.convert"(%arg16) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>
    "func.return"(%23) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "foo3"}> ({
  ^bb0(%arg15: !llvm.ptr):
    %20 = "sparse_tensor.new"(%arg15) : (!llvm.ptr) -> tensor<2x3x4xf64, #sparse2>
    %21 = "func.call"(%20) <{callee = @linalg3}> : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>
    "func.call"(%21) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    %22 = "func.call"(%20) <{callee = @convert3}> : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>
    "func.call"(%22) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%21) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%20) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%22) : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64>, sym_name = "linalg4"}> ({
  ^bb0(%arg12: tensor<2x3x4xf64, #sparse3>):
    %18 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %19 = "linalg.generic"(%arg12, %18) <{doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f64, %arg14: f64):
      "linalg.yield"(%arg13) : (f64) -> ()
    }) : (tensor<2x3x4xf64, #sparse3>, tensor<2x3x4xf64>) -> tensor<2x3x4xf64>
    "func.return"(%19) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64>, sym_name = "convert4"}> ({
  ^bb0(%arg11: tensor<2x3x4xf64, #sparse3>):
    %17 = "sparse_tensor.convert"(%arg11) : (tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64>
    "func.return"(%17) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "foo4"}> ({
  ^bb0(%arg10: !llvm.ptr):
    %14 = "sparse_tensor.new"(%arg10) : (!llvm.ptr) -> tensor<2x3x4xf64, #sparse3>
    %15 = "func.call"(%14) <{callee = @linalg4}> : (tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64>
    "func.call"(%15) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    %16 = "func.call"(%14) <{callee = @convert4}> : (tensor<2x3x4xf64, #sparse3>) -> tensor<2x3x4xf64>
    "func.call"(%16) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<2x3x4xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64>, sym_name = "linalg5"}> ({
  ^bb0(%arg7: tensor<2x3x4xf64, #sparse4>):
    %12 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %13 = "linalg.generic"(%arg7, %12) <{doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f64, %arg9: f64):
      "linalg.yield"(%arg8) : (f64) -> ()
    }) : (tensor<2x3x4xf64, #sparse4>, tensor<2x3x4xf64>) -> tensor<2x3x4xf64>
    "func.return"(%13) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64>, sym_name = "convert5"}> ({
  ^bb0(%arg6: tensor<2x3x4xf64, #sparse4>):
    %11 = "sparse_tensor.convert"(%arg6) : (tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64>
    "func.return"(%11) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "foo5"}> ({
  ^bb0(%arg5: !llvm.ptr):
    %8 = "sparse_tensor.new"(%arg5) : (!llvm.ptr) -> tensor<2x3x4xf64, #sparse4>
    %9 = "func.call"(%8) <{callee = @linalg5}> : (tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64>
    "func.call"(%9) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    %10 = "func.call"(%8) <{callee = @convert5}> : (tensor<2x3x4xf64, #sparse4>) -> tensor<2x3x4xf64>
    "func.call"(%10) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<2x3x4xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64>, sym_name = "linalg6"}> ({
  ^bb0(%arg2: tensor<2x3x4xf64, #sparse5>):
    %6 = "arith.constant"() <{value = dense<0.000000e+00> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %7 = "linalg.generic"(%arg2, %6) <{doc = "A(i,j,k) = B(i,j,k)", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64):
      "linalg.yield"(%arg3) : (f64) -> ()
    }) : (tensor<2x3x4xf64, #sparse5>, tensor<2x3x4xf64>) -> tensor<2x3x4xf64>
    "func.return"(%7) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64>, sym_name = "convert6"}> ({
  ^bb0(%arg1: tensor<2x3x4xf64, #sparse5>):
    %5 = "sparse_tensor.convert"(%arg1) : (tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64>
    "func.return"(%5) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "foo6"}> ({
  ^bb0(%arg0: !llvm.ptr):
    %2 = "sparse_tensor.new"(%arg0) : (!llvm.ptr) -> tensor<2x3x4xf64, #sparse5>
    %3 = "func.call"(%2) <{callee = @linalg6}> : (tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64>
    "func.call"(%3) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    %4 = "func.call"(%2) <{callee = @convert6}> : (tensor<2x3x4xf64, #sparse5>) -> tensor<2x3x4xf64>
    "func.call"(%4) <{callee = @dump}> : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<2x3x4xf64>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<2x3x4xf64, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<2x3x4xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "func.call"(%0) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    "func.call"(%1) <{callee = @foo1}> : (!llvm.ptr) -> ()
    "func.call"(%1) <{callee = @foo2}> : (!llvm.ptr) -> ()
    "func.call"(%1) <{callee = @foo3}> : (!llvm.ptr) -> ()
    "func.call"(%1) <{callee = @foo4}> : (!llvm.ptr) -> ()
    "func.call"(%1) <{callee = @foo5}> : (!llvm.ptr) -> ()
    "func.call"(%1) <{callee = @foo6}> : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

