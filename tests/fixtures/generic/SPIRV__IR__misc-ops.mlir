"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "undef"}> ({
    %0 = "spirv.Undef"() : () -> f32
    %1 = "spirv.Undef"() : () -> vector<4xf32>
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "assume_true"}> ({
  ^bb0(%arg0: i1):
    "spirv.KHR.AssumeTrue"(%arg0) : (i1) -> ()
    "spirv.Return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
