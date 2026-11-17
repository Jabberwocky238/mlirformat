"builtin.module"() ({
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.array<4 x !spirv.array<4 x f32>>) -> (), sym_name = "composite_extract_array"}> ({
  ^bb0(%arg17: !spirv.array<4 x !spirv.array<4 x f32>> loc("<stdin>":3:8)):
    %10 = "spirv.CompositeExtract"(%arg17) <{indices = [1 : i32, 3 : i32]}> : (!spirv.array<4 x !spirv.array<4 x f32>>) -> f32 loc("<stdin>":4:11)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>) -> (), sym_name = "composite_extract_vector"}> ({
  ^bb0(%arg16: vector<3xf32> loc("<stdin>":8:8)):
    %9 = "spirv.CompositeExtract"(%arg16) <{indices = [0 : i32]}> : (vector<3xf32>) -> f32 loc("<stdin>":9:10)
    "spirv.Return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, !spirv.struct<(f32, !spirv.array<4 x i32>)>) -> (), sym_name = "composite_insert_struct"}> ({
  ^bb0(%arg14: i32 loc("<stdin>":13:8), %arg15: !spirv.struct<(f32, !spirv.array<4 x i32>)> loc("<stdin>":13:21)):
    %8 = "spirv.CompositeInsert"(%arg14, %arg15) <{indices = [1 : i32, 3 : i32]}> : (i32, !spirv.struct<(f32, !spirv.array<4 x i32>)>) -> !spirv.struct<(f32, !spirv.array<4 x i32>)> loc("<stdin>":14:10)
    "spirv.Return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>, f32) -> (), sym_name = "composite_insert_vector"}> ({
  ^bb0(%arg12: vector<3xf32> loc("<stdin>":18:8), %arg13: f32 loc("<stdin>":18:31)):
    %7 = "spirv.CompositeInsert"(%arg13, %arg12) <{indices = [1 : i32]}> : (f32, vector<3xf32>) -> vector<3xf32> loc("<stdin>":19:10)
    "spirv.Return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i1, vector<3xi32>, vector<3xi32>, f32, f32) -> (), sym_name = "select_scalar"}> ({
  ^bb0(%arg7: i1 loc("<stdin>":23:8), %arg8: vector<3xi32> loc("<stdin>":23:19), %arg9: vector<3xi32> loc("<stdin>":23:41), %arg10: f32 loc("<stdin>":23:63), %arg11: f32 loc("<stdin>":23:76)):
    %5 = "spirv.Select"(%arg7, %arg8, %arg9) : (i1, vector<3xi32>, vector<3xi32>) -> vector<3xi32> loc("<stdin>":24:10)
    %6 = "spirv.Select"(%arg7, %arg10, %arg11) : (i1, f32, f32) -> f32 loc("<stdin>":25:10)
    "spirv.Return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":22:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xi1>, vector<2xi32>, vector<2xi32>) -> (), sym_name = "select_vector"}> ({
  ^bb0(%arg4: vector<2xi1> loc("<stdin>":29:8), %arg5: vector<2xi32> loc("<stdin>":29:29), %arg6: vector<2xi32> loc("<stdin>":29:51)):
    %4 = "spirv.Select"(%arg4, %arg5, %arg6) : (vector<2xi1>, vector<2xi32>, vector<2xi32>) -> vector<2xi32> loc("<stdin>":30:10)
    "spirv.Return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":28:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<2xf32>, vector<2xf32>) -> vector<3xf32>, sym_name = "vector_shuffle_same_size"}> ({
  ^bb0(%arg2: vector<2xf32> loc("<stdin>":34:8), %arg3: vector<2xf32> loc("<stdin>":34:30)):
    %3 = "spirv.VectorShuffle"(%arg2, %arg3) <{components = [0 : i32, 2 : i32, -1 : i32]}> : (vector<2xf32>, vector<2xf32>) -> vector<3xf32> loc("<stdin>":35:10)
    "spirv.ReturnValue"(%3) : (vector<3xf32>) -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":33:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<3xf32>, vector<2xf32>) -> vector<3xf32>, sym_name = "vector_shuffle_different_size"}> ({
  ^bb0(%arg0: vector<3xf32> loc("<stdin>":39:8), %arg1: vector<2xf32> loc("<stdin>":39:30)):
    %2 = "spirv.VectorShuffle"(%arg0, %arg1) <{components = [0 : i32, 4 : i32, -1 : i32]}> : (vector<3xf32>, vector<2xf32>) -> vector<3xf32> loc("<stdin>":40:10)
    "spirv.ReturnValue"(%2) : (vector<3xf32>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":38:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "empty"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":44:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<Kernel>, fn = @empty, interface = []}> : () -> () loc("<stdin>":47:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<ContractionOff>, fn = @empty, values = []}> : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":43:3)
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "bar"}> ({
      "spirv.Return"() : () -> () loc("<stdin>":52:7)
    }) : () -> () loc("<stdin>":51:5)
    "spirv.EntryPoint"() <{execution_model = #spirv.execution_model<Kernel>, fn = @bar, interface = []}> : () -> () loc("<stdin>":54:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<ContractionOff>, fn = @bar, values = []}> : () -> () loc("<stdin>":55:5)
    "spirv.ExecutionMode"() <{execution_mode = #spirv.execution_mode<LocalSizeHint>, fn = @bar, values = [32 : i32, 1 : i32, 1 : i32]}> : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":50:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "undef_scalar"}> ({
    %1 = "spirv.Undef"() : () -> f32 loc("<stdin>":59:10)
    "spirv.Return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":58:3)
  "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = () -> (), sym_name = "undef_vector"}> ({
    %0 = "spirv.Undef"() : () -> vector<2xi32> loc("<stdin>":63:10)
    "spirv.Return"() : () -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":62:3)
}) : () -> () loc("<stdin>":1:1)
