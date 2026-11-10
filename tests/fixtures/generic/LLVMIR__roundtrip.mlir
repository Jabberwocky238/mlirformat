#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>, description = "The domain">
#alias_scope_domain1 = #llvm.alias_scope_domain<id = "domainid", description = "The domain">
#alias_scope = #llvm.alias_scope<id = distinct[0]<>, domain = #alias_scope_domain, description = "The domain">
#alias_scope1 = #llvm.alias_scope<id = "stringid", domain = #alias_scope_domain1, description = "The domain">
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "baz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i32, f32, !llvm.ptr, !llvm.ptr, i1, vector<2x!llvm.ptr>) -> (), sym_name = "ops"}> ({
  ^bb0(%arg100: i32, %arg101: f32, %arg102: !llvm.ptr, %arg103: !llvm.ptr, %arg104: i1, %arg105: vector<2x!llvm.ptr>):
    %202 = "llvm.add"(%arg100, %arg100) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %203 = "llvm.sub"(%arg100, %arg100) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %204 = "llvm.mul"(%arg100, %arg100) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %205 = "llvm.udiv"(%arg100, %arg100) : (i32, i32) -> i32
    %206 = "llvm.sdiv"(%arg100, %arg100) : (i32, i32) -> i32
    %207 = "llvm.urem"(%arg100, %arg100) : (i32, i32) -> i32
    %208 = "llvm.srem"(%arg100, %arg100) : (i32, i32) -> i32
    %209 = "llvm.icmp"(%arg100, %arg100) <{predicate = 1 : i64}> : (i32, i32) -> i1
    %210 = "llvm.add"(%209, %209) <{overflowFlags = 0 : i32}> : (i1, i1) -> i1
    %211 = "llvm.icmp"(%arg102, %arg102) <{predicate = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> i1
    %212 = "llvm.add"(%211, %211) <{overflowFlags = 0 : i32}> : (i1, i1) -> i1
    %213 = "llvm.icmp"(%arg105, %arg105) <{predicate = 1 : i64}> : (vector<2x!llvm.ptr>, vector<2x!llvm.ptr>) -> vector<2xi1>
    %214 = "llvm.add"(%213, %213) <{overflowFlags = 0 : i32}> : (vector<2xi1>, vector<2xi1>) -> vector<2xi1>
    %215 = "llvm.add"(%arg100, %arg100) <{overflowFlags = 1 : i32}> : (i32, i32) -> i32
    %216 = "llvm.sub"(%arg100, %arg100) <{overflowFlags = 2 : i32}> : (i32, i32) -> i32
    %217 = "llvm.mul"(%arg100, %arg100) <{overflowFlags = 3 : i32}> : (i32, i32) -> i32
    %218 = "llvm.shl"(%arg100, %arg100) <{overflowFlags = 3 : i32}> : (i32, i32) -> i32
    %219 = "llvm.sdiv"(%arg100, %arg100) <{isExact}> : (i32, i32) -> i32
    %220 = "llvm.udiv"(%arg100, %arg100) <{isExact}> : (i32, i32) -> i32
    %221 = "llvm.ashr"(%arg100, %arg100) <{isExact}> : (i32, i32) -> i32
    %222 = "llvm.lshr"(%arg100, %arg100) <{isExact}> : (i32, i32) -> i32
    %223 = "llvm.or"(%arg100, %arg100) <{isDisjoint}> : (i32, i32) -> i32
    %224 = "llvm.fadd"(%arg101, %arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %225 = "llvm.fsub"(%arg101, %arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %226 = "llvm.fmul"(%arg101, %arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %227 = "llvm.fdiv"(%arg101, %arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %228 = "llvm.frem"(%arg101, %arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %229 = "llvm.alloca"(%arg100) <{elem_type = f64}> : (i32) -> !llvm.ptr
    %230 = "llvm.getelementptr"(%229, %arg100) <{elem_type = f64, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
    %231 = "llvm.load"(%230) <{ordering = 0 : i64}> : (!llvm.ptr) -> f64
    "llvm.store"(%231, %229) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> ()
    %232 = "llvm.call"(%arg100) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> !llvm.struct<(i32, f64, i32)>
    %233 = "llvm.extractvalue"(%232) <{position = array<i64: 0>}> : (!llvm.struct<(i32, f64, i32)>) -> i32
    %234 = "llvm.insertvalue"(%232, %233) <{position = array<i64: 2>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    %235 = "llvm.mlir.addressof"() <{global_name = @foo}> : () -> !llvm.ptr
    %236 = "llvm.call"(%235, %arg100) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i32) -> !llvm.struct<(i32, f64, i32)>
    "llvm.call"(%arg100, %arg100) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @vararg_func, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>, var_callee_type = !llvm.func<void (i32, ...)>}> : (i32, i32) -> ()
    "llvm.call"(%arg100, %arg100) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @vararg_func, fastmathFlags = #llvm.fastmath<fast>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>, var_callee_type = !llvm.func<void (i32, ...)>}> : (i32, i32) -> ()
    %237 = "llvm.mlir.addressof"() <{global_name = @vararg_func}> : () -> !llvm.ptr
    "llvm.call"(%237, %arg100, %arg100) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>, var_callee_type = !llvm.func<void (i32, ...)>}> : (!llvm.ptr, i32, i32) -> ()
    "llvm.call"(%237, %arg100, %arg100) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<fast>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>, var_callee_type = !llvm.func<void (i32, ...)>}> : (!llvm.ptr, i32, i32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, convergent, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, no_unwind, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, will_return}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, noreturn, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, returns_twice}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, hot, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, cold, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, noduplicate, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, no_caller_saved_registers, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, nocallback, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, modular_format = "format str", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> {memory = #llvm.memory_effects<other = none, argMem = read, inaccessibleMem = write, errnoMem = none, targetMem0 = none, targetMem1 = none>} : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, nobuiltins = [], op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, nobuiltins = ["asdf", "defg"], op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, allocsize = array<i32: 5>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, allocsize = array<i32: 3, 5>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, minsize, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, optsize}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, builtin, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, nobuiltin, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, save_reg_params}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, zero_call_used_regs = "all"}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, zero_call_used_regs = "thing"}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, default_func_attrs = {justKey, key = "value"}, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "llvm.cond_br"(%209)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    %238 = "llvm.mlir.undef"() : () -> !llvm.struct<(i32, f64, i32)>
    %239 = "llvm.mlir.constant"() <{value = 42 : i64}> : () -> i47
    "llvm.switch"(%202)[^bb3, ^bb4, ^bb5, ^bb6, ^bb6] <{case_operand_segments = array<i32: 0, 0, 0, 0>, case_values = dense<[1, 2, 3, -3]> : vector<4xi32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "llvm.switch"(%202)[^bb7] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb4:  // pred: ^bb2
    "llvm.switch"(%202)[^bb7] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb5:  // pred: ^bb2
    "llvm.switch"(%202)[^bb7] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb6:  // 2 preds: ^bb2, ^bb2
    "llvm.switch"(%202)[^bb7] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb7:  // 4 preds: ^bb3, ^bb4, ^bb5, ^bb6
    %240 = "llvm.select"(%209, %202, %203) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i32, i32) -> i32
    %241 = "llvm.inttoptr"(%arg100) : (i32) -> !llvm.ptr
    %242 = "llvm.ptrtoint"(%241) : (!llvm.ptr) -> i32
    %243 = "llvm.ptrtoaddr"(%241) : (!llvm.ptr) -> i64
    %244 = "llvm.mlir.poison"() : () -> vector<3x!llvm.ptr>
    %245 = "llvm.ptrtoaddr"(%244) : (vector<3x!llvm.ptr>) -> vector<3xi64>
    %246 = "llvm.fpext"(%arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f80
    %247 = "llvm.fpext"(%arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f128
    %248 = "llvm.fneg"(%arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %249 = "llvm.intr.sin"(%arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %250 = "llvm.intr.pow"(%arg101, %arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %251 = "llvm.intr.powi"(%arg101, %arg100) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, i32) -> f32
    %252 = "llvm.intr.bitreverse"(%arg100) : (i32) -> i32
    %253 = "llvm.intr.ctpop"(%arg100) : (i32) -> i32
    %254 = "llvm.intr.round"(%arg101) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    "llvm.intr.memcpy"(%arg102, %arg103, %arg100) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy"(%arg102, %arg103, %arg100) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy.inline"(%arg102, %arg103) <{isVolatile = false, len = 10 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64, ptr)>, linkage = #llvm.linkage<external>, sym_name = "gep", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg97: !llvm.ptr, %arg98: i64, %arg99: !llvm.ptr):
    %195 = "llvm.getelementptr"(%arg97, %arg98) <{elem_type = !llvm.struct<(i32, struct<(i32, f32)>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, 1, 0>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %196 = "llvm.getelementptr"(%arg99, %arg98, %arg98) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %197 = "llvm.getelementptr"(%arg99, %arg98, %arg98) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 7 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %198 = "llvm.getelementptr"(%arg99, %arg98, %arg98) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %199 = "llvm.getelementptr"(%arg99, %arg98, %arg98) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 2 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %200 = "llvm.getelementptr"(%arg99, %arg98, %arg98) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 6 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %201 = "llvm.getelementptr"(%arg99, %arg98, %arg98) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 4 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, f64, i32)> (i32, ...)>, linkage = #llvm.linkage<external>, sym_name = "vararg_foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, f64, i32)> (i32)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg96: i32):
    %172 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i32
    %173 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i32
    %174 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f64}> : () -> f64
    %175 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f64}> : () -> f64
    %176 = "llvm.add"(%172, %173) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %177 = "llvm.mul"(%176, %173) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %178 = "llvm.fadd"(%174, %175) <{fastmathFlags = #llvm.fastmath<none>}> : (f64, f64) -> f64
    %179 = "llvm.fsub"(%175, %178) <{fastmathFlags = #llvm.fastmath<none>}> : (f64, f64) -> f64
    %180 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i1
    "llvm.cond_br"(%180, %176, %176)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i32, i32) -> ()
  ^bb1(%181: i32):  // pred: ^bb0
    %182 = "llvm.call"(%181) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> !llvm.struct<(i32, f64, i32)>
    %183 = "llvm.extractvalue"(%182) <{position = array<i64: 0>}> : (!llvm.struct<(i32, f64, i32)>) -> i32
    %184 = "llvm.extractvalue"(%182) <{position = array<i64: 1>}> : (!llvm.struct<(i32, f64, i32)>) -> f64
    %185 = "llvm.extractvalue"(%182) <{position = array<i64: 2>}> : (!llvm.struct<(i32, f64, i32)>) -> i32
    %186 = "llvm.mlir.undef"() : () -> !llvm.struct<(i32, f64, i32)>
    %187 = "llvm.insertvalue"(%186, %177) <{position = array<i64: 0>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    %188 = "llvm.insertvalue"(%187, %179) <{position = array<i64: 1>}> : (!llvm.struct<(i32, f64, i32)>, f64) -> !llvm.struct<(i32, f64, i32)>
    %189 = "llvm.insertvalue"(%188, %183) <{position = array<i64: 2>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    "llvm.return"(%189) : (!llvm.struct<(i32, f64, i32)>) -> ()
  ^bb2(%190: i32):  // pred: ^bb0
    %191 = "llvm.mlir.undef"() : () -> !llvm.struct<(i32, f64, i32)>
    %192 = "llvm.insertvalue"(%191, %190) <{position = array<i64: 0>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    %193 = "llvm.insertvalue"(%192, %179) <{position = array<i64: 1>}> : (!llvm.struct<(i32, f64, i32)>, f64) -> !llvm.struct<(i32, f64, i32)>
    %194 = "llvm.insertvalue"(%193, %177) <{position = array<i64: 2>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    "llvm.return"(%194) : (!llvm.struct<(i32, f64, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i64, vector<4xi32>, vector<4xi64>, !llvm.ptr) -> (), sym_name = "casts"}> ({
  ^bb0(%arg91: i32, %arg92: i64, %arg93: vector<4xi32>, %arg94: vector<4xi64>, %arg95: !llvm.ptr):
    %153 = "llvm.sext"(%arg91) : (i32) -> i56
    %154 = "llvm.zext"(%arg91) : (i32) -> i64
    %155 = "llvm.trunc"(%arg92) <{overflowFlags = 0 : i32}> : (i64) -> i56
    %156 = "llvm.sext"(%arg93) : (vector<4xi32>) -> vector<4xi56>
    %157 = "llvm.zext"(%arg93) : (vector<4xi32>) -> vector<4xi64>
    %158 = "llvm.trunc"(%arg94) <{overflowFlags = 0 : i32}> : (vector<4xi64>) -> vector<4xi56>
    %159 = "llvm.sitofp"(%arg91) : (i32) -> f32
    %160 = "llvm.uitofp"(%arg91) : (i32) -> f32
    %161 = "llvm.fptosi"(%160) : (f32) -> i32
    %162 = "llvm.fptoui"(%160) : (f32) -> i32
    %163 = "llvm.addrspacecast"(%arg95) : (!llvm.ptr) -> !llvm.ptr<2>
    %164 = "llvm.bitcast"(%arg92) : (i64) -> f64
    %165 = "llvm.bitcast"(%arg92) : (i64) -> !llvm.byte<64>
    %166 = "llvm.bitcast"(%165) : (!llvm.byte<64>) -> i64
    %167 = "llvm.bitcast"(%arg92) : (i64) -> !llvm.byte<8>
    %168 = "llvm.bitcast"(%165) : (!llvm.byte<64>) -> i32
    %169 = "llvm.bitcast"(%165) : (!llvm.byte<64>) -> !llvm.byte<8>
    %170 = "llvm.bitcast"(%165) : (!llvm.byte<64>) -> !llvm.ptr
    %171 = "llvm.bitcast"(%arg95) : (!llvm.ptr) -> !llvm.byte<8>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i64, vector<4xi32>, vector<4xi64>, !llvm.ptr) -> (), sym_name = "nneg_casts"}> ({
  ^bb0(%arg86: i32, %arg87: i64, %arg88: vector<4xi32>, %arg89: vector<4xi64>, %arg90: !llvm.ptr):
    %150 = "llvm.zext"(%arg86) <{nonNeg}> : (i32) -> i64
    %151 = "llvm.zext"(%arg88) <{nonNeg}> : (vector<4xi32>) -> vector<4xi64>
    %152 = "llvm.uitofp"(%arg86) <{nonNeg}> : (i32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i64, vector<4xi32>, vector<4xi64>, !llvm.ptr) -> (), sym_name = "casts_overflow"}> ({
  ^bb0(%arg81: i32, %arg82: i64, %arg83: vector<4xi32>, %arg84: vector<4xi64>, %arg85: !llvm.ptr):
    %145 = "llvm.trunc"(%arg82) <{overflowFlags = 1 : i32}> : (i64) -> i56
    %146 = "llvm.trunc"(%arg82) <{overflowFlags = 2 : i32}> : (i64) -> i56
    %147 = "llvm.trunc"(%arg82) <{overflowFlags = 3 : i32}> : (i64) -> i56
    %148 = "llvm.trunc"(%arg82) <{overflowFlags = 3 : i32}> : (i64) -> i56
    %149 = "llvm.trunc"(%arg84) <{overflowFlags = 1 : i32}> : (vector<4xi64>) -> vector<4xi56>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, i32, f32, vector<2x!llvm.ptr>) -> (), sym_name = "vect"}> ({
  ^bb0(%arg77: vector<4xf32>, %arg78: i32, %arg79: f32, %arg80: vector<2x!llvm.ptr>):
    %140 = "llvm.extractelement"(%arg77, %arg78) : (vector<4xf32>, i32) -> f32
    %141 = "llvm.insertelement"(%arg77, %arg79, %arg78) : (vector<4xf32>, f32, i32) -> vector<4xf32>
    %142 = "llvm.shufflevector"(%arg77, %arg77) <{mask = array<i32: 0, 0, 0, 0, 7>}> : (vector<4xf32>, vector<4xf32>) -> vector<5xf32>
    %143 = "llvm.shufflevector"(%arg80, %arg80) <{mask = array<i32: 1, 0>}> : (vector<2x!llvm.ptr>, vector<2x!llvm.ptr>) -> vector<2x!llvm.ptr>
    %144 = "llvm.mlir.constant"() <{value = dense<1.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xf32>, i32, f32) -> (), sym_name = "scalable_vect"}> ({
  ^bb0(%arg74: vector<[4]xf32>, %arg75: i32, %arg76: f32):
    %136 = "llvm.extractelement"(%arg74, %arg75) : (vector<[4]xf32>, i32) -> f32
    %137 = "llvm.insertelement"(%arg74, %arg76, %arg75) : (vector<[4]xf32>, f32, i32) -> vector<[4]xf32>
    %138 = "llvm.shufflevector"(%arg74, %arg74) <{mask = array<i32: 0, 0, 0, 0>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %139 = "llvm.mlir.constant"() <{value = dense<1.000000e+00> : vector<[4]xf32>}> : () -> vector<[4]xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<4xf32>, vector<[4]xf32>) -> (), sym_name = "mixed_vect"}> ({
  ^bb0(%arg71: vector<8xf32>, %arg72: vector<4xf32>, %arg73: vector<[4]xf32>):
    %130 = "llvm.intr.vector.insert"(%arg73, %arg71) <{pos = 0 : i64}> : (vector<[4]xf32>, vector<8xf32>) -> vector<[4]xf32>
    %131 = "llvm.intr.vector.insert"(%arg73, %arg72) <{pos = 0 : i64}> : (vector<[4]xf32>, vector<4xf32>) -> vector<[4]xf32>
    %132 = "llvm.intr.vector.insert"(%131, %arg72) <{pos = 4 : i64}> : (vector<[4]xf32>, vector<4xf32>) -> vector<[4]xf32>
    %133 = "llvm.intr.vector.insert"(%arg71, %arg72) <{pos = 4 : i64}> : (vector<8xf32>, vector<4xf32>) -> vector<8xf32>
    %134 = "llvm.intr.vector.extract"(%132) <{pos = 0 : i64}> : (vector<[4]xf32>) -> vector<8xf32>
    %135 = "llvm.intr.vector.extract"(%arg71) <{pos = 6 : i64}> : (vector<8xf32>) -> vector<2xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xf16>, vector<[4]xf16>) -> (), sym_name = "vector_interleave2"}> ({
  ^bb0(%arg69: vector<[4]xf16>, %arg70: vector<[4]xf16>):
    %129 = "llvm.intr.vector.interleave2"(%arg69, %arg70) : (vector<[4]xf16>, vector<[4]xf16>) -> vector<[8]xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf16>) -> (), sym_name = "vector_deinterleave2"}> ({
  ^bb0(%arg68: vector<[8]xf16>):
    %128 = "llvm.intr.vector.deinterleave2"(%arg68) : (vector<[8]xf16>) -> !llvm.struct<(vector<[4]xf16>, vector<[4]xf16>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> (), sym_name = "alloca"}> ({
  ^bb0(%arg67: i64):
    %126 = "llvm.alloca"(%arg67) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %127 = "llvm.alloca"(%arg67) <{alignment = 8 : i64, elem_type = i32, inalloca}> : (i64) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "null"}> ({
    %125 = "llvm.mlir.zero"() : () -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "zero"}> ({
    %124 = "llvm.mlir.zero"() : () -> i8
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "atomic_load"}> ({
  ^bb0(%arg66: !llvm.ptr):
    %121 = "llvm.load"(%arg66) <{alignment = 4 : i64, ordering = 2 : i64}> : (!llvm.ptr) -> f32
    %122 = "llvm.load"(%arg66) <{alignment = 16 : i64, ordering = 2 : i64, syncscope = "singlethread", volatile_}> : (!llvm.ptr) -> f32
    %123 = "llvm.load"(%arg66) <{alignment = 4 : i64, ordering = 2 : i64}> : (!llvm.ptr) -> i128
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, i256, !llvm.ptr) -> (), sym_name = "atomic_store"}> ({
  ^bb0(%arg63: f32, %arg64: i256, %arg65: !llvm.ptr):
    "llvm.store"(%arg63, %arg65) <{alignment = 4 : i64, ordering = 2 : i64}> : (f32, !llvm.ptr) -> ()
    "llvm.store"(%arg63, %arg65) <{alignment = 16 : i64, ordering = 2 : i64, syncscope = "singlethread", volatile_}> : (f32, !llvm.ptr) -> ()
    "llvm.store"(%arg64, %arg65) <{alignment = 4 : i64, ordering = 2 : i64}> : (i256, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, f32, vector<2xf16>) -> (), sym_name = "atomicrmw"}> ({
  ^bb0(%arg60: !llvm.ptr, %arg61: f32, %arg62: vector<2xf16>):
    %117 = "llvm.atomicrmw"(%arg60, %arg61) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    %118 = "llvm.atomicrmw"(%arg60, %arg61) <{alignment = 16 : i64, bin_op = 12 : i64, ordering = 2 : i64, syncscope = "singlethread", volatile_}> : (!llvm.ptr, f32) -> f32
    %119 = "llvm.atomicrmw"(%arg60, %arg62) <{bin_op = 14 : i64, ordering = 2 : i64}> : (!llvm.ptr, vector<2xf16>) -> vector<2xf16>
    %120 = "llvm.atomicrmw"(%arg60, %arg61) <{bin_op = 22 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, i32, i32) -> (), sym_name = "cmpxchg"}> ({
  ^bb0(%arg57: !llvm.ptr, %arg58: i32, %arg59: i32):
    %115 = "llvm.cmpxchg"(%arg57, %arg58, %arg59) <{failure_ordering = 2 : i64, success_ordering = 6 : i64}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, i1)>
    %116 = "llvm.cmpxchg"(%arg57, %arg58, %arg59) <{alignment = 16 : i64, failure_ordering = 2 : i64, success_ordering = 6 : i64, syncscope = "singlethread", volatile_, weak}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, i1)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> i32, sym_name = "invariant_load"}> ({
  ^bb0(%arg56: !llvm.ptr):
    %114 = "llvm.load"(%arg56) <{alignment = 4 : i64, invariant, ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "func.return"(%114) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> i32, sym_name = "invariant_group_load"}> ({
  ^bb0(%arg55: !llvm.ptr):
    %113 = "llvm.load"(%arg55) <{alignment = 4 : i64, invariantGroup, ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "func.return"(%113) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, !llvm.ptr) -> (), sym_name = "invariant_group_store"}> ({
  ^bb0(%arg53: i32, %arg54: !llvm.ptr):
    "llvm.store"(%arg53, %arg54) <{invariantGroup, ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "_ZTIi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "bar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "invokeLandingpad", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %98 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %99 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %100 = "llvm.mlir.constant"() <{value = "\01"}> : () -> !llvm.array<1 x i8>
    %101 = "llvm.mlir.zero"() : () -> !llvm.ptr
    %102 = "llvm.mlir.addressof"() <{global_name = @_ZTIi}> : () -> !llvm.ptr
    %103 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %104 = "llvm.alloca"(%103) <{elem_type = i8}> : (i32) -> !llvm.ptr
    %105 = "llvm.invoke"(%103)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb1:  // 5 preds: ^bb0, ^bb3, ^bb4, ^bb5, ^bb6
    %106 = "llvm.landingpad"(%101, %102, %100) <{cleanup}> : (!llvm.ptr, !llvm.ptr, !llvm.array<1 x i8>) -> !llvm.struct<(ptr, i32)>
    %107 = "llvm.intr.eh.typeid.for"(%102) : (!llvm.ptr) -> i32
    "llvm.resume"(%106) : (!llvm.struct<(ptr, i32)>) -> ()
  ^bb2:  // 5 preds: ^bb0, ^bb3, ^bb4, ^bb5, ^bb6
    "llvm.return"(%103) : (i32) -> ()
  ^bb3:  // no predecessors
    "llvm.invoke"(%104, %102, %101)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @bar, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0, 0, 0>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
  ^bb4:  // no predecessors
    %108 = "llvm.mlir.addressof"() <{global_name = @foo}> : () -> !llvm.ptr
    %109 = "llvm.invoke"(%108, %103)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0, 0, 0>}> : (!llvm.ptr, i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb5:  // no predecessors
    %110 = "llvm.invoke"(%103, %103)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @vararg_foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0, 0, 0>, var_callee_type = !llvm.func<struct<(i32, f64, i32)> (i32, ...)>}> : (i32, i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb6:  // no predecessors
    %111 = "llvm.mlir.addressof"() <{global_name = @vararg_foo}> : () -> !llvm.ptr
    %112 = "llvm.invoke"(%111, %103, %103)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0, 0, 0>, var_callee_type = !llvm.func<struct<(i32, f64, i32)> (i32, ...)>}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb7:  // no predecessors
    "llvm.return"(%98) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "useFreezeOp"}> ({
  ^bb0(%arg52: i32):
    %93 = "llvm.freeze"(%arg52) : (i32) -> i32
    %94 = "llvm.mlir.undef"() : () -> i8
    %95 = "llvm.freeze"(%94) : (i8) -> i8
    %96 = "llvm.mlir.poison"() : () -> i8
    %97 = "llvm.freeze"(%96) : (i8) -> i8
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "useFenceInst"}> ({
    "llvm.fence"() <{ordering = 7 : i64, syncscope = "agent"}> : () -> ()
    "llvm.fence"() <{ordering = 7 : i64, syncscope = ""}> : () -> ()
    "llvm.fence"() <{ordering = 5 : i64}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "useInlineAsm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg51: i32):
    %88 = "llvm.inline_asm"(%arg51) <{asm_string = "bswap $0", constraints = "=r,r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32) -> i8
    %89 = "llvm.inline_asm"(%arg51, %arg51) <{asm_string = "foo", constraints = "bar", tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %90 = "llvm.inline_asm"(%arg51, %arg51) <{asm_string = "foo", constraints = "bar", has_side_effects, tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %91 = "llvm.inline_asm"(%arg51, %arg51) <{asm_string = "foo", constraints = "bar", is_align_stack, tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %92 = "llvm.inline_asm"(%arg51) <{asm_string = "foo", constraints = "=r,=r,r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32) -> !llvm.struct<(i8, i8)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, i32, vector<2xf32>, vector<2xf32>) -> (), sym_name = "fastmathFlags"}> ({
  ^bb0(%arg46: f32, %arg47: f32, %arg48: i32, %arg49: vector<2xf32>, %arg50: vector<2xf32>):
    %68 = "llvm.fadd"(%arg46, %arg47) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %69 = "llvm.fsub"(%arg46, %arg47) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %70 = "llvm.fmul"(%arg46, %arg47) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %71 = "llvm.fdiv"(%arg46, %arg47) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %72 = "llvm.frem"(%arg46, %arg47) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %73 = "llvm.fcmp"(%arg46, %arg47) <{fastmathFlags = #llvm.fastmath<fast>, predicate = 1 : i64}> : (f32, f32) -> i1
    %74 = "llvm.add"(%73, %73) <{overflowFlags = 0 : i32}> : (i1, i1) -> i1
    %75 = "llvm.fcmp"(%arg49, %arg50) <{fastmathFlags = #llvm.fastmath<fast>, predicate = 1 : i64}> : (vector<2xf32>, vector<2xf32>) -> vector<2xi1>
    %76 = "llvm.add"(%75, %75) <{overflowFlags = 0 : i32}> : (vector<2xi1>, vector<2xi1>) -> vector<2xi1>
    %77 = "llvm.fneg"(%arg46) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32) -> f32
    %78 = "llvm.call"(%arg48) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<fast>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> !llvm.struct<(i32, f64, i32)>
    %79 = "llvm.fadd"(%arg46, %arg47) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %80 = "llvm.fadd"(%arg46, %arg47) <{fastmathFlags = #llvm.fastmath<nnan, ninf>}> : (f32, f32) -> f32
    %81 = "llvm.fneg"(%arg46) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %82 = "llvm.intr.sin"(%arg46) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32) -> f32
    %83 = "llvm.intr.sin"(%arg46) <{fastmathFlags = #llvm.fastmath<afn>}> : (f32) -> f32
    %84 = "llvm.intr.vector.reduce.fmin"(%arg49) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %85 = "llvm.intr.vector.reduce.fmax"(%arg49) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %86 = "llvm.intr.vector.reduce.fminimum"(%arg49) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %87 = "llvm.intr.vector.reduce.fmaximum"(%arg49) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "lifetime", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg45: !llvm.ptr):
    "llvm.intr.lifetime.start"(%arg45) : (!llvm.ptr) -> ()
    "llvm.intr.lifetime.end"(%arg45) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "invariant", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg44: !llvm.ptr):
    %67 = "llvm.intr.invariant.start"(%arg44) <{size = 1 : i64}> : (!llvm.ptr) -> !llvm.ptr
    "llvm.intr.invariant.end"(%67, %arg44) <{size = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "invariant_group_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg43: !llvm.ptr):
    %65 = "llvm.intr.launder.invariant.group"(%arg43) : (!llvm.ptr) -> !llvm.ptr
    %66 = "llvm.intr.strip.invariant.group"(%arg43) : (!llvm.ptr) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ...)>, linkage = #llvm.linkage<external>, sym_name = "vararg_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg42: i32):
    %61 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %62 = "llvm.alloca"(%61) <{elem_type = !llvm.struct<"struct.va_list_opaque", (ptr)>}> : (i32) -> !llvm.ptr
    "llvm.intr.vastart"(%62) : (!llvm.ptr) -> ()
    %63 = "llvm.alloca"(%61) <{elem_type = !llvm.struct<"struct.va_list_opaque", (ptr)>}> : (i32) -> !llvm.ptr
    "llvm.intr.vacopy"(%63, %62) : (!llvm.ptr, !llvm.ptr) -> ()
    %64 = "llvm.va_arg"(%63) : (!llvm.ptr) -> i32
    "llvm.intr.vaend"(%62) : (!llvm.ptr) -> ()
    "llvm.intr.vaend"(%63) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr)>, linkage = #llvm.linkage<external>, sym_name = "eh_typeid", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg41: !llvm.ptr):
    %60 = "llvm.intr.eh.typeid.for"(%arg41) : (!llvm.ptr) -> i32
    "llvm.return"(%60) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "stackrestore", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg40: !llvm.ptr):
    "llvm.intr.stackrestore"(%arg40) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "experimental_noalias_scope_decl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.intr.experimental.noalias.scope.decl"() <{scope = #alias_scope}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "experimental_noalias_scope_with_string_id", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.intr.experimental.noalias.scope.decl"() <{scope = #alias_scope1}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fadd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg38: f32, %arg39: f32):
    %59 = "llvm.intr.experimental.constrained.fadd"(%arg38, %arg39) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fsub", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg36: f32, %arg37: f32):
    %58 = "llvm.intr.experimental.constrained.fsub"(%arg36, %arg37) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fmul", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg34: f32, %arg35: f32):
    %57 = "llvm.intr.experimental.constrained.fmul"(%arg34, %arg35) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fdiv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg32: f32, %arg33: f32):
    %56 = "llvm.intr.experimental.constrained.fdiv"(%arg32, %arg33) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_frem", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg30: f32, %arg31: f32):
    %55 = "llvm.intr.experimental.constrained.frem"(%arg30, %arg31) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fma", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg27: f32, %arg28: f32, %arg29: f32):
    %54 = "llvm.intr.experimental.constrained.fma"(%arg27, %arg28, %arg29) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fmuladd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg24: f32, %arg25: f32, %arg26: f32):
    %53 = "llvm.intr.experimental.constrained.fmuladd"(%arg24, %arg25, %arg26) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32, f32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f64)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fptrunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: f64):
    %48 = "llvm.intr.experimental.constrained.fptrunc"(%arg23) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f64) -> f32
    %49 = "llvm.intr.experimental.constrained.fptrunc"(%arg23) <{fpExceptionBehavior = 1 : i64, roundingmode = 1 : i64}> : (f64) -> f32
    %50 = "llvm.intr.experimental.constrained.fptrunc"(%arg23) <{fpExceptionBehavior = 2 : i64, roundingmode = 2 : i64}> : (f64) -> f32
    %51 = "llvm.intr.experimental.constrained.fptrunc"(%arg23) <{fpExceptionBehavior = 0 : i64, roundingmode = 3 : i64}> : (f64) -> f32
    %52 = "llvm.intr.experimental.constrained.fptrunc"(%arg23) <{fpExceptionBehavior = 0 : i64, roundingmode = 4 : i64}> : (f64) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "tail_call_target", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_none", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %47 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%47) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_default", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %46 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%46) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_musttail", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %45 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<musttail>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%45) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_tail", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %44 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<tail>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%44) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_notail", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %43 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<notail>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%43) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "vector_predication_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg19: vector<8xi32>, %arg20: vector<8xi32>, %arg21: vector<8xi1>, %arg22: i32):
    %39 = "llvm.intr.vp.smax"(%arg19, %arg20, %arg21, %arg22) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %40 = "llvm.intr.vp.smin"(%arg19, %arg20, %arg21, %arg22) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %41 = "llvm.intr.vp.umax"(%arg19, %arg20, %arg21, %arg22) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %42 = "llvm.intr.vp.umin"(%arg19, %arg20, %arg21, %arg22) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "op_bundle_target", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_call_with_empty_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @op_bundle_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_call_with_empty_opbundle_operands", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @op_bundle_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32: 0>, op_bundle_tags = ["tag"], operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_call_with_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %36 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %37 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %38 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "llvm.call"(%36, %37, %38) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @op_bundle_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32: 2, 1>, op_bundle_tags = ["tag1", "tag2"], operandSegmentSizes = array<i32: 0, 3>}> : (i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_with_empty_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %32 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %33 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %34 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    "llvm.invoke"()[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @op_bundle_target, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
  ^bb1:  // pred: ^bb0
    %35 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_with_empty_opbundle_operands", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %28 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %29 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %30 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    "llvm.invoke"()[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @op_bundle_target, op_bundle_sizes = array<i32: 0>, op_bundle_tags = ["tag"], operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
  ^bb1:  // pred: ^bb0
    %31 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_with_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %24 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %25 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %26 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    "llvm.invoke"(%24, %25, %26)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @op_bundle_target, op_bundle_sizes = array<i32: 2, 1>, op_bundle_tags = ["tag1", "tag2"], operandSegmentSizes = array<i32: 0, 0, 0, 3>}> : (i32, i32, i32) -> ()
  ^bb1:  // pred: ^bb0
    %27 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_call_intrin_with_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: !llvm.ptr):
    %22 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %23 = "llvm.mlir.constant"() <{value = 16 : i32}> : () -> i32
    "llvm.call_intrinsic"(%22, %arg18, %23) <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.assume", op_bundle_sizes = array<i32: 2>, op_bundle_tags = ["align"], operandSegmentSizes = array<i32: 1, 2>}> : (i1, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_assume_intr_no_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: !llvm.ptr):
    %21 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    "llvm.intr.assume"(%21) <{op_bundle_sizes = array<i32>}> : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_assume_intr_empty_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: !llvm.ptr):
    %20 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    "llvm.intr.assume"(%20) <{op_bundle_sizes = array<i32>}> : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_assume_intr_with_opbundles", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: !llvm.ptr):
    %16 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %17 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %18 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %19 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    "llvm.intr.assume"(%16, %17, %18, %19) <{op_bundle_sizes = array<i32: 2, 1>, op_bundle_tags = ["tag1", "tag2"]}> : (i1, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "somefunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_call_arg_attrs_direct", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: i32, %arg14: !llvm.ptr):
    "llvm.call"(%arg13, %arg14) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{}, {llvm.byval = i64}], callee = @somefunc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (i16, ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_call_arg_attrs_indirect", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: i16, %arg12: !llvm.ptr):
    %15 = "llvm.call"(%arg12, %arg11) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<tail>, arg_attrs = [{llvm.noundef, llvm.signext}], fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>, res_attrs = [{llvm.signext}]}> : (!llvm.ptr, i16) -> i16
    "llvm.return"(%15) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i16)>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_arg_attrs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: i16):
    "llvm.invoke"(%arg10)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef, llvm.signext}], callee = @somefunc, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (i16) -> ()
  ^bb1:  // pred: ^bb0
    %14 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (i16, ptr)>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_arg_attrs_indirect", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: i16, %arg9: !llvm.ptr):
    %12 = "llvm.invoke"(%arg9, %arg8)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef, llvm.signext}], op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0, 0, 0>, res_attrs = [{llvm.signext}]}> : (!llvm.ptr, i16) -> i16
  ^bb1:  // pred: ^bb0
    %13 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"(%12) : (i16) -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"(%12) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "intrinsic_call_arg_attrs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: i32):
    %11 = "llvm.call_intrinsic"(%arg7) <{arg_attrs = [{llvm.signext}], fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.riscv.sha256sig0", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> i32
    "llvm.return"(%11) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "intrinsic_call_arg_attrs_bundles", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: i32):
    %10 = "llvm.call_intrinsic"(%arg6) <{arg_attrs = [{llvm.signext}], fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.riscv.sha256sig0", op_bundle_sizes = array<i32: 0>, op_bundle_tags = ["adazdazd"], operandSegmentSizes = array<i32: 1, 0>}> {constant} : (i32) -> i32
    "llvm.return"(%10) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "constrained_fp_metadata", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: f32, %arg5: f32):
    %7 = "llvm.mlir.metadata_as_value"() <{metadata = #llvm.md_string<"round.tonearest">}> : () -> !llvm.metadata
    %8 = "llvm.mlir.metadata_as_value"() <{metadata = #llvm.md_string<"fpexcept.strict">}> : () -> !llvm.metadata
    %9 = "llvm.call_intrinsic"(%arg4, %arg5, %7, %8) <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.experimental.constrained.fadd.f32", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 4, 0>}> : (f32, f32, !llvm.metadata, !llvm.metadata) -> f32
    "llvm.return"(%9) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "metadata_as_value_shapes", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.metadata_as_value"() <{metadata = #llvm.md_string<"sp">}> : () -> !llvm.metadata
    %4 = "llvm.mlir.metadata_as_value"() <{metadata = #llvm.md_const<42 : i32>}> : () -> !llvm.metadata
    %5 = "llvm.mlir.metadata_as_value"() <{metadata = #llvm.md_func<@md_kernel>}> : () -> !llvm.metadata
    %6 = "llvm.mlir.metadata_as_value"() <{metadata = #llvm.md_node<#llvm.md_string<"sp">>}> : () -> !llvm.metadata
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = !llvm.ptr, linkage = #llvm.linkage<private>, sym_name = "blockaddr_global", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.blockaddress"() <{block_addr = #llvm.blockaddress<function = @blockaddr_fn, tag = <id = 0>>}> : () -> !llvm.ptr
    "llvm.return"(%2) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "blockaddr_fn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "llvm.blocktag"() <{tag = #llvm.blocktag<id = 0>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xi8>, vector<8xi8>, vector<8xi8>, ptr)>, linkage = #llvm.linkage<external>, sym_name = "callintrin_voidret", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<8xi8>, %arg1: vector<8xi8>, %arg2: vector<8xi8>, %arg3: !llvm.ptr):
    "llvm.call_intrinsic"(%arg0, %arg1, %arg2, %arg3) <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.aarch64.neon.st3.v8i8.p0", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 4, 0>}> : (vector<8xi8>, vector<8xi8>, vector<8xi8>, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xi8>, vector<8xi8>, vector<8xi8>, ptr)>, linkage = #llvm.linkage<external>, sym_name = "llvm.aarch64.neon.st3.v8i8.p0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, alignment = 4 : i64, dso_local, global_type = i32, linkage = #llvm.linkage<internal>, sym_name = "myglobal", thread_local_, unnamed_addr = 2 : i64, value = -1 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "escapedtypename", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "llvm.alloca"(%0) <{alignment = 8 : i64, elem_type = !llvm.struct<"bucket<string, double, '\\b'>::Iterator", (ptr, i64, i64)>}> : (i32) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "md_kernel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.named_metadata"() <{metadata_name = "foo.version", nodes = [#llvm.md_node<#llvm.md_const<1 : i32>, #llvm.md_const<0 : i32>, #llvm.md_const<0 : i32>>]}> : () -> ()
  "llvm.named_metadata"() <{metadata_name = "foo.language", nodes = [#llvm.md_node<#llvm.md_string<"Bar">, #llvm.md_const<1 : i32>, #llvm.md_const<2 : i32>>]}> : () -> ()
  "llvm.named_metadata"() <{metadata_name = "foo.kernel", nodes = [#llvm.md_node<#llvm.md_func<@md_kernel>, #llvm.md_node<>, #llvm.md_node<#llvm.md_const<0 : i32>, #llvm.md_string<"foo.buffer">>>]}> : () -> ()
}) : () -> ()

