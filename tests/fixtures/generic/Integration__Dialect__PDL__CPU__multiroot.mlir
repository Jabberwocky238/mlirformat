"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl.pattern"() <{benefit = 1 : i16}> ({
      %52 = "pdl.type"() : () -> !pdl.type
      %53 = "pdl.type"() : () -> !pdl.type
      %54 = "pdl.type"() : () -> !pdl.type
      %55 = "pdl.operand"(%52) : (!pdl.type) -> !pdl.value
      %56 = "pdl.operand"(%54) : (!pdl.type) -> !pdl.value
      %57 = "pdl.attribute"() <{value = false}> : () -> !pdl.attribute
      %58 = "pdl.operation"(%55, %56, %57, %57, %53) <{attributeValueNames = ["transpose_a", "transpose_b"], opName = "tf.MatMul", operandSegmentSizes = array<i32: 2, 2, 1>}> : (!pdl.value, !pdl.value, !pdl.attribute, !pdl.attribute, !pdl.type) -> !pdl.operation
      "pdl.rewrite"(%58) <{operandSegmentSizes = array<i32: 1, 0>}> ({
        %59 = "pdl.operation"(%55, %56, %53) <{attributeValueNames = [], opName = "kernel.FcFwd", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
        %60 = "pdl.result"(%59) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        "pdl.replace"(%58, %60) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
      }) : (!pdl.operation) -> ()
    }) : () -> ()
    "pdl.pattern"() <{benefit = 4 : i16}> ({
      %34 = "pdl.type"() : () -> !pdl.type
      %35 = "pdl.type"() : () -> !pdl.type
      %36 = "pdl.type"() : () -> !pdl.type
      %37 = "pdl.type"() : () -> !pdl.type
      %38 = "pdl.operand"(%34) : (!pdl.type) -> !pdl.value
      %39 = "pdl.operand"(%35) : (!pdl.type) -> !pdl.value
      %40 = "pdl.operand"(%36) : (!pdl.type) -> !pdl.value
      %41 = "pdl.attribute"() <{value = true}> : () -> !pdl.attribute
      %42 = "pdl.attribute"() <{value = false}> : () -> !pdl.attribute
      %43 = "pdl.operation"(%38, %39, %41, %42, %36) <{attributeValueNames = ["transpose_a", "transpose_b"], opName = "tf.MatMul", operandSegmentSizes = array<i32: 2, 2, 1>}> : (!pdl.value, !pdl.value, !pdl.attribute, !pdl.attribute, !pdl.type) -> !pdl.operation
      %44 = "pdl.result"(%43) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %45 = "pdl.operation"(%37) <{attributeValueNames = [], opName = "tf.Const", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.type) -> !pdl.operation
      %46 = "pdl.result"(%45) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %47 = "pdl.operation"(%44, %46, %36) <{attributeValueNames = [], opName = "tf.Mul", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      %48 = "pdl.result"(%47) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %49 = "pdl.operation"(%40, %48, %36) <{attributeValueNames = [], opName = "tf.Sub", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      "pdl.rewrite"(%49) <{operandSegmentSizes = array<i32: 1, 0>}> ({
        %50 = "pdl.operation"(%38, %39, %40, %36) <{attributeValueNames = [], opName = "kernel.FcBwd", operandSegmentSizes = array<i32: 3, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
        %51 = "pdl.result"(%50) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        "pdl.replace"(%49, %51) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%47) : (!pdl.operation) -> ()
        "pdl.erase"(%45) : (!pdl.operation) -> ()
        "pdl.erase"(%43) : (!pdl.operation) -> ()
      }) : (!pdl.operation) -> ()
    }) : () -> ()
    "pdl.pattern"() <{benefit = 6 : i16}> ({
      %11 = "pdl.type"() : () -> !pdl.type
      %12 = "pdl.type"() : () -> !pdl.type
      %13 = "pdl.type"() : () -> !pdl.type
      %14 = "pdl.type"() : () -> !pdl.type
      %15 = "pdl.type"() : () -> !pdl.type
      %16 = "pdl.type"() : () -> !pdl.type
      %17 = "pdl.operand"(%11) : (!pdl.type) -> !pdl.value
      %18 = "pdl.operand"(%12) : (!pdl.type) -> !pdl.value
      %19 = "pdl.operation"(%17, %18, %13, %11) <{attributeValueNames = [], opName = "tf.SparseSoftmaxCrossEntropyWithLogits", operandSegmentSizes = array<i32: 2, 0, 2>}> : (!pdl.value, !pdl.value, !pdl.type, !pdl.type) -> !pdl.operation
      %20 = "pdl.result"(%19) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %21 = "pdl.result"(%19) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.value
      %22 = "pdl.operation"(%15) <{attributeValueNames = [], opName = "tf.Const", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.type) -> !pdl.operation
      %23 = "pdl.result"(%22) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %24 = "pdl.operation"(%20, %23, %14) <{attributeValueNames = [], opName = "tf.Mean", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      %25 = "pdl.result"(%24) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %26 = "pdl.operation"(%21, %11) <{attributeValueNames = [], opName = "tf.PreventGradient", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.value, !pdl.type) -> !pdl.operation
      %27 = "pdl.result"(%26) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %28 = "pdl.operation"(%16) <{attributeValueNames = [], opName = "tf.Const", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.type) -> !pdl.operation
      %29 = "pdl.result"(%28) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %30 = "pdl.operation"(%27, %29, %11) <{attributeValueNames = [], opName = "tf.Mul", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      "pdl.rewrite"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
        %31 = "pdl.operation"(%17, %18, %14, %11) <{attributeValueNames = [], opName = "kernel.SoftmaxCrossEntropy", operandSegmentSizes = array<i32: 2, 0, 2>}> : (!pdl.value, !pdl.value, !pdl.type, !pdl.type) -> !pdl.operation
        %32 = "pdl.result"(%31) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        %33 = "pdl.result"(%31) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.value
        "pdl.replace"(%30, %33) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%28) : (!pdl.operation) -> ()
        "pdl.erase"(%26) : (!pdl.operation) -> ()
        "pdl.replace"(%24, %32) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%22) : (!pdl.operation) -> ()
        "pdl.erase"(%19) : (!pdl.operation) -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "func.func"() <{function_type = (tensor<2x20xf32>, tensor<2xi32>, tensor<20x10xf32>) -> (tensor<f32>, tensor<20x10xf32>), sym_name = "main"}> ({
    ^bb0(%arg0: tensor<2x20xf32>, %arg1: tensor<2xi32>, %arg2: tensor<20x10xf32>):
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
      "func.return"(%5, %10) : (tensor<f32>, tensor<20x10xf32>) -> ()
    }) : () -> ()
  }) {test.mlp_split} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "builtin.module"() <{sym_name = "patterns"}> ({
    "pdl.pattern"() <{benefit = 3 : i16}> ({
      %90 = "pdl.type"() : () -> !pdl.type
      %91 = "pdl.type"() : () -> !pdl.type
      %92 = "pdl.operand"(%91) : (!pdl.type) -> !pdl.value
      %93 = "pdl.operand"(%91) : (!pdl.type) -> !pdl.value
      %94 = "pdl.attribute"() : () -> !pdl.attribute
      %95 = "pdl.operation"(%94, %90) <{attributeValueNames = ["value"], opName = "tf.Const", operandSegmentSizes = array<i32: 0, 1, 1>}> : (!pdl.attribute, !pdl.type) -> !pdl.operation
      %96 = "pdl.result"(%95) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %97 = "pdl.operation"(%93, %96, %91) <{attributeValueNames = [], opName = "tf.Mul", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      %98 = "pdl.result"(%97) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %99 = "pdl.operation"(%92, %98, %91) <{attributeValueNames = [], opName = "tf.Sub", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      "pdl.rewrite"(%99) <{operandSegmentSizes = array<i32: 1, 0>}> ({
        %100 = "pdl.operation"(%92, %93, %91) <{attributeValueNames = [], opName = "kernel.GD", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
        %101 = "pdl.result"(%100) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        "pdl.replace"(%99, %101) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%97) : (!pdl.operation) -> ()
      }) : (!pdl.operation) -> ()
    }) : () -> ()
    "pdl.pattern"() <{benefit = 8 : i16}> ({
      %62 = "pdl.type"() : () -> !pdl.type
      %63 = "pdl.type"() : () -> !pdl.type
      %64 = "pdl.type"() : () -> !pdl.type
      %65 = "pdl.type"() : () -> !pdl.type
      %66 = "pdl.operand"(%62) : (!pdl.type) -> !pdl.value
      %67 = "pdl.operand"(%63) : (!pdl.type) -> !pdl.value
      %68 = "pdl.operand"(%64) : (!pdl.type) -> !pdl.value
      %69 = "pdl.operand"(%65) : (!pdl.type) -> !pdl.value
      %70 = "pdl.attribute"() <{value = false}> : () -> !pdl.attribute
      %71 = "pdl.operation"(%66, %68, %70, %70, %63) <{attributeValueNames = ["transpose_a", "transpose_b"], opName = "tf.MatMul", operandSegmentSizes = array<i32: 2, 2, 1>}> : (!pdl.value, !pdl.value, !pdl.attribute, !pdl.attribute, !pdl.type) -> !pdl.operation
      %72 = "pdl.result"(%71) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %73 = "pdl.operation"(%72, %69, %63) <{attributeValueNames = [], opName = "tf.BiasAdd", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      %74 = "pdl.result"(%73) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %75 = "pdl.operation"(%74, %63) <{attributeValueNames = [], opName = "tf.Relu", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.value, !pdl.type) -> !pdl.operation
      %76 = "pdl.result"(%75) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %77 = "pdl.operation"(%67, %76, %63) <{attributeValueNames = [], opName = "tf.ReluGrad", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      %78 = "pdl.result"(%77) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %79 = "pdl.attribute"() <{value = true}> : () -> !pdl.attribute
      %80 = "pdl.operation"(%66, %78, %79, %70, %64) <{attributeValueNames = ["transpose_a", "transpose_b"], opName = "tf.MatMul", operandSegmentSizes = array<i32: 2, 2, 1>}> : (!pdl.value, !pdl.value, !pdl.attribute, !pdl.attribute, !pdl.type) -> !pdl.operation
      %81 = "pdl.result"(%80) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %82 = "pdl.operation"(%68, %81, %64) <{attributeValueNames = [], opName = "kernel.GD", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      %83 = "pdl.operation"(%78, %65) <{attributeValueNames = [], opName = "tf.BiasAddGrad", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.value, !pdl.type) -> !pdl.operation
      %84 = "pdl.result"(%83) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %85 = "pdl.operation"(%69, %84, %65) <{attributeValueNames = [], opName = "kernel.GD", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      "pdl.rewrite"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
        %86 = "pdl.operation"(%66, %67, %68, %69, %63, %64, %65) <{attributeValueNames = [], opName = "kernel.FcWithBias", operandSegmentSizes = array<i32: 4, 0, 3>}> : (!pdl.value, !pdl.value, !pdl.value, !pdl.value, !pdl.type, !pdl.type, !pdl.type) -> !pdl.operation
        %87 = "pdl.result"(%86) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        %88 = "pdl.result"(%86) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.value
        %89 = "pdl.result"(%86) <{index = 2 : i32}> : (!pdl.operation) -> !pdl.value
        "pdl.replace"(%85, %89) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%83) : (!pdl.operation) -> ()
        "pdl.replace"(%82, %88) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%80) : (!pdl.operation) -> ()
        "pdl.erase"(%77) : (!pdl.operation) -> ()
        "pdl.replace"(%75, %87) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%73) : (!pdl.operation) -> ()
        "pdl.erase"(%71) : (!pdl.operation) -> ()
      }) : () -> ()
    }) : () -> ()
    "pdl.pattern"() <{benefit = 4 : i16}> ({
      %45 = "pdl.type"() : () -> !pdl.type
      %46 = "pdl.type"() : () -> !pdl.type
      %47 = "pdl.type"() : () -> !pdl.type
      %48 = "pdl.operand"(%45) : (!pdl.type) -> !pdl.value
      %49 = "pdl.operand"(%46) : (!pdl.type) -> !pdl.value
      %50 = "pdl.operand"(%47) : (!pdl.type) -> !pdl.value
      %51 = "pdl.attribute"() <{value = false}> : () -> !pdl.attribute
      %52 = "pdl.operation"(%48, %50, %51, %51, %46) <{attributeValueNames = ["transpose_a", "transpose_b"], opName = "tf.MatMul", operandSegmentSizes = array<i32: 2, 2, 1>}> : (!pdl.value, !pdl.value, !pdl.attribute, !pdl.attribute, !pdl.type) -> !pdl.operation
      %53 = "pdl.attribute"() <{value = true}> : () -> !pdl.attribute
      %54 = "pdl.operation"(%49, %50, %51, %53, %45) <{attributeValueNames = ["transpose_a", "transpose_b"], opName = "tf.MatMul", operandSegmentSizes = array<i32: 2, 2, 1>}> : (!pdl.value, !pdl.value, !pdl.attribute, !pdl.attribute, !pdl.type) -> !pdl.operation
      %55 = "pdl.operation"(%48, %49, %53, %51, %47) <{attributeValueNames = ["transpose_a", "transpose_b"], opName = "tf.MatMul", operandSegmentSizes = array<i32: 2, 2, 1>}> : (!pdl.value, !pdl.value, !pdl.attribute, !pdl.attribute, !pdl.type) -> !pdl.operation
      %56 = "pdl.result"(%55) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %57 = "pdl.operation"(%50, %56, %47) <{attributeValueNames = [], opName = "kernel.GD", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      "pdl.rewrite"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
        %58 = "pdl.operation"(%48, %49, %50, %46, %45, %47) <{attributeValueNames = [], opName = "kernel.Fc", operandSegmentSizes = array<i32: 3, 0, 3>}> : (!pdl.value, !pdl.value, !pdl.value, !pdl.type, !pdl.type, !pdl.type) -> !pdl.operation
        %59 = "pdl.result"(%58) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        %60 = "pdl.result"(%58) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.value
        %61 = "pdl.result"(%58) <{index = 2 : i32}> : (!pdl.operation) -> !pdl.value
        "pdl.replace"(%57, %61) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%55) : (!pdl.operation) -> ()
        "pdl.replace"(%54, %60) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.replace"(%52, %59) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
      }) : () -> ()
    }) : () -> ()
    "pdl.pattern"() <{benefit = 6 : i16}> ({
      %22 = "pdl.type"() : () -> !pdl.type
      %23 = "pdl.type"() : () -> !pdl.type
      %24 = "pdl.type"() : () -> !pdl.type
      %25 = "pdl.type"() : () -> !pdl.type
      %26 = "pdl.type"() : () -> !pdl.type
      %27 = "pdl.type"() : () -> !pdl.type
      %28 = "pdl.operand"(%22) : (!pdl.type) -> !pdl.value
      %29 = "pdl.operand"(%23) : (!pdl.type) -> !pdl.value
      %30 = "pdl.operation"(%28, %29, %24, %22) <{attributeValueNames = [], opName = "tf.SparseSoftmaxCrossEntropyWithLogits", operandSegmentSizes = array<i32: 2, 0, 2>}> : (!pdl.value, !pdl.value, !pdl.type, !pdl.type) -> !pdl.operation
      %31 = "pdl.result"(%30) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %32 = "pdl.result"(%30) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.value
      %33 = "pdl.operation"(%26) <{attributeValueNames = [], opName = "tf.Const", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.type) -> !pdl.operation
      %34 = "pdl.result"(%33) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %35 = "pdl.operation"(%31, %34, %25) <{attributeValueNames = [], opName = "tf.Mean", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      %36 = "pdl.result"(%35) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %37 = "pdl.operation"(%32, %22) <{attributeValueNames = [], opName = "tf.PreventGradient", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.value, !pdl.type) -> !pdl.operation
      %38 = "pdl.result"(%37) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %39 = "pdl.operation"(%27) <{attributeValueNames = [], opName = "tf.Const", operandSegmentSizes = array<i32: 0, 0, 1>}> : (!pdl.type) -> !pdl.operation
      %40 = "pdl.result"(%39) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      %41 = "pdl.operation"(%38, %40, %22) <{attributeValueNames = [], opName = "tf.Mul", operandSegmentSizes = array<i32: 2, 0, 1>}> : (!pdl.value, !pdl.value, !pdl.type) -> !pdl.operation
      "pdl.rewrite"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
        %42 = "pdl.operation"(%28, %29, %25, %22) <{attributeValueNames = [], opName = "kernel.SoftmaxCrossEntropy", operandSegmentSizes = array<i32: 2, 0, 2>}> : (!pdl.value, !pdl.value, !pdl.type, !pdl.type) -> !pdl.operation
        %43 = "pdl.result"(%42) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
        %44 = "pdl.result"(%42) <{index = 1 : i32}> : (!pdl.operation) -> !pdl.value
        "pdl.replace"(%41, %44) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%39) : (!pdl.operation) -> ()
        "pdl.erase"(%37) : (!pdl.operation) -> ()
        "pdl.replace"(%35, %43) <{operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.operation, !pdl.value) -> ()
        "pdl.erase"(%33) : (!pdl.operation) -> ()
        "pdl.erase"(%30) : (!pdl.operation) -> ()
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
  "builtin.module"() <{sym_name = "ir"}> ({
    "func.func"() <{function_type = (tensor<2x20xf32>, tensor<2xi32>, tensor<256xf32>, tensor<20x256xf32>, tensor<256x10xf32>) -> (), sym_name = "main"}> ({
    ^bb0(%arg0: tensor<2x20xf32>, %arg1: tensor<2xi32>, %arg2: tensor<256xf32>, %arg3: tensor<20x256xf32>, %arg4: tensor<256x10xf32>):
      "test.graph_region"() ({
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
      }) : () -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) {test.mlp_fused} : () -> ()
}) : () -> ()

