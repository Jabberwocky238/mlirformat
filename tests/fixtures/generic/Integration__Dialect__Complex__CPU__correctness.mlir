"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> (), sym_name = "test_unary"}> ({
  ^bb0(%arg20: tensor<?xcomplex<f32>>, %arg21: (complex<f32>) -> complex<f32>):
    %56 = "arith.constant"() <{value = 0 : index}> : () -> index
    %57 = "arith.constant"() <{value = 1 : index}> : () -> index
    %58 = "tensor.dim"(%arg20, %56) : (tensor<?xcomplex<f32>>, index) -> index
    "scf.for"(%56, %58, %57) ({
    ^bb0(%arg22: index):
      %59 = "tensor.extract"(%arg20, %arg22) : (tensor<?xcomplex<f32>>, index) -> complex<f32>
      %60 = "func.call_indirect"(%arg21, %59) : ((complex<f32>) -> complex<f32>, complex<f32>) -> complex<f32>
      %61 = "complex.re"(%60) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
      %62 = "complex.im"(%60) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
      "vector.print"(%61) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
      "vector.print"(%62) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f32>) -> complex<f32>, sym_name = "sqrt"}> ({
  ^bb0(%arg19: complex<f32>):
    %55 = "complex.sqrt"(%arg19) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    "func.return"(%55) : (complex<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f32>) -> complex<f32>, sym_name = "tanh"}> ({
  ^bb0(%arg18: complex<f32>):
    %54 = "complex.tanh"(%arg18) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    "func.return"(%54) : (complex<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f32>) -> complex<f32>, sym_name = "rsqrt"}> ({
  ^bb0(%arg17: complex<f32>):
    %53 = "complex.rsqrt"(%arg17) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    "func.return"(%53) : (complex<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f32>) -> complex<f32>, sym_name = "conj"}> ({
  ^bb0(%arg16: complex<f32>):
    %52 = "complex.conj"(%arg16) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    "func.return"(%52) : (complex<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f32>) -> complex<f32>, sym_name = "exp"}> ({
  ^bb0(%arg15: complex<f32>):
    %51 = "complex.exp"(%arg15) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> complex<f32>
    "func.return"(%51) : (complex<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f32>>, (complex<f32>, complex<f32>) -> complex<f32>) -> (), sym_name = "test_binary"}> ({
  ^bb0(%arg12: tensor<?xcomplex<f32>>, %arg13: (complex<f32>, complex<f32>) -> complex<f32>):
    %41 = "arith.constant"() <{value = 0 : index}> : () -> index
    %42 = "arith.constant"() <{value = 1 : index}> : () -> index
    %43 = "arith.constant"() <{value = 2 : index}> : () -> index
    %44 = "tensor.dim"(%arg12, %41) : (tensor<?xcomplex<f32>>, index) -> index
    "scf.for"(%41, %44, %43) ({
    ^bb0(%arg14: index):
      %45 = "tensor.extract"(%arg12, %arg14) : (tensor<?xcomplex<f32>>, index) -> complex<f32>
      %46 = "arith.addi"(%arg14, %42) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %47 = "tensor.extract"(%arg12, %46) : (tensor<?xcomplex<f32>>, index) -> complex<f32>
      %48 = "func.call_indirect"(%arg13, %45, %47) : ((complex<f32>, complex<f32>) -> complex<f32>, complex<f32>, complex<f32>) -> complex<f32>
      %49 = "complex.re"(%48) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
      %50 = "complex.im"(%48) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
      "vector.print"(%49) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
      "vector.print"(%50) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "atan2"}> ({
  ^bb0(%arg10: complex<f32>, %arg11: complex<f32>):
    %40 = "complex.atan2"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
    "func.return"(%40) : (complex<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f32>, complex<f32>) -> complex<f32>, sym_name = "pow"}> ({
  ^bb0(%arg8: complex<f32>, %arg9: complex<f32>):
    %39 = "complex.pow"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
    "func.return"(%39) : (complex<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f32>>, (complex<f32>) -> f32) -> (), sym_name = "test_element"}> ({
  ^bb0(%arg5: tensor<?xcomplex<f32>>, %arg6: (complex<f32>) -> f32):
    %34 = "arith.constant"() <{value = 0 : index}> : () -> index
    %35 = "arith.constant"() <{value = 1 : index}> : () -> index
    %36 = "tensor.dim"(%arg5, %34) : (tensor<?xcomplex<f32>>, index) -> index
    "scf.for"(%34, %36, %35) ({
    ^bb0(%arg7: index):
      %37 = "tensor.extract"(%arg5, %arg7) : (tensor<?xcomplex<f32>>, index) -> complex<f32>
      %38 = "func.call_indirect"(%arg6, %37) : ((complex<f32>) -> f32, complex<f32>) -> f32
      "vector.print"(%38) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f32>) -> f32, sym_name = "angle"}> ({
  ^bb0(%arg4: complex<f32>):
    %33 = "complex.angle"(%arg4) <{fastmath = #arith.fastmath<none>}> : (complex<f32>) -> f32
    "func.return"(%33) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xcomplex<f64>>, (complex<f64>) -> f64) -> (), sym_name = "test_element_f64"}> ({
  ^bb0(%arg1: tensor<?xcomplex<f64>>, %arg2: (complex<f64>) -> f64):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index
    %30 = "tensor.dim"(%arg1, %28) : (tensor<?xcomplex<f64>>, index) -> index
    "scf.for"(%28, %30, %29) ({
    ^bb0(%arg3: index):
      %31 = "tensor.extract"(%arg1, %arg3) : (tensor<?xcomplex<f64>>, index) -> complex<f64>
      %32 = "func.call_indirect"(%arg2, %31) : ((complex<f64>) -> f64, complex<f64>) -> f64
      "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (complex<f64>) -> f64, sym_name = "abs"}> ({
  ^bb0(%arg0: complex<f64>):
    %27 = "complex.abs"(%arg0) <{fastmath = #arith.fastmath<none>}> : (complex<f64>) -> f64
    "func.return"(%27) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>}> : () -> tensor<7xcomplex<f32>>
    %1 = "tensor.cast"(%0) : (tensor<7xcomplex<f32>>) -> tensor<?xcomplex<f32>>
    %2 = "func.constant"() <{value = @sqrt}> : () -> ((complex<f32>) -> complex<f32>)
    "func.call"(%1, %2) <{callee = @test_unary}> : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    %3 = "arith.constant"() <{value = dense<[(1.000000e+00,2.000000e+00), (2.000000e+00,1.000000e+00), (1.000000e+00,1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<6xcomplex<f32>>}> : () -> tensor<6xcomplex<f32>>
    %4 = "tensor.cast"(%3) : (tensor<6xcomplex<f32>>) -> tensor<?xcomplex<f32>>
    %5 = "func.constant"() <{value = @atan2}> : () -> ((complex<f32>, complex<f32>) -> complex<f32>)
    "func.call"(%4, %5) <{callee = @test_binary}> : (tensor<?xcomplex<f32>>, (complex<f32>, complex<f32>) -> complex<f32>) -> ()
    %6 = "arith.constant"() <{value = dense<[(0.000000e+00,0.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,0.000000e+00), (1.000000e+00,0.000000e+00), (0.000000e+00,0.000000e+00), (-1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<8xcomplex<f32>>}> : () -> tensor<8xcomplex<f32>>
    %7 = "tensor.cast"(%6) : (tensor<8xcomplex<f32>>) -> tensor<?xcomplex<f32>>
    %8 = "func.constant"() <{value = @pow}> : () -> ((complex<f32>, complex<f32>) -> complex<f32>)
    "func.call"(%7, %8) <{callee = @test_binary}> : (tensor<?xcomplex<f32>>, (complex<f32>, complex<f32>) -> complex<f32>) -> ()
    %9 = "arith.constant"() <{value = dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>}> : () -> tensor<7xcomplex<f32>>
    %10 = "tensor.cast"(%9) : (tensor<7xcomplex<f32>>) -> tensor<?xcomplex<f32>>
    %11 = "func.constant"() <{value = @tanh}> : () -> ((complex<f32>) -> complex<f32>)
    "func.call"(%10, %11) <{callee = @test_unary}> : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    %12 = "arith.constant"() <{value = dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>}> : () -> tensor<7xcomplex<f32>>
    %13 = "tensor.cast"(%12) : (tensor<7xcomplex<f32>>) -> tensor<?xcomplex<f32>>
    %14 = "func.constant"() <{value = @rsqrt}> : () -> ((complex<f32>) -> complex<f32>)
    "func.call"(%13, %14) <{callee = @test_unary}> : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    %15 = "arith.constant"() <{value = dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>}> : () -> tensor<7xcomplex<f32>>
    %16 = "tensor.cast"(%15) : (tensor<7xcomplex<f32>>) -> tensor<?xcomplex<f32>>
    %17 = "func.constant"() <{value = @conj}> : () -> ((complex<f32>) -> complex<f32>)
    "func.call"(%16, %17) <{callee = @test_unary}> : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    %18 = "arith.constant"() <{value = dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>}> : () -> tensor<7xcomplex<f32>>
    %19 = "tensor.cast"(%18) : (tensor<7xcomplex<f32>>) -> tensor<?xcomplex<f32>>
    %20 = "func.constant"() <{value = @angle}> : () -> ((complex<f32>) -> f32)
    "func.call"(%19, %20) <{callee = @test_element}> : (tensor<?xcomplex<f32>>, (complex<f32>) -> f32) -> ()
    %21 = "arith.constant"() <{value = dense<[(1.000000e+00,1.000000e+00), (1.000000e+300,1.000000e+300), (1.000000e-300,1.000000e-300), (5.000000e+00,0.000000e+00), (0.000000e+00,6.000000e+00), (7.000000e+00,8.000000e+00), (-1.000000e+00,-1.000000e+00), (-1.000000e+300,-1.000000e+300), (-1.000000e+00,0.000000e+00), (0.000000e+00,-1.000000e+00)]> : tensor<10xcomplex<f64>>}> : () -> tensor<10xcomplex<f64>>
    %22 = "tensor.cast"(%21) : (tensor<10xcomplex<f64>>) -> tensor<?xcomplex<f64>>
    %23 = "func.constant"() <{value = @abs}> : () -> ((complex<f64>) -> f64)
    "func.call"(%22, %23) <{callee = @test_element_f64}> : (tensor<?xcomplex<f64>>, (complex<f64>) -> f64) -> ()
    %24 = "arith.constant"() <{value = dense<[(1.000000e+00,2.000000e+00), (5.000000e+02,0.000000e+00), (90.0238113,5.9006128E-39)]> : tensor<3xcomplex<f32>>}> : () -> tensor<3xcomplex<f32>>
    %25 = "tensor.cast"(%24) : (tensor<3xcomplex<f32>>) -> tensor<?xcomplex<f32>>
    %26 = "func.constant"() <{value = @exp}> : () -> ((complex<f32>) -> complex<f32>)
    "func.call"(%25, %26) <{callee = @test_unary}> : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

