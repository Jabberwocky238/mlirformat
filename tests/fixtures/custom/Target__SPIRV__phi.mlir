module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @foo() "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      spirv.Branch ^bb1(%cst0_i32 : i32)
    ^bb1(%0: i32):  // pred: ^bb0
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @foo() "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      %cst_f32 = spirv.Constant 1.000000e+00 : f32
      spirv.Branch ^bb1(%cst0_i32, %cst_f32 : i32, f32)
    ^bb1(%0: i32, %1: f32):  // pred: ^bb0
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @foo() "None" {
      %cst0_i32 = spirv.Constant 0 : i32
      spirv.Branch ^bb1(%cst0_i32 : i32)
    ^bb1(%0: i32):  // pred: ^bb0
      %1 = spirv.IAdd %0, %0 : i32
      spirv.Branch ^bb2(%cst0_i32, %1 : i32, i32)
    ^bb2(%2: i32, %3: i32):  // pred: ^bb1
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @foo() "None" {
      spirv.Branch ^bb2
    ^bb1(%0: i32, %1: f32):  // pred: ^bb2
      spirv.Return
    ^bb2:  // pred: ^bb0
      %cst0_i32 = spirv.Constant 0 : i32
      %cst_f32 = spirv.Constant 1.000000e+00 : f32
      spirv.Branch ^bb1(%cst0_i32, %cst_f32 : i32, f32)
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @foo() "None" {
      %0 = spirv.Variable : !spirv.ptr<i32, Function>
      spirv.mlir.selection {
        %true = spirv.Constant true
        spirv.BranchConditional %true, ^bb1, ^bb2
      ^bb1:  // pred: ^bb0
        %cst0_i32 = spirv.Constant 0 : i32
        spirv.Branch ^bb3(%cst0_i32 : i32)
      ^bb2:  // pred: ^bb0
        %cst1_i32 = spirv.Constant 1 : i32
        spirv.Branch ^bb3(%cst1_i32 : i32)
      ^bb3(%1: i32):  // 2 preds: ^bb1, ^bb2
        spirv.Store "Function" %0, %1 : i32
        spirv.Return
      ^bb4:  // no predecessors
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.GlobalVariable @__builtin_var_NumWorkgroups__ built_in("NumWorkgroups") : !spirv.ptr<vector<3xi32>, Input>
    spirv.GlobalVariable @__builtin_var_WorkgroupId__ built_in("WorkgroupId") : !spirv.ptr<vector<3xi32>, Input>
    spirv.func @fmul_kernel() "None" {
      %cst12_i32 = spirv.Constant 12 : i32
      %cst32_i32 = spirv.Constant 32 : i32
      %cst4_i32 = spirv.Constant 4 : i32
      %__builtin_var_WorkgroupId___addr = spirv.mlir.addressof @__builtin_var_WorkgroupId__ : !spirv.ptr<vector<3xi32>, Input>
      %0 = spirv.Load "Input" %__builtin_var_WorkgroupId___addr : vector<3xi32>
      %1 = spirv.CompositeExtract %0[0 : i32] : vector<3xi32>
      %__builtin_var_WorkgroupId___addr_0 = spirv.mlir.addressof @__builtin_var_WorkgroupId__ : !spirv.ptr<vector<3xi32>, Input>
      %2 = spirv.Load "Input" %__builtin_var_WorkgroupId___addr_0 : vector<3xi32>
      %3 = spirv.CompositeExtract %2[1 : i32] : vector<3xi32>
      %__builtin_var_NumWorkgroups___addr = spirv.mlir.addressof @__builtin_var_NumWorkgroups__ : !spirv.ptr<vector<3xi32>, Input>
      %4 = spirv.Load "Input" %__builtin_var_NumWorkgroups___addr : vector<3xi32>
      %5 = spirv.CompositeExtract %4[0 : i32] : vector<3xi32>
      %__builtin_var_NumWorkgroups___addr_1 = spirv.mlir.addressof @__builtin_var_NumWorkgroups__ : !spirv.ptr<vector<3xi32>, Input>
      %6 = spirv.Load "Input" %__builtin_var_NumWorkgroups___addr_1 : vector<3xi32>
      %7 = spirv.CompositeExtract %6[1 : i32] : vector<3xi32>
      %8 = spirv.IMul %3, %cst32_i32 : i32
      %9 = spirv.IMul %7, %cst32_i32 : i32
      spirv.mlir.loop {
        spirv.Branch ^bb1(%8 : i32)
      ^bb1(%10: i32):  // 2 preds: ^bb0, ^bb2
        %11 = spirv.SLessThan %10, %cst12_i32 : i32
        spirv.BranchConditional %11, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        %12 = spirv.IMul %1, %cst4_i32 : i32
        %13 = spirv.IMul %5, %cst4_i32 : i32
        spirv.mlir.loop {
          spirv.Branch ^bb1(%12 : i32)
        ^bb1(%15: i32):  // 2 preds: ^bb0, ^bb2
          %16 = spirv.SLessThan %15, %cst4_i32 : i32
          spirv.BranchConditional %16, ^bb2, ^bb3
        ^bb2:  // pred: ^bb1
          %17 = spirv.IAdd %15, %13 : i32
          spirv.Branch ^bb1(%17 : i32)
        ^bb3:  // pred: ^bb1
          spirv.mlir.merge
        }
        %14 = spirv.IAdd %10, %9 : i32
        spirv.Branch ^bb1(%14 : i32)
      ^bb3:  // pred: ^bb1
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @fmul_kernel, @__builtin_var_WorkgroupId__, @__builtin_var_NumWorkgroups__
    spirv.ExecutionMode @fmul_kernel "LocalSize", 32, 1, 1
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @fmul_kernel() "None" {
      %cst4_i32 = spirv.Constant 4 : i32
      %cst43_i32 = spirv.Constant 43 : i32
      %cst44_i32 = spirv.Constant 44 : i32
      spirv.mlir.loop {
        spirv.Branch ^bb1(%cst43_i32 : i32)
      ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb2
        %1 = spirv.SLessThan %0, %cst4_i32 : i32
        spirv.BranchConditional %1, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        %2 = spirv.IAdd %0, %cst4_i32 : i32
        spirv.Branch ^bb1(%2 : i32)
      ^bb3:  // pred: ^bb1
        spirv.mlir.merge
      }
      spirv.mlir.loop {
        spirv.Branch ^bb1(%cst44_i32 : i32)
      ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb2
        %1 = spirv.SLessThan %0, %cst4_i32 : i32
        spirv.BranchConditional %1, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        %2 = spirv.IAdd %0, %cst4_i32 : i32
        spirv.Branch ^bb1(%2 : i32)
      ^bb3:  // pred: ^bb1
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @fmul_kernel
    spirv.ExecutionMode @fmul_kernel "LocalSize", 32, 1, 1
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @cond_branch_true_argument() "None" {
      %true = spirv.Constant true
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      spirv.mlir.selection {
        spirv.BranchConditional %true, ^bb1(%cst0_i32, %cst0_i32 : i32, i32), ^bb2
      ^bb1(%0: i32, %1: i32):  // pred: ^bb0
        spirv.Return
      ^bb2:  // pred: ^bb0
        spirv.Return
      ^bb3:  // no predecessors
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @cond_branch_false_argument() "None" {
      %true = spirv.Constant true
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      spirv.mlir.selection {
        spirv.BranchConditional %true, ^bb1, ^bb2(%cst0_i32, %cst0_i32 : i32, i32)
      ^bb1:  // pred: ^bb0
        spirv.Return
      ^bb2(%0: i32, %1: i32):  // pred: ^bb0
        spirv.Return
      ^bb3:  // no predecessors
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

// -----
module {
  spirv.module Logical GLSL450 requires #spirv.vce<v1.0, [Shader], []> {
    spirv.func @cond_branch_true_and_false_argument() "None" {
      %true = spirv.Constant true
      %cst0_i32 = spirv.Constant 0 : i32
      %cst1_i32 = spirv.Constant 1 : i32
      spirv.mlir.selection {
        spirv.BranchConditional %true, ^bb1(%cst1_i32 : i32), ^bb2(%cst0_i32, %cst0_i32 : i32, i32)
      ^bb1(%0: i32):  // pred: ^bb0
        spirv.Return
      ^bb2(%1: i32, %2: i32):  // pred: ^bb0
        spirv.Return
      ^bb3:  // no predecessors
        spirv.mlir.merge
      }
      spirv.Return
    }
    spirv.func @main() "None" {
      spirv.Return
    }
    spirv.EntryPoint "GLCompute" @main
  }
}

