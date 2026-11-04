module {
}

// -----
module {
  module @patterns {
    pdl.pattern : benefit(1) {
      %0 = type
      %1 = type
      %2 = type
      %3 = operand : %0
      %4 = operand : %2
      %5 = attribute = false
      %6 = operation "tf.MatMul"(%3, %4 : !pdl.value, !pdl.value)  {"transpose_a" = %5, "transpose_b" = %5} -> (%1 : !pdl.type)
      rewrite %6 {
        %7 = operation "kernel.FcFwd"(%3, %4 : !pdl.value, !pdl.value)  -> (%1 : !pdl.type)
        %8 = result 0 of %7
        replace %6 with(%8 : !pdl.value)
      }
    }
    pdl.pattern : benefit(4) {
      %0 = type
      %1 = type
      %2 = type
      %3 = type
      %4 = operand : %0
      %5 = operand : %1
      %6 = operand : %2
      %7 = attribute = true
      %8 = attribute = false
      %9 = operation "tf.MatMul"(%4, %5 : !pdl.value, !pdl.value)  {"transpose_a" = %7, "transpose_b" = %8} -> (%2 : !pdl.type)
      %10 = result 0 of %9
      %11 = operation "tf.Const"  -> (%3 : !pdl.type)
      %12 = result 0 of %11
      %13 = operation "tf.Mul"(%10, %12 : !pdl.value, !pdl.value)  -> (%2 : !pdl.type)
      %14 = result 0 of %13
      %15 = operation "tf.Sub"(%6, %14 : !pdl.value, !pdl.value)  -> (%2 : !pdl.type)
      rewrite %15 {
        %16 = operation "kernel.FcBwd"(%4, %5, %6 : !pdl.value, !pdl.value, !pdl.value)  -> (%2 : !pdl.type)
        %17 = result 0 of %16
        replace %15 with(%17 : !pdl.value)
        erase %13
        erase %11
        erase %9
      }
    }
    pdl.pattern : benefit(6) {
      %0 = type
      %1 = type
      %2 = type
      %3 = type
      %4 = type
      %5 = type
      %6 = operand : %0
      %7 = operand : %1
      %8 = operation "tf.SparseSoftmaxCrossEntropyWithLogits"(%6, %7 : !pdl.value, !pdl.value)  -> (%2, %0 : !pdl.type, !pdl.type)
      %9 = result 0 of %8
      %10 = result 1 of %8
      %11 = operation "tf.Const"  -> (%4 : !pdl.type)
      %12 = result 0 of %11
      %13 = operation "tf.Mean"(%9, %12 : !pdl.value, !pdl.value)  -> (%3 : !pdl.type)
      %14 = result 0 of %13
      %15 = operation "tf.PreventGradient"(%10 : !pdl.value)  -> (%0 : !pdl.type)
      %16 = result 0 of %15
      %17 = operation "tf.Const"  -> (%5 : !pdl.type)
      %18 = result 0 of %17
      %19 = operation "tf.Mul"(%16, %18 : !pdl.value, !pdl.value)  -> (%0 : !pdl.type)
      rewrite {
        %20 = operation "kernel.SoftmaxCrossEntropy"(%6, %7 : !pdl.value, !pdl.value)  -> (%3, %0 : !pdl.type, !pdl.type)
        %21 = result 0 of %20
        %22 = result 1 of %20
        replace %19 with(%22 : !pdl.value)
        erase %17
        erase %15
        replace %13 with(%21 : !pdl.value)
        erase %11
        erase %8
      }
    }
  }
  module @ir attributes {test.mlp_split} {
    func.func @main(%arg0: tensor<2x20xf32>, %arg1: tensor<2xi32>, %arg2: tensor<20x10xf32>) -> (tensor<f32>, tensor<20x10xf32>) {
      %0 = "tf.Const"() {value = dense<0> : tensor<1xi32>} : () -> tensor<1xi32>
      %1 = "tf.Const"() {value = dense<1.000000e-01> : tensor<f32>} : () -> tensor<f32>
      %2 = "tf.Const"() {value = dense<5.000000e-01> : tensor<2x1xf32>} : () -> tensor<2x1xf32>
      %3 = "tf.MatMul"(%arg0, %arg2) {transpose_a = false, transpose_b = false} : (tensor<2x20xf32>, tensor<20x10xf32>) -> tensor<2x10xf32>
      %4:2 = "tf.SparseSoftmaxCrossEntropyWithLogits"(%3, %arg1) : (tensor<2x10xf32>, tensor<2xi32>) -> (tensor<2xf32>, tensor<2x10xf32>)
      %5 = "tf.Mean"(%4#0, %0) {keep_dims = false} : (tensor<2xf32>, tensor<1xi32>) -> tensor<f32>
      %6 = "tf.PreventGradient"(%4#1) : (tensor<2x10xf32>) -> tensor<2x10xf32>
      %7 = "tf.Mul"(%6, %2) : (tensor<2x10xf32>, tensor<2x1xf32>) -> tensor<2x10xf32>
      %8 = "tf.MatMul"(%arg0, %7) {transpose_a = true, transpose_b = false} : (tensor<2x20xf32>, tensor<2x10xf32>) -> tensor<20x10xf32>
      %9 = "tf.Mul"(%8, %1) : (tensor<20x10xf32>, tensor<f32>) -> tensor<20x10xf32>
      %10 = "tf.Sub"(%arg2, %9) : (tensor<20x10xf32>, tensor<20x10xf32>) -> tensor<20x10xf32>
      return %5, %10 : tensor<f32>, tensor<20x10xf32>
    }
  }
}

// -----
module {
  module @patterns {
    pdl.pattern : benefit(3) {
      %0 = type
      %1 = type
      %2 = operand : %1
      %3 = operand : %1
      %4 = attribute
      %5 = operation "tf.Const"  {"value" = %4} -> (%0 : !pdl.type)
      %6 = result 0 of %5
      %7 = operation "tf.Mul"(%3, %6 : !pdl.value, !pdl.value)  -> (%1 : !pdl.type)
      %8 = result 0 of %7
      %9 = operation "tf.Sub"(%2, %8 : !pdl.value, !pdl.value)  -> (%1 : !pdl.type)
      rewrite %9 {
        %10 = operation "kernel.GD"(%2, %3 : !pdl.value, !pdl.value)  -> (%1 : !pdl.type)
        %11 = result 0 of %10
        replace %9 with(%11 : !pdl.value)
        erase %7
      }
    }
    pdl.pattern : benefit(8) {
      %0 = type
      %1 = type
      %2 = type
      %3 = type
      %4 = operand : %0
      %5 = operand : %1
      %6 = operand : %2
      %7 = operand : %3
      %8 = attribute = false
      %9 = operation "tf.MatMul"(%4, %6 : !pdl.value, !pdl.value)  {"transpose_a" = %8, "transpose_b" = %8} -> (%1 : !pdl.type)
      %10 = result 0 of %9
      %11 = operation "tf.BiasAdd"(%10, %7 : !pdl.value, !pdl.value)  -> (%1 : !pdl.type)
      %12 = result 0 of %11
      %13 = operation "tf.Relu"(%12 : !pdl.value)  -> (%1 : !pdl.type)
      %14 = result 0 of %13
      %15 = operation "tf.ReluGrad"(%5, %14 : !pdl.value, !pdl.value)  -> (%1 : !pdl.type)
      %16 = result 0 of %15
      %17 = attribute = true
      %18 = operation "tf.MatMul"(%4, %16 : !pdl.value, !pdl.value)  {"transpose_a" = %17, "transpose_b" = %8} -> (%2 : !pdl.type)
      %19 = result 0 of %18
      %20 = operation "kernel.GD"(%6, %19 : !pdl.value, !pdl.value)  -> (%2 : !pdl.type)
      %21 = operation "tf.BiasAddGrad"(%16 : !pdl.value)  -> (%3 : !pdl.type)
      %22 = result 0 of %21
      %23 = operation "kernel.GD"(%7, %22 : !pdl.value, !pdl.value)  -> (%3 : !pdl.type)
      rewrite {
        %24 = operation "kernel.FcWithBias"(%4, %5, %6, %7 : !pdl.value, !pdl.value, !pdl.value, !pdl.value)  -> (%1, %2, %3 : !pdl.type, !pdl.type, !pdl.type)
        %25 = result 0 of %24
        %26 = result 1 of %24
        %27 = result 2 of %24
        replace %23 with(%27 : !pdl.value)
        erase %21
        replace %20 with(%26 : !pdl.value)
        erase %18
        erase %15
        replace %13 with(%25 : !pdl.value)
        erase %11
        erase %9
      }
    }
    pdl.pattern : benefit(4) {
      %0 = type
      %1 = type
      %2 = type
      %3 = operand : %0
      %4 = operand : %1
      %5 = operand : %2
      %6 = attribute = false
      %7 = operation "tf.MatMul"(%3, %5 : !pdl.value, !pdl.value)  {"transpose_a" = %6, "transpose_b" = %6} -> (%1 : !pdl.type)
      %8 = attribute = true
      %9 = operation "tf.MatMul"(%4, %5 : !pdl.value, !pdl.value)  {"transpose_a" = %6, "transpose_b" = %8} -> (%0 : !pdl.type)
      %10 = operation "tf.MatMul"(%3, %4 : !pdl.value, !pdl.value)  {"transpose_a" = %8, "transpose_b" = %6} -> (%2 : !pdl.type)
      %11 = result 0 of %10
      %12 = operation "kernel.GD"(%5, %11 : !pdl.value, !pdl.value)  -> (%2 : !pdl.type)
      rewrite {
        %13 = operation "kernel.Fc"(%3, %4, %5 : !pdl.value, !pdl.value, !pdl.value)  -> (%1, %0, %2 : !pdl.type, !pdl.type, !pdl.type)
        %14 = result 0 of %13
        %15 = result 1 of %13
        %16 = result 2 of %13
        replace %12 with(%16 : !pdl.value)
        erase %10
        replace %9 with(%15 : !pdl.value)
        replace %7 with(%14 : !pdl.value)
      }
    }
    pdl.pattern : benefit(6) {
      %0 = type
      %1 = type
      %2 = type
      %3 = type
      %4 = type
      %5 = type
      %6 = operand : %0
      %7 = operand : %1
      %8 = operation "tf.SparseSoftmaxCrossEntropyWithLogits"(%6, %7 : !pdl.value, !pdl.value)  -> (%2, %0 : !pdl.type, !pdl.type)
      %9 = result 0 of %8
      %10 = result 1 of %8
      %11 = operation "tf.Const"  -> (%4 : !pdl.type)
      %12 = result 0 of %11
      %13 = operation "tf.Mean"(%9, %12 : !pdl.value, !pdl.value)  -> (%3 : !pdl.type)
      %14 = result 0 of %13
      %15 = operation "tf.PreventGradient"(%10 : !pdl.value)  -> (%0 : !pdl.type)
      %16 = result 0 of %15
      %17 = operation "tf.Const"  -> (%5 : !pdl.type)
      %18 = result 0 of %17
      %19 = operation "tf.Mul"(%16, %18 : !pdl.value, !pdl.value)  -> (%0 : !pdl.type)
      rewrite {
        %20 = operation "kernel.SoftmaxCrossEntropy"(%6, %7 : !pdl.value, !pdl.value)  -> (%3, %0 : !pdl.type, !pdl.type)
        %21 = result 0 of %20
        %22 = result 1 of %20
        replace %19 with(%22 : !pdl.value)
        erase %17
        erase %15
        replace %13 with(%21 : !pdl.value)
        erase %11
        erase %8
      }
    }
  }
  module @ir attributes {test.mlp_fused} {
    func.func @main(%arg0: tensor<2x20xf32>, %arg1: tensor<2xi32>, %arg2: tensor<256xf32>, %arg3: tensor<20x256xf32>, %arg4: tensor<256x10xf32>) {
      test.graph_region {
        %0 = "tf.Const"() {value = dense<0> : tensor<1xi32>} : () -> tensor<1xi32>
        %1 = "tf.Const"() {value = dense<1.000000e-01> : tensor<f32>} : () -> tensor<f32>
        %2 = "tf.Const"() {value = dense<5.000000e-01> : tensor<2x1xf32>} : () -> tensor<2x1xf32>
        %3 = "tf.MatMul"(%arg0, %arg3) {transpose_a = false, transpose_b = false} : (tensor<2x20xf32>, tensor<20x256xf32>) -> tensor<2x256xf32>
        %4 = "tf.BiasAdd"(%3, %arg2) {data_format = "NHWC"} : (tensor<2x256xf32>, tensor<256xf32>) -> tensor<2x256xf32>
        %5 = "tf.Relu"(%4) : (tensor<2x256xf32>) -> tensor<2x256xf32>
        %6 = "tf.MatMul"(%5, %arg4) {transpose_a = false, transpose_b = false} : (tensor<2x256xf32>, tensor<256x10xf32>) -> tensor<2x10xf32>
        %7:2 = "tf.SparseSoftmaxCrossEntropyWithLogits"(%6, %arg1) : (tensor<2x10xf32>, tensor<2xi32>) -> (tensor<2xf32>, tensor<2x10xf32>)
        %8 = "tf.Mean"(%7#0, %0) {keep_dims = false} : (tensor<2xf32>, tensor<1xi32>) -> tensor<f32>
        %9 = "tf.PreventGradient"(%7#1) : (tensor<2x10xf32>) -> tensor<2x10xf32>
        %10 = "tf.Mul"(%9, %2) : (tensor<2x10xf32>, tensor<2x1xf32>) -> tensor<2x10xf32>
        %11 = "tf.MatMul"(%10, %arg4) {transpose_a = false, transpose_b = true} : (tensor<2x10xf32>, tensor<256x10xf32>) -> tensor<2x256xf32>
        %12 = "tf.MatMul"(%5, %10) {transpose_a = true, transpose_b = false} : (tensor<2x256xf32>, tensor<2x10xf32>) -> tensor<256x10xf32>
        %13 = "tf.ReluGrad"(%11, %5) : (tensor<2x256xf32>, tensor<2x256xf32>) -> tensor<2x256xf32>
        %14 = "tf.BiasAddGrad"(%13) {data_format = "NHWC"} : (tensor<2x256xf32>) -> tensor<256xf32>
        %15 = "tf.MatMul"(%arg0, %13) {transpose_a = true, transpose_b = false} : (tensor<2x20xf32>, tensor<2x256xf32>) -> tensor<20x256xf32>
        %16 = "tf.Mul"(%15, %1) : (tensor<20x256xf32>, tensor<f32>) -> tensor<20x256xf32>
        %17 = "tf.Sub"(%arg3, %16) : (tensor<20x256xf32>, tensor<20x256xf32>) -> tensor<20x256xf32>
        %18 = "tf.Mul"(%14, %1) : (tensor<256xf32>, tensor<f32>) -> tensor<256xf32>
        %19 = "tf.Sub"(%arg2, %18) : (tensor<256xf32>, tensor<256xf32>) -> tensor<256xf32>
        %20 = "tf.Mul"(%12, %1) : (tensor<256x10xf32>, tensor<f32>) -> tensor<256x10xf32>
        %21 = "tf.Sub"(%arg4, %20) : (tensor<256x10xf32>, tensor<256x10xf32>) -> tensor<256x10xf32>
      }
      return
    }
  }
}

