#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : compressed, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>
#sparse7 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : compressed, d1 floordiv 4 : compressed, d1 mod 4 : dense, d0 mod 2 : dense) }>
#sparse8 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 floordiv 4 : compressed, d0 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>
#sparse9 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 floordiv 4 : compressed, d0 floordiv 2 : compressed, d1 mod 4 : dense, d0 mod 2 : dense) }>
#sparse10 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 4 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>
#sparse11 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 floordiv 4 : dense, d0 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 4 : dense) }>
#sparse12 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse13 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1, 0, 2, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 3, 4, 0, 5, 0, 0]]> : tensor<4x8xi32>}> : () -> tensor<4x8xi32>
    %1 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse>
    %2 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse1>
    "sparse_tensor.print"(%1) : (tensor<4x8xi32, #sparse>) -> ()
    "sparse_tensor.print"(%2) : (tensor<4x8xi32, #sparse1>) -> ()
    %3 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse2>
    %4 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse3>
    %5 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse4>
    %6 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse5>
    %7 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse6>
    %8 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse7>
    %9 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse8>
    %10 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse9>
    %11 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse10>
    %12 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse11>
    %13 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse12>
    %14 = "sparse_tensor.convert"(%0) : (tensor<4x8xi32>) -> tensor<4x8xi32, #sparse13>
    "sparse_tensor.print"(%3) : (tensor<4x8xi32, #sparse2>) -> ()
    "sparse_tensor.print"(%4) : (tensor<4x8xi32, #sparse3>) -> ()
    "sparse_tensor.print"(%5) : (tensor<4x8xi32, #sparse4>) -> ()
    "sparse_tensor.print"(%6) : (tensor<4x8xi32, #sparse5>) -> ()
    "sparse_tensor.print"(%7) : (tensor<4x8xi32, #sparse6>) -> ()
    "sparse_tensor.print"(%8) : (tensor<4x8xi32, #sparse7>) -> ()
    "sparse_tensor.print"(%9) : (tensor<4x8xi32, #sparse8>) -> ()
    "sparse_tensor.print"(%10) : (tensor<4x8xi32, #sparse9>) -> ()
    "sparse_tensor.print"(%11) : (tensor<4x8xi32, #sparse10>) -> ()
    "sparse_tensor.print"(%12) : (tensor<4x8xi32, #sparse11>) -> ()
    "sparse_tensor.print"(%13) : (tensor<4x8xi32, #sparse12>) -> ()
    "sparse_tensor.print"(%14) : (tensor<4x8xi32, #sparse13>) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<4x8xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<4x8xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<4x8xi32, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<4x8xi32, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<4x8xi32, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<4x8xi32, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<4x8xi32, #sparse6>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<4x8xi32, #sparse7>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<4x8xi32, #sparse8>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<4x8xi32, #sparse9>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<4x8xi32, #sparse10>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<4x8xi32, #sparse11>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<4x8xi32, #sparse12>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<4x8xi32, #sparse13>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

