#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>, description = "The domain">
#alias_scope_domain1 = #llvm.alias_scope_domain<id = "domainid", description = "The domain">
#alias_scope = #llvm.alias_scope<id = distinct[0]<>, domain = #alias_scope_domain, description = "The domain">
#alias_scope1 = #llvm.alias_scope<id = "stringid", domain = #alias_scope_domain1, description = "The domain">
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "baz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i32, f32, !llvm.ptr, !llvm.ptr, i1, vector<2x!llvm.ptr>) -> (), sym_name = "ops"}> ({
  ^bb0(%arg82: i32, %arg83: f32, %arg84: !llvm.ptr, %arg85: !llvm.ptr, %arg86: i1, %arg87: vector<2x!llvm.ptr>):
    %180 = "llvm.add"(%arg82, %arg82) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %181 = "llvm.sub"(%arg82, %arg82) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %182 = "llvm.mul"(%arg82, %arg82) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %183 = "llvm.udiv"(%arg82, %arg82) : (i32, i32) -> i32
    %184 = "llvm.sdiv"(%arg82, %arg82) : (i32, i32) -> i32
    %185 = "llvm.urem"(%arg82, %arg82) : (i32, i32) -> i32
    %186 = "llvm.srem"(%arg82, %arg82) : (i32, i32) -> i32
    %187 = "llvm.icmp"(%arg82, %arg82) <{predicate = 1 : i64}> : (i32, i32) -> i1
    %188 = "llvm.add"(%187, %187) <{overflowFlags = 0 : i32}> : (i1, i1) -> i1
    %189 = "llvm.icmp"(%arg84, %arg84) <{predicate = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> i1
    %190 = "llvm.add"(%189, %189) <{overflowFlags = 0 : i32}> : (i1, i1) -> i1
    %191 = "llvm.icmp"(%arg87, %arg87) <{predicate = 1 : i64}> : (vector<2x!llvm.ptr>, vector<2x!llvm.ptr>) -> vector<2xi1>
    %192 = "llvm.add"(%191, %191) <{overflowFlags = 0 : i32}> : (vector<2xi1>, vector<2xi1>) -> vector<2xi1>
    %193 = "llvm.add"(%arg82, %arg82) <{overflowFlags = 1 : i32}> : (i32, i32) -> i32
    %194 = "llvm.sub"(%arg82, %arg82) <{overflowFlags = 2 : i32}> : (i32, i32) -> i32
    %195 = "llvm.mul"(%arg82, %arg82) <{overflowFlags = 3 : i32}> : (i32, i32) -> i32
    %196 = "llvm.shl"(%arg82, %arg82) <{overflowFlags = 3 : i32}> : (i32, i32) -> i32
    %197 = "llvm.sdiv"(%arg82, %arg82) <{isExact}> : (i32, i32) -> i32
    %198 = "llvm.udiv"(%arg82, %arg82) <{isExact}> : (i32, i32) -> i32
    %199 = "llvm.ashr"(%arg82, %arg82) <{isExact}> : (i32, i32) -> i32
    %200 = "llvm.lshr"(%arg82, %arg82) <{isExact}> : (i32, i32) -> i32
    %201 = "llvm.or"(%arg82, %arg82) <{isDisjoint}> : (i32, i32) -> i32
    %202 = "llvm.fadd"(%arg83, %arg83) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %203 = "llvm.fsub"(%arg83, %arg83) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %204 = "llvm.fmul"(%arg83, %arg83) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %205 = "llvm.fdiv"(%arg83, %arg83) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %206 = "llvm.frem"(%arg83, %arg83) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %207 = "llvm.alloca"(%arg82) <{elem_type = f64}> : (i32) -> !llvm.ptr
    %208 = "llvm.getelementptr"(%207, %arg82) <{elem_type = f64, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648>}> : (!llvm.ptr, i32) -> !llvm.ptr
    %209 = "llvm.load"(%208) <{ordering = 0 : i64}> : (!llvm.ptr) -> f64
    "llvm.store"(%209, %207) <{ordering = 0 : i64}> : (f64, !llvm.ptr) -> ()
    %210 = "llvm.call"(%arg82) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> !llvm.struct<(i32, f64, i32)>
    %211 = "llvm.extractvalue"(%210) <{position = array<i64: 0>}> : (!llvm.struct<(i32, f64, i32)>) -> i32
    %212 = "llvm.insertvalue"(%210, %211) <{position = array<i64: 2>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    %213 = "llvm.mlir.addressof"() <{global_name = @foo}> : () -> !llvm.ptr
    %214 = "llvm.call"(%213, %arg82) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, i32) -> !llvm.struct<(i32, f64, i32)>
    "llvm.call"(%arg82, %arg82) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @vararg_func, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>, var_callee_type = !llvm.func<void (i32, ...)>}> : (i32, i32) -> ()
    "llvm.call"(%arg82, %arg82) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @vararg_func, fastmathFlags = #llvm.fastmath<fast>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>, var_callee_type = !llvm.func<void (i32, ...)>}> : (i32, i32) -> ()
    %215 = "llvm.mlir.addressof"() <{global_name = @vararg_func}> : () -> !llvm.ptr
    "llvm.call"(%215, %arg82, %arg82) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>, var_callee_type = !llvm.func<void (i32, ...)>}> : (!llvm.ptr, i32, i32) -> ()
    "llvm.call"(%215, %arg82, %arg82) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, fastmathFlags = #llvm.fastmath<fast>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>, var_callee_type = !llvm.func<void (i32, ...)>}> : (!llvm.ptr, i32, i32) -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, convergent, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, no_unwind, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>, will_return}> : () -> ()
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @baz, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> {memory = #llvm.memory_effects<other = none, argMem = read, inaccessibleMem = write, errnoMem = none, targetMem0 = none, targetMem1 = none>} : () -> ()
    "llvm.br"()[^bb1] : () -> ()
  ^bb1:  // pred: ^bb0
    "llvm.cond_br"(%187)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb2:  // pred: ^bb1
    %216 = "llvm.mlir.undef"() : () -> !llvm.struct<(i32, f64, i32)>
    %217 = "llvm.mlir.constant"() <{value = 42 : i64}> : () -> i47
    "llvm.switch"(%180)[^bb3, ^bb4, ^bb5, ^bb6, ^bb6] <{case_operand_segments = array<i32: 0, 0, 0, 0>, case_values = dense<[1, 2, 3, -3]> : vector<4xi32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "llvm.switch"(%180)[^bb7] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb4:  // pred: ^bb2
    "llvm.switch"(%180)[^bb7] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb5:  // pred: ^bb2
    "llvm.switch"(%180)[^bb7] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb6:  // 2 preds: ^bb2, ^bb2
    "llvm.switch"(%180)[^bb7] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i32) -> ()
  ^bb7:  // 4 preds: ^bb3, ^bb4, ^bb5, ^bb6
    %218 = "llvm.select"(%187, %180, %181) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, i32, i32) -> i32
    %219 = "llvm.inttoptr"(%arg82) : (i32) -> !llvm.ptr
    %220 = "llvm.ptrtoint"(%219) : (!llvm.ptr) -> i32
    %221 = "llvm.fpext"(%arg83) : (f32) -> f80
    %222 = "llvm.fpext"(%arg83) : (f32) -> f128
    %223 = "llvm.fneg"(%arg83) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %224 = "llvm.intr.sin"(%arg83) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %225 = "llvm.intr.pow"(%arg83, %arg83) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %226 = "llvm.intr.powi"(%arg83, %arg82) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, i32) -> f32
    %227 = "llvm.intr.bitreverse"(%arg82) : (i32) -> i32
    %228 = "llvm.intr.ctpop"(%arg82) : (i32) -> i32
    %229 = "llvm.intr.round"(%arg83) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    "llvm.intr.memcpy"(%arg84, %arg85, %arg82) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy"(%arg84, %arg85, %arg82) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy.inline"(%arg84, %arg85) <{isVolatile = false, len = 10 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64, ptr)>, linkage = #llvm.linkage<external>, sym_name = "gep", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg79: !llvm.ptr, %arg80: i64, %arg81: !llvm.ptr):
    %173 = "llvm.getelementptr"(%arg79, %arg80) <{elem_type = !llvm.struct<(i32, struct<(i32, f32)>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: -2147483648, 1, 0>}> : (!llvm.ptr, i64) -> !llvm.ptr
    %174 = "llvm.getelementptr"(%arg81, %arg80, %arg80) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %175 = "llvm.getelementptr"(%arg81, %arg80, %arg80) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 7 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %176 = "llvm.getelementptr"(%arg81, %arg80, %arg80) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 3 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %177 = "llvm.getelementptr"(%arg81, %arg80, %arg80) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 2 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %178 = "llvm.getelementptr"(%arg81, %arg80, %arg80) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 6 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    %179 = "llvm.getelementptr"(%arg81, %arg80, %arg80) <{elem_type = !llvm.struct<(array<10 x f32>)>, noWrapFlags = 4 : i32, rawConstantIndices = array<i32: -2147483648, 0, -2147483648>}> : (!llvm.ptr, i64, i64) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, f64, i32)> (i32, ...)>, linkage = #llvm.linkage<external>, sym_name = "vararg_foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(i32, f64, i32)> (i32)>, linkage = #llvm.linkage<external>, sym_name = "foo", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg78: i32):
    %150 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i32
    %151 = "llvm.mlir.constant"() <{value = 3 : i64}> : () -> i32
    %152 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f64}> : () -> f64
    %153 = "llvm.mlir.constant"() <{value = 4.200000e+01 : f64}> : () -> f64
    %154 = "llvm.add"(%150, %151) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %155 = "llvm.mul"(%154, %151) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    %156 = "llvm.fadd"(%152, %153) <{fastmathFlags = #llvm.fastmath<none>}> : (f64, f64) -> f64
    %157 = "llvm.fsub"(%153, %156) <{fastmathFlags = #llvm.fastmath<none>}> : (f64, f64) -> f64
    %158 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i1
    "llvm.cond_br"(%158, %154, %154)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i32, i32) -> ()
  ^bb1(%159: i32):  // pred: ^bb0
    %160 = "llvm.call"(%159) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> !llvm.struct<(i32, f64, i32)>
    %161 = "llvm.extractvalue"(%160) <{position = array<i64: 0>}> : (!llvm.struct<(i32, f64, i32)>) -> i32
    %162 = "llvm.extractvalue"(%160) <{position = array<i64: 1>}> : (!llvm.struct<(i32, f64, i32)>) -> f64
    %163 = "llvm.extractvalue"(%160) <{position = array<i64: 2>}> : (!llvm.struct<(i32, f64, i32)>) -> i32
    %164 = "llvm.mlir.undef"() : () -> !llvm.struct<(i32, f64, i32)>
    %165 = "llvm.insertvalue"(%164, %155) <{position = array<i64: 0>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    %166 = "llvm.insertvalue"(%165, %157) <{position = array<i64: 1>}> : (!llvm.struct<(i32, f64, i32)>, f64) -> !llvm.struct<(i32, f64, i32)>
    %167 = "llvm.insertvalue"(%166, %161) <{position = array<i64: 2>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    "llvm.return"(%167) : (!llvm.struct<(i32, f64, i32)>) -> ()
  ^bb2(%168: i32):  // pred: ^bb0
    %169 = "llvm.mlir.undef"() : () -> !llvm.struct<(i32, f64, i32)>
    %170 = "llvm.insertvalue"(%169, %168) <{position = array<i64: 0>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    %171 = "llvm.insertvalue"(%170, %157) <{position = array<i64: 1>}> : (!llvm.struct<(i32, f64, i32)>, f64) -> !llvm.struct<(i32, f64, i32)>
    %172 = "llvm.insertvalue"(%171, %155) <{position = array<i64: 2>}> : (!llvm.struct<(i32, f64, i32)>, i32) -> !llvm.struct<(i32, f64, i32)>
    "llvm.return"(%172) : (!llvm.struct<(i32, f64, i32)>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i64, vector<4xi32>, vector<4xi64>, !llvm.ptr) -> (), sym_name = "casts"}> ({
  ^bb0(%arg73: i32, %arg74: i64, %arg75: vector<4xi32>, %arg76: vector<4xi64>, %arg77: !llvm.ptr):
    %138 = "llvm.sext"(%arg73) : (i32) -> i56
    %139 = "llvm.zext"(%arg73) : (i32) -> i64
    %140 = "llvm.trunc"(%arg74) <{overflowFlags = 0 : i32}> : (i64) -> i56
    %141 = "llvm.sext"(%arg75) : (vector<4xi32>) -> vector<4xi56>
    %142 = "llvm.zext"(%arg75) : (vector<4xi32>) -> vector<4xi64>
    %143 = "llvm.trunc"(%arg76) <{overflowFlags = 0 : i32}> : (vector<4xi64>) -> vector<4xi56>
    %144 = "llvm.sitofp"(%arg73) : (i32) -> f32
    %145 = "llvm.uitofp"(%arg73) : (i32) -> f32
    %146 = "llvm.fptosi"(%145) : (f32) -> i32
    %147 = "llvm.fptoui"(%145) : (f32) -> i32
    %148 = "llvm.addrspacecast"(%arg77) : (!llvm.ptr) -> !llvm.ptr<2>
    %149 = "llvm.bitcast"(%arg74) : (i64) -> f64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i64, vector<4xi32>, vector<4xi64>, !llvm.ptr) -> (), sym_name = "nneg_casts"}> ({
  ^bb0(%arg68: i32, %arg69: i64, %arg70: vector<4xi32>, %arg71: vector<4xi64>, %arg72: !llvm.ptr):
    %135 = "llvm.zext"(%arg68) <{nonNeg}> : (i32) -> i64
    %136 = "llvm.zext"(%arg70) <{nonNeg}> : (vector<4xi32>) -> vector<4xi64>
    %137 = "llvm.uitofp"(%arg68) <{nonNeg}> : (i32) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i64, vector<4xi32>, vector<4xi64>, !llvm.ptr) -> (), sym_name = "casts_overflow"}> ({
  ^bb0(%arg63: i32, %arg64: i64, %arg65: vector<4xi32>, %arg66: vector<4xi64>, %arg67: !llvm.ptr):
    %130 = "llvm.trunc"(%arg64) <{overflowFlags = 1 : i32}> : (i64) -> i56
    %131 = "llvm.trunc"(%arg64) <{overflowFlags = 2 : i32}> : (i64) -> i56
    %132 = "llvm.trunc"(%arg64) <{overflowFlags = 3 : i32}> : (i64) -> i56
    %133 = "llvm.trunc"(%arg64) <{overflowFlags = 3 : i32}> : (i64) -> i56
    %134 = "llvm.trunc"(%arg66) <{overflowFlags = 1 : i32}> : (vector<4xi64>) -> vector<4xi56>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, i32, f32, vector<2x!llvm.ptr>) -> (), sym_name = "vect"}> ({
  ^bb0(%arg59: vector<4xf32>, %arg60: i32, %arg61: f32, %arg62: vector<2x!llvm.ptr>):
    %125 = "llvm.extractelement"(%arg59, %arg60) : (vector<4xf32>, i32) -> f32
    %126 = "llvm.insertelement"(%arg59, %arg61, %arg60) : (vector<4xf32>, f32, i32) -> vector<4xf32>
    %127 = "llvm.shufflevector"(%arg59, %arg59) <{mask = array<i32: 0, 0, 0, 0, 7>}> : (vector<4xf32>, vector<4xf32>) -> vector<5xf32>
    %128 = "llvm.shufflevector"(%arg62, %arg62) <{mask = array<i32: 1, 0>}> : (vector<2x!llvm.ptr>, vector<2x!llvm.ptr>) -> vector<2x!llvm.ptr>
    %129 = "llvm.mlir.constant"() <{value = dense<1.000000e+00> : vector<4xf32>}> : () -> vector<4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xf32>, i32, f32) -> (), sym_name = "scalable_vect"}> ({
  ^bb0(%arg56: vector<[4]xf32>, %arg57: i32, %arg58: f32):
    %121 = "llvm.extractelement"(%arg56, %arg57) : (vector<[4]xf32>, i32) -> f32
    %122 = "llvm.insertelement"(%arg56, %arg58, %arg57) : (vector<[4]xf32>, f32, i32) -> vector<[4]xf32>
    %123 = "llvm.shufflevector"(%arg56, %arg56) <{mask = array<i32: 0, 0, 0, 0>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    %124 = "llvm.mlir.constant"() <{value = dense<1.000000e+00> : vector<[4]xf32>}> : () -> vector<[4]xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<4xf32>, vector<[4]xf32>) -> (), sym_name = "mixed_vect"}> ({
  ^bb0(%arg53: vector<8xf32>, %arg54: vector<4xf32>, %arg55: vector<[4]xf32>):
    %115 = "llvm.intr.vector.insert"(%arg55, %arg53) <{pos = 0 : i64}> : (vector<[4]xf32>, vector<8xf32>) -> vector<[4]xf32>
    %116 = "llvm.intr.vector.insert"(%arg55, %arg54) <{pos = 0 : i64}> : (vector<[4]xf32>, vector<4xf32>) -> vector<[4]xf32>
    %117 = "llvm.intr.vector.insert"(%116, %arg54) <{pos = 4 : i64}> : (vector<[4]xf32>, vector<4xf32>) -> vector<[4]xf32>
    %118 = "llvm.intr.vector.insert"(%arg53, %arg54) <{pos = 4 : i64}> : (vector<8xf32>, vector<4xf32>) -> vector<8xf32>
    %119 = "llvm.intr.vector.extract"(%117) <{pos = 0 : i64}> : (vector<[4]xf32>) -> vector<8xf32>
    %120 = "llvm.intr.vector.extract"(%arg53) <{pos = 6 : i64}> : (vector<8xf32>) -> vector<2xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xf16>, vector<[4]xf16>) -> (), sym_name = "vector_interleave2"}> ({
  ^bb0(%arg51: vector<[4]xf16>, %arg52: vector<[4]xf16>):
    %114 = "llvm.intr.vector.interleave2"(%arg51, %arg52) : (vector<[4]xf16>, vector<[4]xf16>) -> vector<[8]xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xf16>) -> (), sym_name = "vector_deinterleave2"}> ({
  ^bb0(%arg50: vector<[8]xf16>):
    %113 = "llvm.intr.vector.deinterleave2"(%arg50) : (vector<[8]xf16>) -> !llvm.struct<(vector<[4]xf16>, vector<[4]xf16>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> (), sym_name = "alloca"}> ({
  ^bb0(%arg49: i64):
    %111 = "llvm.alloca"(%arg49) <{elem_type = i32}> : (i64) -> !llvm.ptr
    %112 = "llvm.alloca"(%arg49) <{alignment = 8 : i64, elem_type = i32, inalloca}> : (i64) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "null"}> ({
    %110 = "llvm.mlir.zero"() : () -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "zero"}> ({
    %109 = "llvm.mlir.zero"() : () -> i8
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "atomic_load"}> ({
  ^bb0(%arg48: !llvm.ptr):
    %106 = "llvm.load"(%arg48) <{alignment = 4 : i64, ordering = 2 : i64}> : (!llvm.ptr) -> f32
    %107 = "llvm.load"(%arg48) <{alignment = 16 : i64, ordering = 2 : i64, syncscope = "singlethread", volatile_}> : (!llvm.ptr) -> f32
    %108 = "llvm.load"(%arg48) <{alignment = 4 : i64, ordering = 2 : i64}> : (!llvm.ptr) -> i128
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, i256, !llvm.ptr) -> (), sym_name = "atomic_store"}> ({
  ^bb0(%arg45: f32, %arg46: i256, %arg47: !llvm.ptr):
    "llvm.store"(%arg45, %arg47) <{alignment = 4 : i64, ordering = 2 : i64}> : (f32, !llvm.ptr) -> ()
    "llvm.store"(%arg45, %arg47) <{alignment = 16 : i64, ordering = 2 : i64, syncscope = "singlethread", volatile_}> : (f32, !llvm.ptr) -> ()
    "llvm.store"(%arg46, %arg47) <{alignment = 4 : i64, ordering = 2 : i64}> : (i256, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, f32, vector<2xf16>) -> (), sym_name = "atomicrmw"}> ({
  ^bb0(%arg42: !llvm.ptr, %arg43: f32, %arg44: vector<2xf16>):
    %103 = "llvm.atomicrmw"(%arg42, %arg43) <{bin_op = 11 : i64, ordering = 2 : i64}> : (!llvm.ptr, f32) -> f32
    %104 = "llvm.atomicrmw"(%arg42, %arg43) <{alignment = 16 : i64, bin_op = 12 : i64, ordering = 2 : i64, syncscope = "singlethread", volatile_}> : (!llvm.ptr, f32) -> f32
    %105 = "llvm.atomicrmw"(%arg42, %arg44) <{bin_op = 14 : i64, ordering = 2 : i64}> : (!llvm.ptr, vector<2xf16>) -> vector<2xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, i32, i32) -> (), sym_name = "cmpxchg"}> ({
  ^bb0(%arg39: !llvm.ptr, %arg40: i32, %arg41: i32):
    %101 = "llvm.cmpxchg"(%arg39, %arg40, %arg41) <{failure_ordering = 2 : i64, success_ordering = 6 : i64}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, i1)>
    %102 = "llvm.cmpxchg"(%arg39, %arg40, %arg41) <{alignment = 16 : i64, failure_ordering = 2 : i64, success_ordering = 6 : i64, syncscope = "singlethread", volatile_, weak}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, i1)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> i32, sym_name = "invariant_load"}> ({
  ^bb0(%arg38: !llvm.ptr):
    %100 = "llvm.load"(%arg38) <{alignment = 4 : i64, invariant, ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "func.return"(%100) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> i32, sym_name = "invariant_group_load"}> ({
  ^bb0(%arg37: !llvm.ptr):
    %99 = "llvm.load"(%arg37) <{alignment = 4 : i64, invariantGroup, ordering = 0 : i64}> : (!llvm.ptr) -> i32
    "func.return"(%99) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, !llvm.ptr) -> (), sym_name = "invariant_group_store"}> ({
  ^bb0(%arg35: i32, %arg36: !llvm.ptr):
    "llvm.store"(%arg35, %arg36) <{invariantGroup, ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, constant, global_type = !llvm.ptr, linkage = #llvm.linkage<external>, sym_name = "_ZTIi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "bar", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "invokeLandingpad", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %84 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %85 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %86 = "llvm.mlir.constant"() <{value = "\01"}> : () -> !llvm.array<1 x i8>
    %87 = "llvm.mlir.zero"() : () -> !llvm.ptr
    %88 = "llvm.mlir.addressof"() <{global_name = @_ZTIi}> : () -> !llvm.ptr
    %89 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %90 = "llvm.alloca"(%89) <{elem_type = i8}> : (i32) -> !llvm.ptr
    %91 = "llvm.invoke"(%89)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb1:  // 5 preds: ^bb0, ^bb3, ^bb4, ^bb5, ^bb6
    %92 = "llvm.landingpad"(%87, %88, %86) <{cleanup}> : (!llvm.ptr, !llvm.ptr, !llvm.array<1 x i8>) -> !llvm.struct<(ptr, i32)>
    %93 = "llvm.intr.eh.typeid.for"(%88) : (!llvm.ptr) -> i32
    "llvm.resume"(%92) : (!llvm.struct<(ptr, i32)>) -> ()
  ^bb2:  // 5 preds: ^bb0, ^bb3, ^bb4, ^bb5, ^bb6
    "llvm.return"(%89) : (i32) -> ()
  ^bb3:  // no predecessors
    "llvm.invoke"(%90, %88, %87)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @bar, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0, 0, 0>}> : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
  ^bb4:  // no predecessors
    %94 = "llvm.mlir.addressof"() <{global_name = @foo}> : () -> !llvm.ptr
    %95 = "llvm.invoke"(%94, %89)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0, 0, 0>}> : (!llvm.ptr, i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb5:  // no predecessors
    %96 = "llvm.invoke"(%89, %89)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @vararg_foo, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0, 0, 0>, var_callee_type = !llvm.func<struct<(i32, f64, i32)> (i32, ...)>}> : (i32, i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb6:  // no predecessors
    %97 = "llvm.mlir.addressof"() <{global_name = @vararg_foo}> : () -> !llvm.ptr
    %98 = "llvm.invoke"(%97, %89, %89)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0, 0, 0>, var_callee_type = !llvm.func<struct<(i32, f64, i32)> (i32, ...)>}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb7:  // no predecessors
    "llvm.return"(%84) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "useFreezeOp"}> ({
  ^bb0(%arg34: i32):
    %79 = "llvm.freeze"(%arg34) : (i32) -> i32
    %80 = "llvm.mlir.undef"() : () -> i8
    %81 = "llvm.freeze"(%80) : (i8) -> i8
    %82 = "llvm.mlir.poison"() : () -> i8
    %83 = "llvm.freeze"(%82) : (i8) -> i8
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "useFenceInst"}> ({
    "llvm.fence"() <{ordering = 7 : i64, syncscope = "agent"}> : () -> ()
    "llvm.fence"() <{ordering = 7 : i64, syncscope = ""}> : () -> ()
    "llvm.fence"() <{ordering = 5 : i64}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "useInlineAsm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg33: i32):
    %74 = "llvm.inline_asm"(%arg33) <{asm_string = "bswap $0", constraints = "=r,r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32) -> i8
    %75 = "llvm.inline_asm"(%arg33, %arg33) <{asm_string = "foo", constraints = "bar", tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %76 = "llvm.inline_asm"(%arg33, %arg33) <{asm_string = "foo", constraints = "bar", has_side_effects, tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %77 = "llvm.inline_asm"(%arg33, %arg33) <{asm_string = "foo", constraints = "bar", is_align_stack, tail_call_kind = #llvm.tailcallkind<none>}> : (i32, i32) -> i8
    %78 = "llvm.inline_asm"(%arg33) <{asm_string = "foo", constraints = "=r,=r,r", tail_call_kind = #llvm.tailcallkind<none>}> : (i32) -> !llvm.struct<(i8, i8)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, i32, vector<2xf32>, vector<2xf32>) -> (), sym_name = "fastmathFlags"}> ({
  ^bb0(%arg28: f32, %arg29: f32, %arg30: i32, %arg31: vector<2xf32>, %arg32: vector<2xf32>):
    %54 = "llvm.fadd"(%arg28, %arg29) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %55 = "llvm.fsub"(%arg28, %arg29) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %56 = "llvm.fmul"(%arg28, %arg29) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %57 = "llvm.fdiv"(%arg28, %arg29) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %58 = "llvm.frem"(%arg28, %arg29) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32, f32) -> f32
    %59 = "llvm.fcmp"(%arg28, %arg29) <{fastmathFlags = #llvm.fastmath<fast>, predicate = 1 : i64}> : (f32, f32) -> i1
    %60 = "llvm.add"(%59, %59) <{overflowFlags = 0 : i32}> : (i1, i1) -> i1
    %61 = "llvm.fcmp"(%arg31, %arg32) <{fastmathFlags = #llvm.fastmath<fast>, predicate = 1 : i64}> : (vector<2xf32>, vector<2xf32>) -> vector<2xi1>
    %62 = "llvm.add"(%61, %61) <{overflowFlags = 0 : i32}> : (vector<2xi1>, vector<2xi1>) -> vector<2xi1>
    %63 = "llvm.fneg"(%arg28) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32) -> f32
    %64 = "llvm.call"(%arg30) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @foo, fastmathFlags = #llvm.fastmath<fast>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> !llvm.struct<(i32, f64, i32)>
    %65 = "llvm.fadd"(%arg28, %arg29) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %66 = "llvm.fadd"(%arg28, %arg29) <{fastmathFlags = #llvm.fastmath<nnan, ninf>}> : (f32, f32) -> f32
    %67 = "llvm.fneg"(%arg28) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %68 = "llvm.intr.sin"(%arg28) <{fastmathFlags = #llvm.fastmath<fast>}> : (f32) -> f32
    %69 = "llvm.intr.sin"(%arg28) <{fastmathFlags = #llvm.fastmath<afn>}> : (f32) -> f32
    %70 = "llvm.intr.vector.reduce.fmin"(%arg31) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %71 = "llvm.intr.vector.reduce.fmax"(%arg31) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %72 = "llvm.intr.vector.reduce.fminimum"(%arg31) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    %73 = "llvm.intr.vector.reduce.fmaximum"(%arg31) <{fastmathFlags = #llvm.fastmath<nnan>}> : (vector<2xf32>) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "lifetime", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg27: !llvm.ptr):
    "llvm.intr.lifetime.start"(%arg27) : (!llvm.ptr) -> ()
    "llvm.intr.lifetime.end"(%arg27) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "invariant", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: !llvm.ptr):
    %53 = "llvm.intr.invariant.start"(%arg26) <{size = 1 : i64}> : (!llvm.ptr) -> !llvm.ptr
    "llvm.intr.invariant.end"(%53, %arg26) <{size = 1 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "invariant_group_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg25: !llvm.ptr):
    %51 = "llvm.intr.launder.invariant.group"(%arg25) : (!llvm.ptr) -> !llvm.ptr
    %52 = "llvm.intr.strip.invariant.group"(%arg25) : (!llvm.ptr) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ...)>, linkage = #llvm.linkage<external>, sym_name = "vararg_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg24: i32):
    %47 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %48 = "llvm.alloca"(%47) <{elem_type = !llvm.struct<"struct.va_list_opaque", (ptr)>}> : (i32) -> !llvm.ptr
    "llvm.intr.vastart"(%48) : (!llvm.ptr) -> ()
    %49 = "llvm.alloca"(%47) <{elem_type = !llvm.struct<"struct.va_list_opaque", (ptr)>}> : (i32) -> !llvm.ptr
    "llvm.intr.vacopy"(%49, %48) : (!llvm.ptr, !llvm.ptr) -> ()
    %50 = "llvm.va_arg"(%49) : (!llvm.ptr) -> i32
    "llvm.intr.vaend"(%48) : (!llvm.ptr) -> ()
    "llvm.intr.vaend"(%49) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr)>, linkage = #llvm.linkage<external>, sym_name = "eh_typeid", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: !llvm.ptr):
    %46 = "llvm.intr.eh.typeid.for"(%arg23) : (!llvm.ptr) -> i32
    "llvm.return"(%46) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "stackrestore", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg22: !llvm.ptr):
    "llvm.intr.stackrestore"(%arg22) : (!llvm.ptr) -> ()
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
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f64)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fptrunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg21: f64):
    %41 = "llvm.intr.experimental.constrained.fptrunc"(%arg21) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f64) -> f32
    %42 = "llvm.intr.experimental.constrained.fptrunc"(%arg21) <{fpExceptionBehavior = 1 : i64, roundingmode = 1 : i64}> : (f64) -> f32
    %43 = "llvm.intr.experimental.constrained.fptrunc"(%arg21) <{fpExceptionBehavior = 2 : i64, roundingmode = 2 : i64}> : (f64) -> f32
    %44 = "llvm.intr.experimental.constrained.fptrunc"(%arg21) <{fpExceptionBehavior = 0 : i64, roundingmode = 3 : i64}> : (f64) -> f32
    %45 = "llvm.intr.experimental.constrained.fptrunc"(%arg21) <{fpExceptionBehavior = 0 : i64, roundingmode = 4 : i64}> : (f64) -> f32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "tail_call_target", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_none", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %40 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%40) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_default", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %39 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%39) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_musttail", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %38 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<musttail>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%38) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_tail", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %37 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<tail>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%37) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "test_notail", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %36 = "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<notail>, callee = @tail_call_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> i32
    "llvm.return"(%36) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "vector_predication_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: vector<8xi32>, %arg18: vector<8xi32>, %arg19: vector<8xi1>, %arg20: i32):
    %32 = "llvm.intr.vp.smax"(%arg17, %arg18, %arg19, %arg20) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %33 = "llvm.intr.vp.smin"(%arg17, %arg18, %arg19, %arg20) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %34 = "llvm.intr.vp.umax"(%arg17, %arg18, %arg19, %arg20) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %35 = "llvm.intr.vp.umin"(%arg17, %arg18, %arg19, %arg20) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
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
    %29 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %30 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %31 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    "llvm.call"(%29, %30, %31) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @op_bundle_target, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32: 2, 1>, op_bundle_tags = ["tag1", "tag2"], operandSegmentSizes = array<i32: 0, 3>}> : (i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_with_empty_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %25 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %26 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %27 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    "llvm.invoke"()[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @op_bundle_target, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
  ^bb1:  // pred: ^bb0
    %28 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_with_empty_opbundle_operands", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %21 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %22 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %23 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    "llvm.invoke"()[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @op_bundle_target, op_bundle_sizes = array<i32: 0>, op_bundle_tags = ["tag"], operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> ()
  ^bb1:  // pred: ^bb0
    %24 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_with_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %17 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %18 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %19 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    "llvm.invoke"(%17, %18, %19)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, callee = @op_bundle_target, op_bundle_sizes = array<i32: 2, 1>, op_bundle_tags = ["tag1", "tag2"], operandSegmentSizes = array<i32: 0, 0, 0, 3>}> : (i32, i32, i32) -> ()
  ^bb1:  // pred: ^bb0
    %20 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_call_intrin_with_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: !llvm.ptr):
    %15 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %16 = "llvm.mlir.constant"() <{value = 16 : i32}> : () -> i32
    "llvm.call_intrinsic"(%15, %arg16, %16) <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.assume", op_bundle_sizes = array<i32: 2>, op_bundle_tags = ["align"], operandSegmentSizes = array<i32: 1, 2>}> : (i1, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_assume_intr_no_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: !llvm.ptr):
    %14 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    "llvm.intr.assume"(%14) <{op_bundle_sizes = array<i32>}> : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_assume_intr_empty_opbundle", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: !llvm.ptr):
    %13 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    "llvm.intr.assume"(%13) <{op_bundle_sizes = array<i32>}> : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_assume_intr_with_opbundles", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: !llvm.ptr):
    %9 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %10 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %11 = "llvm.mlir.constant"() <{value = 3 : i32}> : () -> i32
    %12 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32
    "llvm.intr.assume"(%9, %10, %11, %12) <{op_bundle_sizes = array<i32: 2, 1>, op_bundle_tags = ["tag1", "tag2"]}> : (i1, i32, i32, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "somefunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_call_arg_attrs_direct", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: i32, %arg12: !llvm.ptr):
    "llvm.call"(%arg11, %arg12) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, arg_attrs = [{}, {llvm.byval = i64}], callee = @somefunc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (i16, ptr)>, linkage = #llvm.linkage<external>, sym_name = "test_call_arg_attrs_indirect", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: i16, %arg10: !llvm.ptr):
    %8 = "llvm.call"(%arg10, %arg9) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<tail>, arg_attrs = [{llvm.noundef, llvm.signext}], fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>, res_attrs = [{llvm.signext}]}> : (!llvm.ptr, i16) -> i16
    "llvm.return"(%8) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i16)>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_arg_attrs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: i16):
    "llvm.invoke"(%arg8)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef, llvm.signext}], callee = @somefunc, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (i16) -> ()
  ^bb1:  // pred: ^bb0
    %7 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (i16, ptr)>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_invoke_arg_attrs_indirect", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: i16, %arg7: !llvm.ptr):
    %5 = "llvm.invoke"(%arg7, %arg6)[^bb2, ^bb1] <{CConv = #llvm.cconv<ccc>, arg_attrs = [{llvm.noundef, llvm.signext}], op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0, 0, 0>, res_attrs = [{llvm.signext}]}> : (!llvm.ptr, i16) -> i16
  ^bb1:  // pred: ^bb0
    %6 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)>
    "llvm.return"(%5) : (i16) -> ()
  ^bb2:  // pred: ^bb0
    "llvm.return"(%5) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "intrinsic_call_arg_attrs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: i32):
    %4 = "llvm.call_intrinsic"(%arg5) <{arg_attrs = [{llvm.signext}], fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.riscv.sha256sig0", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (i32) -> i32
    "llvm.return"(%4) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (i32)>, linkage = #llvm.linkage<external>, sym_name = "intrinsic_call_arg_attrs_bundles", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: i32):
    %3 = "llvm.call_intrinsic"(%arg4) <{arg_attrs = [{llvm.signext}], fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.riscv.sha256sig0", op_bundle_sizes = array<i32: 0>, op_bundle_tags = ["adazdazd"], operandSegmentSizes = array<i32: 1, 0>}> {constant} : (i32) -> i32
    "llvm.return"(%3) : (i32) -> ()
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
}) : () -> ()

