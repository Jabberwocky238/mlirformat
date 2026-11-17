"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32, f32, i32, !spirv.array<3 x f32>) -> vector<3xf32>, sym_name = "rewrite"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":4:10), %arg1: f32 loc("<stdin>":4:22), %arg2: f32 loc("<stdin>":4:34), %arg3: i32 loc("<stdin>":4:46), %arg4: !spirv.array<3 x f32> loc("<stdin>":4:58)):
      %0 = "spirv.Undef"() : () -> vector<3xf32> loc("<stdin>":5:12)
      %1 = "spirv.CompositeInsert"(%arg0, %0) <{indices = [0 : i32]}> : (f32, vector<3xf32>) -> vector<3xf32> loc("<stdin>":6:12)
      %2 = "spirv.CompositeInsert"(%arg1, %1) <{indices = [1 : i32]}> : (f32, vector<3xf32>) -> vector<3xf32> loc("<stdin>":7:12)
      %3 = "spirv.CompositeInsert"(%arg2, %2) <{indices = [2 : i32]}> : (f32, vector<3xf32>) -> vector<3xf32> loc("<stdin>":8:12)
      %4 = "spirv.Undef"() : () -> !spirv.array<4 x f32> loc("<stdin>":9:12)
      %5 = "spirv.CompositeInsert"(%arg0, %4) <{indices = [0 : i32]}> : (f32, !spirv.array<4 x f32>) -> !spirv.array<4 x f32> loc("<stdin>":10:12)
      %6 = "spirv.CompositeInsert"(%arg1, %5) <{indices = [1 : i32]}> : (f32, !spirv.array<4 x f32>) -> !spirv.array<4 x f32> loc("<stdin>":11:12)
      %7 = "spirv.CompositeInsert"(%arg2, %6) <{indices = [2 : i32]}> : (f32, !spirv.array<4 x f32>) -> !spirv.array<4 x f32> loc("<stdin>":12:12)
      %8 = "spirv.CompositeInsert"(%arg0, %7) <{indices = [3 : i32]}> : (f32, !spirv.array<4 x f32>) -> !spirv.array<4 x f32> loc("<stdin>":13:12)
      %9 = "spirv.Undef"() : () -> !spirv.struct<(f32, i32, f32)> loc("<stdin>":14:12)
      %10 = "spirv.CompositeInsert"(%arg0, %9) <{indices = [0 : i32]}> : (f32, !spirv.struct<(f32, i32, f32)>) -> !spirv.struct<(f32, i32, f32)> loc("<stdin>":15:13)
      %11 = "spirv.CompositeInsert"(%arg3, %10) <{indices = [1 : i32]}> : (i32, !spirv.struct<(f32, i32, f32)>) -> !spirv.struct<(f32, i32, f32)> loc("<stdin>":16:13)
      %12 = "spirv.CompositeInsert"(%arg1, %11) <{indices = [2 : i32]}> : (f32, !spirv.struct<(f32, i32, f32)>) -> !spirv.struct<(f32, i32, f32)> loc("<stdin>":17:13)
      %13 = "spirv.Undef"() : () -> !spirv.struct<(f32, !spirv.array<3 x f32>)> loc("<stdin>":18:13)
      %14 = "spirv.CompositeInsert"(%arg0, %13) <{indices = [0 : i32]}> : (f32, !spirv.struct<(f32, !spirv.array<3 x f32>)>) -> !spirv.struct<(f32, !spirv.array<3 x f32>)> loc("<stdin>":19:13)
      %15 = "spirv.CompositeInsert"(%arg4, %14) <{indices = [1 : i32]}> : (!spirv.array<3 x f32>, !spirv.struct<(f32, !spirv.array<3 x f32>)>) -> !spirv.struct<(f32, !spirv.array<3 x f32>)> loc("<stdin>":20:13)
      "spirv.ReturnValue"(%3) : (vector<3xf32>) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
