module {
  func.func @test_unary(%arg0: tensor<?xcomplex<f32>>, %arg1: (complex<f32>) -> complex<f32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f32>>
    scf.for %arg2 = %c0 to %dim step %c1 {
      %extracted = tensor.extract %arg0[%arg2] : tensor<?xcomplex<f32>>
      %0 = func.call_indirect %arg1(%extracted) : (complex<f32>) -> complex<f32>
      %1 = complex.re %0 : complex<f32>
      %2 = complex.im %0 : complex<f32>
      vector.print %1 : f32
      vector.print %2 : f32
    }
    return
  }
  func.func @sqrt(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.sqrt %arg0 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @tanh(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.tanh %arg0 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @rsqrt(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.rsqrt %arg0 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @conj(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.conj %arg0 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @exp(%arg0: complex<f32>) -> complex<f32> {
    %0 = complex.exp %arg0 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @test_binary(%arg0: tensor<?xcomplex<f32>>, %arg1: (complex<f32>, complex<f32>) -> complex<f32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f32>>
    scf.for %arg2 = %c0 to %dim step %c2 {
      %extracted = tensor.extract %arg0[%arg2] : tensor<?xcomplex<f32>>
      %0 = arith.addi %arg2, %c1 : index
      %extracted_0 = tensor.extract %arg0[%0] : tensor<?xcomplex<f32>>
      %1 = func.call_indirect %arg1(%extracted, %extracted_0) : (complex<f32>, complex<f32>) -> complex<f32>
      %2 = complex.re %1 : complex<f32>
      %3 = complex.im %1 : complex<f32>
      vector.print %2 : f32
      vector.print %3 : f32
    }
    return
  }
  func.func @atan2(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.atan2 %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @pow(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.pow %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @test_element(%arg0: tensor<?xcomplex<f32>>, %arg1: (complex<f32>) -> f32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f32>>
    scf.for %arg2 = %c0 to %dim step %c1 {
      %extracted = tensor.extract %arg0[%arg2] : tensor<?xcomplex<f32>>
      %0 = func.call_indirect %arg1(%extracted) : (complex<f32>) -> f32
      vector.print %0 : f32
    }
    return
  }
  func.func @angle(%arg0: complex<f32>) -> f32 {
    %0 = complex.angle %arg0 : complex<f32>
    return %0 : f32
  }
  func.func @test_element_f64(%arg0: tensor<?xcomplex<f64>>, %arg1: (complex<f64>) -> f64) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xcomplex<f64>>
    scf.for %arg2 = %c0 to %dim step %c1 {
      %extracted = tensor.extract %arg0[%arg2] : tensor<?xcomplex<f64>>
      %0 = func.call_indirect %arg1(%extracted) : (complex<f64>) -> f64
      vector.print %0 : f64
    }
    return
  }
  func.func @abs(%arg0: complex<f64>) -> f64 {
    %0 = complex.abs %arg0 : complex<f64>
    return %0 : f64
  }
  func.func @entry() {
    %cst = arith.constant dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>
    %cast = tensor.cast %cst : tensor<7xcomplex<f32>> to tensor<?xcomplex<f32>>
    %f = constant @sqrt : (complex<f32>) -> complex<f32>
    call @test_unary(%cast, %f) : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    %cst_0 = arith.constant dense<[(1.000000e+00,2.000000e+00), (2.000000e+00,1.000000e+00), (1.000000e+00,1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<6xcomplex<f32>>
    %cast_1 = tensor.cast %cst_0 : tensor<6xcomplex<f32>> to tensor<?xcomplex<f32>>
    %f_2 = constant @atan2 : (complex<f32>, complex<f32>) -> complex<f32>
    call @test_binary(%cast_1, %f_2) : (tensor<?xcomplex<f32>>, (complex<f32>, complex<f32>) -> complex<f32>) -> ()
    %cst_3 = arith.constant dense<[(0.000000e+00,0.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,0.000000e+00), (1.000000e+00,0.000000e+00), (0.000000e+00,0.000000e+00), (-1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<8xcomplex<f32>>
    %cast_4 = tensor.cast %cst_3 : tensor<8xcomplex<f32>> to tensor<?xcomplex<f32>>
    %f_5 = constant @pow : (complex<f32>, complex<f32>) -> complex<f32>
    call @test_binary(%cast_4, %f_5) : (tensor<?xcomplex<f32>>, (complex<f32>, complex<f32>) -> complex<f32>) -> ()
    %cst_6 = arith.constant dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>
    %cast_7 = tensor.cast %cst_6 : tensor<7xcomplex<f32>> to tensor<?xcomplex<f32>>
    %f_8 = constant @tanh : (complex<f32>) -> complex<f32>
    call @test_unary(%cast_7, %f_8) : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    %cst_9 = arith.constant dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>
    %cast_10 = tensor.cast %cst_9 : tensor<7xcomplex<f32>> to tensor<?xcomplex<f32>>
    %f_11 = constant @rsqrt : (complex<f32>) -> complex<f32>
    call @test_unary(%cast_10, %f_11) : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    %cst_12 = arith.constant dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>
    %cast_13 = tensor.cast %cst_12 : tensor<7xcomplex<f32>> to tensor<?xcomplex<f32>>
    %f_14 = constant @conj : (complex<f32>) -> complex<f32>
    call @test_unary(%cast_13, %f_14) : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    %cst_15 = arith.constant dense<[(-1.000000e+00,-1.000000e+00), (-1.000000e+00,1.000000e+00), (0.000000e+00,0.000000e+00), (0.000000e+00,1.000000e+00), (1.000000e+00,-1.000000e+00), (1.000000e+00,0.000000e+00), (1.000000e+00,1.000000e+00)]> : tensor<7xcomplex<f32>>
    %cast_16 = tensor.cast %cst_15 : tensor<7xcomplex<f32>> to tensor<?xcomplex<f32>>
    %f_17 = constant @angle : (complex<f32>) -> f32
    call @test_element(%cast_16, %f_17) : (tensor<?xcomplex<f32>>, (complex<f32>) -> f32) -> ()
    %cst_18 = arith.constant dense<[(1.000000e+00,1.000000e+00), (1.000000e+300,1.000000e+300), (1.000000e-300,1.000000e-300), (5.000000e+00,0.000000e+00), (0.000000e+00,6.000000e+00), (7.000000e+00,8.000000e+00), (-1.000000e+00,-1.000000e+00), (-1.000000e+300,-1.000000e+300), (-1.000000e+00,0.000000e+00), (0.000000e+00,-1.000000e+00)]> : tensor<10xcomplex<f64>>
    %cast_19 = tensor.cast %cst_18 : tensor<10xcomplex<f64>> to tensor<?xcomplex<f64>>
    %f_20 = constant @abs : (complex<f64>) -> f64
    call @test_element_f64(%cast_19, %f_20) : (tensor<?xcomplex<f64>>, (complex<f64>) -> f64) -> ()
    %cst_21 = arith.constant dense<[(1.000000e+00,2.000000e+00), (5.000000e+02,0.000000e+00), (90.0238113,5.9006128E-39)]> : tensor<3xcomplex<f32>>
    %cast_22 = tensor.cast %cst_21 : tensor<3xcomplex<f32>> to tensor<?xcomplex<f32>>
    %f_23 = constant @exp : (complex<f32>) -> complex<f32>
    call @test_unary(%cast_22, %f_23) : (tensor<?xcomplex<f32>>, (complex<f32>) -> complex<f32>) -> ()
    return
  }
}

