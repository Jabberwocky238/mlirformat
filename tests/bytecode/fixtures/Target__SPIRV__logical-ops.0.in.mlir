"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<OpenCL>, vce_triple = #spirv.vce<v1.0, [Kernel, Linkage], []>}> ({
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi1>) -> (), sym_name = "any_vector"}> ({
    ^bb0(%arg23: vector<4xi1> loc("<stdin>":4:10)):
      %29 = "spirv.Any"(%arg23) : (vector<4xi1>) -> i1 loc("<stdin>":5:13)
      "spirv.Return"() : () -> () loc("<stdin>":6:7)
    }) : () -> () loc("<stdin>":3:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi1>) -> (), sym_name = "all_vector"}> ({
    ^bb0(%arg22: vector<4xi1> loc("<stdin>":9:10)):
      %28 = "spirv.All"(%arg22) : (vector<4xi1>) -> i1 loc("<stdin>":10:13)
      "spirv.Return"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (i32, i32) -> (), sym_name = "iequal_scalar"}> ({
    ^bb0(%arg20: i32 loc("<stdin>":14:10), %arg21: i32 loc("<stdin>":14:23)):
      %27 = "spirv.IEqual"(%arg20, %arg21) : (i32, i32) -> i1 loc("<stdin>":15:13)
      "spirv.Return"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":13:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "inotequal_vector"}> ({
    ^bb0(%arg18: vector<4xi32> loc("<stdin>":19:10), %arg19: vector<4xi32> loc("<stdin>":19:33)):
      %26 = "spirv.INotEqual"(%arg18, %arg19) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1> loc("<stdin>":20:13)
      "spirv.Return"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":18:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "sgt_vector"}> ({
    ^bb0(%arg16: vector<4xi32> loc("<stdin>":24:10), %arg17: vector<4xi32> loc("<stdin>":24:33)):
      %25 = "spirv.SGreaterThan"(%arg16, %arg17) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1> loc("<stdin>":25:13)
      "spirv.Return"() : () -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":23:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "sge_vector"}> ({
    ^bb0(%arg14: vector<4xi32> loc("<stdin>":29:10), %arg15: vector<4xi32> loc("<stdin>":29:33)):
      %24 = "spirv.SGreaterThanEqual"(%arg14, %arg15) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1> loc("<stdin>":30:13)
      "spirv.Return"() : () -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":28:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "slt_vector"}> ({
    ^bb0(%arg12: vector<4xi32> loc("<stdin>":34:10), %arg13: vector<4xi32> loc("<stdin>":34:33)):
      %23 = "spirv.SLessThan"(%arg12, %arg13) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1> loc("<stdin>":35:13)
      "spirv.Return"() : () -> () loc("<stdin>":36:7)
    }) : () -> () loc("<stdin>":33:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "slte_vector"}> ({
    ^bb0(%arg10: vector<4xi32> loc("<stdin>":39:10), %arg11: vector<4xi32> loc("<stdin>":39:33)):
      %22 = "spirv.SLessThanEqual"(%arg10, %arg11) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1> loc("<stdin>":40:13)
      "spirv.Return"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":38:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "ugt_vector"}> ({
    ^bb0(%arg8: vector<4xi32> loc("<stdin>":44:10), %arg9: vector<4xi32> loc("<stdin>":44:32)):
      %21 = "spirv.UGreaterThan"(%arg8, %arg9) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1> loc("<stdin>":45:13)
      "spirv.Return"() : () -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":43:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "ugte_vector"}> ({
    ^bb0(%arg6: vector<4xi32> loc("<stdin>":49:10), %arg7: vector<4xi32> loc("<stdin>":49:32)):
      %20 = "spirv.UGreaterThanEqual"(%arg6, %arg7) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1> loc("<stdin>":50:13)
      "spirv.Return"() : () -> () loc("<stdin>":51:7)
    }) : () -> () loc("<stdin>":48:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "ult_vector"}> ({
    ^bb0(%arg4: vector<4xi32> loc("<stdin>":54:10), %arg5: vector<4xi32> loc("<stdin>":54:32)):
      %19 = "spirv.ULessThan"(%arg4, %arg5) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1> loc("<stdin>":55:13)
      "spirv.Return"() : () -> () loc("<stdin>":56:7)
    }) : () -> () loc("<stdin>":53:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (vector<4xi32>, vector<4xi32>) -> (), sym_name = "ulte_vector"}> ({
    ^bb0(%arg2: vector<4xi32> loc("<stdin>":59:10), %arg3: vector<4xi32> loc("<stdin>":59:32)):
      %18 = "spirv.ULessThanEqual"(%arg2, %arg3) : (vector<4xi32>, vector<4xi32>) -> vector<4xi1> loc("<stdin>":60:13)
      "spirv.Return"() : () -> () loc("<stdin>":61:7)
    }) : () -> () loc("<stdin>":58:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (f32, f32) -> (), sym_name = "cmpf"}> ({
    ^bb0(%arg0: f32 loc("<stdin>":64:10), %arg1: f32 loc("<stdin>":64:22)):
      %0 = "spirv.FOrdEqual"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":65:12)
      %1 = "spirv.FOrdGreaterThan"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":66:12)
      %2 = "spirv.FOrdGreaterThanEqual"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":67:12)
      %3 = "spirv.FOrdLessThan"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":68:12)
      %4 = "spirv.FOrdLessThanEqual"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":69:12)
      %5 = "spirv.FOrdNotEqual"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":70:12)
      %6 = "spirv.FUnordEqual"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":71:12)
      %7 = "spirv.FUnordGreaterThan"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":72:12)
      %8 = "spirv.FUnordGreaterThanEqual"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":73:12)
      %9 = "spirv.FUnordLessThan"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":74:12)
      %10 = "spirv.FUnordLessThanEqual"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":75:13)
      %11 = "spirv.FUnordNotEqual"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":76:13)
      %12 = "spirv.Ordered"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":77:13)
      %13 = "spirv.Unordered"(%arg0, %arg1) : (f32, f32) -> i1 loc("<stdin>":78:13)
      %14 = "spirv.IsNan"(%arg0) : (f32) -> i1 loc("<stdin>":79:13)
      %15 = "spirv.IsInf"(%arg1) : (f32) -> i1 loc("<stdin>":80:13)
      %16 = "spirv.IsFinite"(%arg0) : (f32) -> i1 loc("<stdin>":81:13)
      %17 = "spirv.IsNormal"(%arg0) : (f32) -> i1 loc("<stdin>":82:13)
      "spirv.Return"() : () -> () loc("<stdin>":83:7)
    }) : () -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
