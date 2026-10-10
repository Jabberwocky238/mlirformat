#alias_scope_domain = #llvm.alias_scope_domain<id = distinct[0]<>, description = "The domain">
#alias_scope_domain1 = #llvm.alias_scope_domain<id = "domainid", description = "The domain">
#alias_scope = #llvm.alias_scope<id = distinct[0]<>, domain = #alias_scope_domain, description = "The domain">
#alias_scope1 = #llvm.alias_scope<id = "stringid", domain = #alias_scope_domain1, description = "The domain">
module {
  llvm.func @baz()
  func.func @ops(%arg0: i32, %arg1: f32, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: i1, %arg5: vector<2x!llvm.ptr>) {
    %0 = llvm.add %arg0, %arg0 : i32
    %1 = llvm.sub %arg0, %arg0 : i32
    %2 = llvm.mul %arg0, %arg0 : i32
    %3 = llvm.udiv %arg0, %arg0 : i32
    %4 = llvm.sdiv %arg0, %arg0 : i32
    %5 = llvm.urem %arg0, %arg0 : i32
    %6 = llvm.srem %arg0, %arg0 : i32
    %7 = llvm.icmp "ne" %arg0, %arg0 : i32
    %8 = llvm.add %7, %7 : i1
    %9 = llvm.icmp "ne" %arg2, %arg2 : !llvm.ptr
    %10 = llvm.add %9, %9 : i1
    %11 = llvm.icmp "ne" %arg5, %arg5 : vector<2x!llvm.ptr>
    %12 = llvm.add %11, %11 : vector<2xi1>
    %13 = llvm.add %arg0, %arg0 overflow<nsw> : i32
    %14 = llvm.sub %arg0, %arg0 overflow<nuw> : i32
    %15 = llvm.mul %arg0, %arg0 overflow<nsw, nuw> : i32
    %16 = llvm.shl %arg0, %arg0 overflow<nsw, nuw> : i32
    %17 = llvm.sdiv exact %arg0, %arg0 : i32
    %18 = llvm.udiv exact %arg0, %arg0 : i32
    %19 = llvm.ashr exact %arg0, %arg0 : i32
    %20 = llvm.lshr exact %arg0, %arg0 : i32
    %21 = llvm.or disjoint %arg0, %arg0 : i32
    %22 = llvm.fadd %arg1, %arg1 : f32
    %23 = llvm.fsub %arg1, %arg1 : f32
    %24 = llvm.fmul %arg1, %arg1 : f32
    %25 = llvm.fdiv %arg1, %arg1 : f32
    %26 = llvm.frem %arg1, %arg1 : f32
    %27 = llvm.alloca %arg0 x f64 : (i32) -> !llvm.ptr
    %28 = llvm.getelementptr %27[%arg0] : (!llvm.ptr, i32) -> !llvm.ptr, f64
    %29 = llvm.load %28 : !llvm.ptr -> f64
    llvm.store %29, %27 : f64, !llvm.ptr
    %30 = llvm.call @foo(%arg0) : (i32) -> !llvm.struct<(i32, f64, i32)>
    %31 = llvm.extractvalue %30[0] : !llvm.struct<(i32, f64, i32)> 
    %32 = llvm.insertvalue %31, %30[2] : !llvm.struct<(i32, f64, i32)> 
    %33 = llvm.mlir.addressof @foo : !llvm.ptr
    %34 = llvm.call %33(%arg0) : !llvm.ptr, (i32) -> !llvm.struct<(i32, f64, i32)>
    llvm.call @vararg_func(%arg0, %arg0) vararg(!llvm.func<void (i32, ...)>) : (i32, i32) -> ()
    llvm.call @vararg_func(%arg0, %arg0) vararg(!llvm.func<void (i32, ...)>) {fastmathFlags = #llvm.fastmath<fast>} : (i32, i32) -> ()
    %35 = llvm.mlir.addressof @vararg_func : !llvm.ptr
    llvm.call %35(%arg0, %arg0) vararg(!llvm.func<void (i32, ...)>) : !llvm.ptr, (i32, i32) -> ()
    llvm.call %35(%arg0, %arg0) vararg(!llvm.func<void (i32, ...)>) {fastmathFlags = #llvm.fastmath<fast>} : !llvm.ptr, (i32, i32) -> ()
    llvm.call @baz() {convergent} : () -> ()
    llvm.call @baz() {no_unwind} : () -> ()
    llvm.call @baz() {will_return} : () -> ()
    llvm.call @baz() {memory = #llvm.memory_effects<other = none, argMem = read, inaccessibleMem = write, errnoMem = none, targetMem0 = none, targetMem1 = none>} : () -> ()
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.cond_br %7, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %36 = llvm.mlir.undef : !llvm.struct<(i32, f64, i32)>
    %37 = llvm.mlir.constant(42 : i64) : i47
    llvm.switch %0 : i32, ^bb3 [
      1: ^bb4,
      2: ^bb5,
      3: ^bb6,
      -3: ^bb6
    ]
  ^bb3:  // 2 preds: ^bb1, ^bb2
    llvm.switch %0 : i32, ^bb7 [
    ]
  ^bb4:  // pred: ^bb2
    llvm.switch %0 : i32, ^bb7 [
    ]
  ^bb5:  // pred: ^bb2
    llvm.switch %0 : i32, ^bb7 [
    ]
  ^bb6:  // 2 preds: ^bb2, ^bb2
    llvm.switch %0 : i32, ^bb7 [
    ]
  ^bb7:  // 4 preds: ^bb3, ^bb4, ^bb5, ^bb6
    %38 = llvm.select %7, %0, %1 : i1, i32
    %39 = llvm.inttoptr %arg0 : i32 to !llvm.ptr
    %40 = llvm.ptrtoint %39 : !llvm.ptr to i32
    %41 = llvm.fpext %arg1 : f32 to f80
    %42 = llvm.fpext %arg1 : f32 to f128
    %43 = llvm.fneg %arg1 : f32
    %44 = llvm.intr.sin(%arg1) : (f32) -> f32
    %45 = llvm.intr.pow(%arg1, %arg1) : (f32, f32) -> f32
    %46 = llvm.intr.powi(%arg1, %arg0) : (f32, i32) -> f32
    %47 = llvm.intr.bitreverse(%arg0) : (i32) -> i32
    %48 = llvm.intr.ctpop(%arg0) : (i32) -> i32
    %49 = llvm.intr.round(%arg1) : (f32) -> f32
    "llvm.intr.memcpy"(%arg2, %arg3, %arg0) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy"(%arg2, %arg3, %arg0) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy.inline"(%arg2, %arg3) <{isVolatile = false, len = 10 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @gep(%arg0: !llvm.ptr, %arg1: i64, %arg2: !llvm.ptr) {
    %0 = llvm.getelementptr %arg0[%arg1, 1, 0] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.struct<(i32, struct<(i32, f32)>)>
    %1 = llvm.getelementptr inbounds %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    %2 = llvm.getelementptr inbounds|nuw %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    %3 = llvm.getelementptr inbounds %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    %4 = llvm.getelementptr nusw %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    %5 = llvm.getelementptr nusw|nuw %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    %6 = llvm.getelementptr nuw %arg2[%arg1, 0, %arg1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.struct<(array<10 x f32>)>
    llvm.return
  }
  llvm.func @vararg_foo(i32, ...) -> !llvm.struct<(i32, f64, i32)>
  llvm.func @foo(%arg0: i32) -> !llvm.struct<(i32, f64, i32)> {
    %0 = llvm.mlir.constant(3 : i64) : i32
    %1 = llvm.mlir.constant(3 : i64) : i32
    %2 = llvm.mlir.constant(4.200000e+01 : f64) : f64
    %3 = llvm.mlir.constant(4.200000e+01 : f64) : f64
    %4 = llvm.add %0, %1 : i32
    %5 = llvm.mul %4, %1 : i32
    %6 = llvm.fadd %2, %3 : f64
    %7 = llvm.fsub %3, %6 : f64
    %8 = llvm.mlir.constant(1 : i64) : i1
    llvm.cond_br %8, ^bb1(%4 : i32), ^bb2(%4 : i32)
  ^bb1(%9: i32):  // pred: ^bb0
    %10 = llvm.call @foo(%9) : (i32) -> !llvm.struct<(i32, f64, i32)>
    %11 = llvm.extractvalue %10[0] : !llvm.struct<(i32, f64, i32)> 
    %12 = llvm.extractvalue %10[1] : !llvm.struct<(i32, f64, i32)> 
    %13 = llvm.extractvalue %10[2] : !llvm.struct<(i32, f64, i32)> 
    %14 = llvm.mlir.undef : !llvm.struct<(i32, f64, i32)>
    %15 = llvm.insertvalue %5, %14[0] : !llvm.struct<(i32, f64, i32)> 
    %16 = llvm.insertvalue %7, %15[1] : !llvm.struct<(i32, f64, i32)> 
    %17 = llvm.insertvalue %11, %16[2] : !llvm.struct<(i32, f64, i32)> 
    llvm.return %17 : !llvm.struct<(i32, f64, i32)>
  ^bb2(%18: i32):  // pred: ^bb0
    %19 = llvm.mlir.undef : !llvm.struct<(i32, f64, i32)>
    %20 = llvm.insertvalue %18, %19[0] : !llvm.struct<(i32, f64, i32)> 
    %21 = llvm.insertvalue %7, %20[1] : !llvm.struct<(i32, f64, i32)> 
    %22 = llvm.insertvalue %5, %21[2] : !llvm.struct<(i32, f64, i32)> 
    llvm.return %22 : !llvm.struct<(i32, f64, i32)>
  }
  func.func @casts(%arg0: i32, %arg1: i64, %arg2: vector<4xi32>, %arg3: vector<4xi64>, %arg4: !llvm.ptr) {
    %0 = llvm.sext %arg0 : i32 to i56
    %1 = llvm.zext %arg0 : i32 to i64
    %2 = llvm.trunc %arg1 : i64 to i56
    %3 = llvm.sext %arg2 : vector<4xi32> to vector<4xi56>
    %4 = llvm.zext %arg2 : vector<4xi32> to vector<4xi64>
    %5 = llvm.trunc %arg3 : vector<4xi64> to vector<4xi56>
    %6 = llvm.sitofp %arg0 : i32 to f32
    %7 = llvm.uitofp %arg0 : i32 to f32
    %8 = llvm.fptosi %7 : f32 to i32
    %9 = llvm.fptoui %7 : f32 to i32
    %10 = llvm.addrspacecast %arg4 : !llvm.ptr to !llvm.ptr<2>
    %11 = llvm.bitcast %arg1 : i64 to f64
    llvm.return
  }
  func.func @nneg_casts(%arg0: i32, %arg1: i64, %arg2: vector<4xi32>, %arg3: vector<4xi64>, %arg4: !llvm.ptr) {
    %0 = llvm.zext nneg %arg0 : i32 to i64
    %1 = llvm.zext nneg %arg2 : vector<4xi32> to vector<4xi64>
    %2 = llvm.uitofp nneg %arg0 : i32 to f32
    llvm.return
  }
  func.func @casts_overflow(%arg0: i32, %arg1: i64, %arg2: vector<4xi32>, %arg3: vector<4xi64>, %arg4: !llvm.ptr) {
    %0 = llvm.trunc %arg1 overflow<nsw> : i64 to i56
    %1 = llvm.trunc %arg1 overflow<nuw> : i64 to i56
    %2 = llvm.trunc %arg1 overflow<nsw, nuw> : i64 to i56
    %3 = llvm.trunc %arg1 overflow<nsw, nuw> : i64 to i56
    %4 = llvm.trunc %arg3 overflow<nsw> : vector<4xi64> to vector<4xi56>
    llvm.return
  }
  func.func @vect(%arg0: vector<4xf32>, %arg1: i32, %arg2: f32, %arg3: vector<2x!llvm.ptr>) {
    %0 = llvm.extractelement %arg0[%arg1 : i32] : vector<4xf32>
    %1 = llvm.insertelement %arg2, %arg0[%arg1 : i32] : vector<4xf32>
    %2 = llvm.shufflevector %arg0, %arg0 [0, 0, 0, 0, 7] : vector<4xf32> 
    %3 = llvm.shufflevector %arg3, %arg3 [1, 0] : vector<2x!llvm.ptr> 
    %4 = llvm.mlir.constant(dense<1.000000e+00> : vector<4xf32>) : vector<4xf32>
    return
  }
  func.func @scalable_vect(%arg0: vector<[4]xf32>, %arg1: i32, %arg2: f32) {
    %0 = llvm.extractelement %arg0[%arg1 : i32] : vector<[4]xf32>
    %1 = llvm.insertelement %arg2, %arg0[%arg1 : i32] : vector<[4]xf32>
    %2 = llvm.shufflevector %arg0, %arg0 [0, 0, 0, 0] : vector<[4]xf32> 
    %3 = llvm.mlir.constant(dense<1.000000e+00> : vector<[4]xf32>) : vector<[4]xf32>
    return
  }
  func.func @mixed_vect(%arg0: vector<8xf32>, %arg1: vector<4xf32>, %arg2: vector<[4]xf32>) {
    %0 = llvm.intr.vector.insert %arg0, %arg2[0] : vector<8xf32> into vector<[4]xf32>
    %1 = llvm.intr.vector.insert %arg1, %arg2[0] : vector<4xf32> into vector<[4]xf32>
    %2 = llvm.intr.vector.insert %arg1, %1[4] : vector<4xf32> into vector<[4]xf32>
    %3 = llvm.intr.vector.insert %arg1, %arg0[4] : vector<4xf32> into vector<8xf32>
    %4 = llvm.intr.vector.extract %2[0] : vector<8xf32> from vector<[4]xf32>
    %5 = llvm.intr.vector.extract %arg0[6] : vector<2xf32> from vector<8xf32>
    return
  }
  func.func @vector_interleave2(%arg0: vector<[4]xf16>, %arg1: vector<[4]xf16>) {
    %0 = "llvm.intr.vector.interleave2"(%arg0, %arg1) : (vector<[4]xf16>, vector<[4]xf16>) -> vector<[8]xf16>
    return
  }
  func.func @vector_deinterleave2(%arg0: vector<[8]xf16>) {
    %0 = "llvm.intr.vector.deinterleave2"(%arg0) : (vector<[8]xf16>) -> !llvm.struct<(vector<[4]xf16>, vector<[4]xf16>)>
    return
  }
  func.func @alloca(%arg0: i64) {
    %0 = llvm.alloca %arg0 x i32 : (i64) -> !llvm.ptr
    %1 = llvm.alloca inalloca %arg0 x i32 {alignment = 8 : i64} : (i64) -> !llvm.ptr
    llvm.return
  }
  func.func @null() {
    %0 = llvm.mlir.zero : !llvm.ptr
    llvm.return
  }
  func.func @zero() {
    %0 = llvm.mlir.zero : i8
    llvm.return
  }
  func.func @atomic_load(%arg0: !llvm.ptr) {
    %0 = llvm.load %arg0 atomic monotonic {alignment = 4 : i64} : !llvm.ptr -> f32
    %1 = llvm.load volatile %arg0 atomic syncscope("singlethread") monotonic {alignment = 16 : i64} : !llvm.ptr -> f32
    %2 = llvm.load %arg0 atomic monotonic {alignment = 4 : i64} : !llvm.ptr -> i128
    llvm.return
  }
  func.func @atomic_store(%arg0: f32, %arg1: i256, %arg2: !llvm.ptr) {
    llvm.store %arg0, %arg2 atomic monotonic {alignment = 4 : i64} : f32, !llvm.ptr
    llvm.store volatile %arg0, %arg2 atomic syncscope("singlethread") monotonic {alignment = 16 : i64} : f32, !llvm.ptr
    llvm.store %arg1, %arg2 atomic monotonic {alignment = 4 : i64} : i256, !llvm.ptr
    llvm.return
  }
  func.func @atomicrmw(%arg0: !llvm.ptr, %arg1: f32, %arg2: vector<2xf16>) {
    %0 = llvm.atomicrmw fadd %arg0, %arg1 monotonic : !llvm.ptr, f32
    %1 = llvm.atomicrmw volatile fsub %arg0, %arg1 syncscope("singlethread") monotonic {alignment = 16 : i64} : !llvm.ptr, f32
    %2 = llvm.atomicrmw fmin %arg0, %arg2 monotonic : !llvm.ptr, vector<2xf16>
    llvm.return
  }
  func.func @cmpxchg(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32) {
    %0 = llvm.cmpxchg %arg0, %arg1, %arg2 acq_rel monotonic : !llvm.ptr, i32
    %1 = llvm.cmpxchg weak volatile %arg0, %arg1, %arg2 syncscope("singlethread") acq_rel monotonic {alignment = 16 : i64} : !llvm.ptr, i32
    llvm.return
  }
  func.func @invariant_load(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.load %arg0 invariant {alignment = 4 : i64} : !llvm.ptr -> i32
    return %0 : i32
  }
  func.func @invariant_group_load(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.load %arg0 invariant_group {alignment = 4 : i64} : !llvm.ptr -> i32
    return %0 : i32
  }
  func.func @invariant_group_store(%arg0: i32, %arg1: !llvm.ptr) {
    llvm.store %arg0, %arg1 invariant_group : i32, !llvm.ptr
    return
  }
  llvm.mlir.global external constant @_ZTIi() {addr_space = 0 : i32} : !llvm.ptr
  llvm.func @bar(!llvm.ptr, !llvm.ptr, !llvm.ptr)
  llvm.func @__gxx_personality_v0(...) -> i32
  llvm.func @invokeLandingpad() -> i32 attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(3 : i32) : i32
    %2 = llvm.mlir.constant("\01") : !llvm.array<1 x i8>
    %3 = llvm.mlir.zero : !llvm.ptr
    %4 = llvm.mlir.addressof @_ZTIi : !llvm.ptr
    %5 = llvm.mlir.constant(1 : i32) : i32
    %6 = llvm.alloca %5 x i8 : (i32) -> !llvm.ptr
    %7 = llvm.invoke @foo(%5) to ^bb2 unwind ^bb1 : (i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb1:  // 5 preds: ^bb0, ^bb3, ^bb4, ^bb5, ^bb6
    %8 = llvm.landingpad cleanup (catch %3 : !llvm.ptr) (catch %4 : !llvm.ptr) (filter %2 : !llvm.array<1 x i8>) : !llvm.struct<(ptr, i32)>
    %9 = llvm.intr.eh.typeid.for %4 : (!llvm.ptr) -> i32
    llvm.resume %8 : !llvm.struct<(ptr, i32)>
  ^bb2:  // 5 preds: ^bb0, ^bb3, ^bb4, ^bb5, ^bb6
    llvm.return %5 : i32
  ^bb3:  // no predecessors
    llvm.invoke @bar(%6, %4, %3) to ^bb2 unwind ^bb1 : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
  ^bb4:  // no predecessors
    %10 = llvm.mlir.addressof @foo : !llvm.ptr
    %11 = llvm.invoke %10(%5) to ^bb2 unwind ^bb1 : !llvm.ptr, (i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb5:  // no predecessors
    %12 = llvm.invoke @vararg_foo(%5, %5) to ^bb2 unwind ^bb1 vararg(!llvm.func<struct<(i32, f64, i32)> (i32, ...)>) : (i32, i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb6:  // no predecessors
    %13 = llvm.mlir.addressof @vararg_foo : !llvm.ptr
    %14 = llvm.invoke %13(%5, %5) to ^bb2 unwind ^bb1 vararg(!llvm.func<struct<(i32, f64, i32)> (i32, ...)>) : !llvm.ptr, (i32, i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb7:  // no predecessors
    llvm.return %0 : i32
  }
  func.func @useFreezeOp(%arg0: i32) {
    %0 = llvm.freeze %arg0 : i32
    %1 = llvm.mlir.undef : i8
    %2 = llvm.freeze %1 : i8
    %3 = llvm.mlir.poison : i8
    %4 = llvm.freeze %3 : i8
    return
  }
  func.func @useFenceInst() {
    llvm.fence syncscope("agent") seq_cst
    llvm.fence syncscope("") seq_cst
    llvm.fence release
    return
  }
  llvm.func @useInlineAsm(%arg0: i32) {
    %0 = llvm.inline_asm "bswap $0", "=r,r" %arg0 : (i32) -> i8
    %1 = llvm.inline_asm "foo", "bar" %arg0, %arg0 : (i32, i32) -> i8
    %2 = llvm.inline_asm has_side_effects "foo", "bar" %arg0, %arg0 : (i32, i32) -> i8
    %3 = llvm.inline_asm is_align_stack "foo", "bar" %arg0, %arg0 : (i32, i32) -> i8
    %4 = llvm.inline_asm "foo", "=r,=r,r" %arg0 : (i32) -> !llvm.struct<(i8, i8)>
    llvm.return
  }
  func.func @fastmathFlags(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: vector<2xf32>, %arg4: vector<2xf32>) {
    %0 = llvm.fadd %arg0, %arg1 {fastmathFlags = #llvm.fastmath<fast>} : f32
    %1 = llvm.fsub %arg0, %arg1 {fastmathFlags = #llvm.fastmath<fast>} : f32
    %2 = llvm.fmul %arg0, %arg1 {fastmathFlags = #llvm.fastmath<fast>} : f32
    %3 = llvm.fdiv %arg0, %arg1 {fastmathFlags = #llvm.fastmath<fast>} : f32
    %4 = llvm.frem %arg0, %arg1 {fastmathFlags = #llvm.fastmath<fast>} : f32
    %5 = llvm.fcmp "oeq" %arg0, %arg1 {fastmathFlags = #llvm.fastmath<fast>} : f32
    %6 = llvm.add %5, %5 : i1
    %7 = llvm.fcmp "oeq" %arg3, %arg4 {fastmathFlags = #llvm.fastmath<fast>} : vector<2xf32>
    %8 = llvm.add %7, %7 : vector<2xi1>
    %9 = llvm.fneg %arg0 {fastmathFlags = #llvm.fastmath<fast>} : f32
    %10 = llvm.call @foo(%arg2) {fastmathFlags = #llvm.fastmath<fast>} : (i32) -> !llvm.struct<(i32, f64, i32)>
    %11 = llvm.fadd %arg0, %arg1 : f32
    %12 = llvm.fadd %arg0, %arg1 {fastmathFlags = #llvm.fastmath<nnan, ninf>} : f32
    %13 = llvm.fneg %arg0 : f32
    %14 = llvm.intr.sin(%arg0) {fastmathFlags = #llvm.fastmath<fast>} : (f32) -> f32
    %15 = llvm.intr.sin(%arg0) {fastmathFlags = #llvm.fastmath<afn>} : (f32) -> f32
    %16 = llvm.intr.vector.reduce.fmin(%arg3) {fastmathFlags = #llvm.fastmath<nnan>} : (vector<2xf32>) -> f32
    %17 = llvm.intr.vector.reduce.fmax(%arg3) {fastmathFlags = #llvm.fastmath<nnan>} : (vector<2xf32>) -> f32
    %18 = llvm.intr.vector.reduce.fminimum(%arg3) {fastmathFlags = #llvm.fastmath<nnan>} : (vector<2xf32>) -> f32
    %19 = llvm.intr.vector.reduce.fmaximum(%arg3) {fastmathFlags = #llvm.fastmath<nnan>} : (vector<2xf32>) -> f32
    return
  }
  llvm.func @lifetime(%arg0: !llvm.ptr) {
    llvm.intr.lifetime.start %arg0 : !llvm.ptr
    llvm.intr.lifetime.end %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func @invariant(%arg0: !llvm.ptr) {
    %0 = llvm.intr.invariant.start 1, %arg0 : !llvm.ptr
    llvm.intr.invariant.end %0, 1, %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func @invariant_group_intrinsics(%arg0: !llvm.ptr) {
    %0 = llvm.intr.launder.invariant.group %arg0 : !llvm.ptr
    %1 = llvm.intr.strip.invariant.group %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func @vararg_func(%arg0: i32, ...) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"struct.va_list_opaque", (ptr)> : (i32) -> !llvm.ptr
    llvm.intr.vastart %1 : !llvm.ptr
    %2 = llvm.alloca %0 x !llvm.struct<"struct.va_list_opaque", (ptr)> : (i32) -> !llvm.ptr
    llvm.intr.vacopy %1 to %2 : !llvm.ptr, !llvm.ptr
    %3 = llvm.va_arg %2 : (!llvm.ptr) -> i32
    llvm.intr.vaend %1 : !llvm.ptr
    llvm.intr.vaend %2 : !llvm.ptr
    llvm.return
  }
  llvm.func @eh_typeid(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.intr.eh.typeid.for %arg0 : (!llvm.ptr) -> i32
    llvm.return %0 : i32
  }
  llvm.func @stackrestore(%arg0: !llvm.ptr) {
    llvm.intr.stackrestore %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func @experimental_noalias_scope_decl() {
    llvm.intr.experimental.noalias.scope.decl #alias_scope
    llvm.return
  }
  llvm.func @experimental_noalias_scope_with_string_id() {
    llvm.intr.experimental.noalias.scope.decl #alias_scope1
    llvm.return
  }
  llvm.func @experimental_constrained_fptrunc(%arg0: f64) {
    %0 = llvm.intr.experimental.constrained.fptrunc %arg0 towardzero ignore : f64 to f32
    %1 = llvm.intr.experimental.constrained.fptrunc %arg0 tonearest maytrap : f64 to f32
    %2 = llvm.intr.experimental.constrained.fptrunc %arg0 upward strict : f64 to f32
    %3 = llvm.intr.experimental.constrained.fptrunc %arg0 downward ignore : f64 to f32
    %4 = llvm.intr.experimental.constrained.fptrunc %arg0 tonearestaway ignore : f64 to f32
    llvm.return
  }
  llvm.func @tail_call_target() -> i32
  llvm.func @test_none() -> i32 {
    %0 = llvm.call @tail_call_target() : () -> i32
    llvm.return %0 : i32
  }
  llvm.func @test_default() -> i32 {
    %0 = llvm.call @tail_call_target() : () -> i32
    llvm.return %0 : i32
  }
  llvm.func @test_musttail() -> i32 {
    %0 = llvm.call musttail @tail_call_target() : () -> i32
    llvm.return %0 : i32
  }
  llvm.func @test_tail() -> i32 {
    %0 = llvm.call tail @tail_call_target() : () -> i32
    llvm.return %0 : i32
  }
  llvm.func @test_notail() -> i32 {
    %0 = llvm.call notail @tail_call_target() : () -> i32
    llvm.return %0 : i32
  }
  llvm.func @vector_predication_intrinsics(%arg0: vector<8xi32>, %arg1: vector<8xi32>, %arg2: vector<8xi1>, %arg3: i32) {
    %0 = "llvm.intr.vp.smax"(%arg0, %arg1, %arg2, %arg3) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %1 = "llvm.intr.vp.smin"(%arg0, %arg1, %arg2, %arg3) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %2 = "llvm.intr.vp.umax"(%arg0, %arg1, %arg2, %arg3) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %3 = "llvm.intr.vp.umin"(%arg0, %arg1, %arg2, %arg3) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    llvm.return
  }
  llvm.func @op_bundle_target()
  llvm.func @test_call_with_empty_opbundle() {
    llvm.call @op_bundle_target() : () -> ()
    llvm.return
  }
  llvm.func @test_call_with_empty_opbundle_operands() {
    llvm.call @op_bundle_target() ["tag"()] : () -> ()
    llvm.return
  }
  llvm.func @test_call_with_opbundle() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(2 : i32) : i32
    llvm.call @op_bundle_target() ["tag1"(%0, %1 : i32, i32), "tag2"(%2 : i32)] : () -> ()
    llvm.return
  }
  llvm.func @test_invoke_with_empty_opbundle() attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.mlir.constant(3 : i32) : i32
    llvm.invoke @op_bundle_target() to ^bb2 unwind ^bb1 : () -> ()
  ^bb1:  // pred: ^bb0
    %3 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.return
  ^bb2:  // pred: ^bb0
    llvm.return
  }
  llvm.func @test_invoke_with_empty_opbundle_operands() attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.mlir.constant(3 : i32) : i32
    llvm.invoke @op_bundle_target() to ^bb2 unwind ^bb1 ["tag"()] : () -> ()
  ^bb1:  // pred: ^bb0
    %3 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.return
  ^bb2:  // pred: ^bb0
    llvm.return
  }
  llvm.func @test_invoke_with_opbundle() attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.mlir.constant(3 : i32) : i32
    llvm.invoke @op_bundle_target() to ^bb2 unwind ^bb1 ["tag1"(%0, %1 : i32, i32), "tag2"(%2 : i32)] : () -> ()
  ^bb1:  // pred: ^bb0
    %3 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.return
  ^bb2:  // pred: ^bb0
    llvm.return
  }
  llvm.func @test_call_intrin_with_opbundle(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(true) : i1
    %1 = llvm.mlir.constant(16 : i32) : i32
    llvm.call_intrinsic "llvm.assume"(%0) ["align"(%arg0, %1 : !llvm.ptr, i32)] : (i1) -> ()
    llvm.return
  }
  llvm.func @test_assume_intr_no_opbundle(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(true) : i1
    llvm.intr.assume %0 : i1
    llvm.return
  }
  llvm.func @test_assume_intr_empty_opbundle(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(true) : i1
    llvm.intr.assume %0 : i1
    llvm.return
  }
  llvm.func @test_assume_intr_with_opbundles(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(true) : i1
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.mlir.constant(3 : i32) : i32
    %3 = llvm.mlir.constant(4 : i32) : i32
    llvm.intr.assume %0 ["tag1"(%1, %2 : i32, i32), "tag2"(%3 : i32)] : i1
    llvm.return
  }
  llvm.func @somefunc(i32, !llvm.ptr)
  llvm.func @test_call_arg_attrs_direct(%arg0: i32, %arg1: !llvm.ptr) {
    llvm.call @somefunc(%arg0, %arg1) : (i32, !llvm.ptr {llvm.byval = i64}) -> ()
    llvm.return
  }
  llvm.func @test_call_arg_attrs_indirect(%arg0: i16, %arg1: !llvm.ptr) -> i16 {
    %0 = llvm.call tail %arg1(%arg0) : !llvm.ptr, (i16 {llvm.noundef, llvm.signext}) -> (i16 {llvm.signext})
    llvm.return %0 : i16
  }
  llvm.func @test_invoke_arg_attrs(%arg0: i16) attributes {personality = @__gxx_personality_v0} {
    llvm.invoke @somefunc(%arg0) to ^bb2 unwind ^bb1 : (i16 {llvm.noundef, llvm.signext}) -> ()
  ^bb1:  // pred: ^bb0
    %0 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.return
  ^bb2:  // pred: ^bb0
    llvm.return
  }
  llvm.func @test_invoke_arg_attrs_indirect(%arg0: i16, %arg1: !llvm.ptr) -> i16 attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.invoke %arg1(%arg0) to ^bb2 unwind ^bb1 : !llvm.ptr, (i16 {llvm.noundef, llvm.signext}) -> (i16 {llvm.signext})
  ^bb1:  // pred: ^bb0
    %1 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.return %0 : i16
  ^bb2:  // pred: ^bb0
    llvm.return %0 : i16
  }
  llvm.func @intrinsic_call_arg_attrs(%arg0: i32) -> i32 {
    %0 = llvm.call_intrinsic "llvm.riscv.sha256sig0"(%arg0) : (i32 {llvm.signext}) -> i32
    llvm.return %0 : i32
  }
  llvm.func @intrinsic_call_arg_attrs_bundles(%arg0: i32) -> i32 {
    %0 = llvm.call_intrinsic "llvm.riscv.sha256sig0"(%arg0) ["adazdazd"()] {constant} : (i32 {llvm.signext}) -> i32
    llvm.return %0 : i32
  }
  llvm.mlir.global private @blockaddr_global() {addr_space = 0 : i32, dso_local} : !llvm.ptr {
    %0 = llvm.blockaddress <function = @blockaddr_fn, tag = <id = 0>> : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @blockaddr_fn() {
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.blocktag <id = 0>
    llvm.return
  }
  llvm.func @callintrin_voidret(%arg0: vector<8xi8>, %arg1: vector<8xi8>, %arg2: vector<8xi8>, %arg3: !llvm.ptr) {
    llvm.call_intrinsic "llvm.aarch64.neon.st3.v8i8.p0"(%arg0, %arg1, %arg2, %arg3) : (vector<8xi8>, vector<8xi8>, vector<8xi8>, !llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @llvm.aarch64.neon.st3.v8i8.p0(vector<8xi8>, vector<8xi8>, vector<8xi8>, !llvm.ptr)
  llvm.mlir.global internal thread_local unnamed_addr @myglobal(-1 : i32) {addr_space = 0 : i32, alignment = 4 : i64, dso_local} : i32
  llvm.func @escapedtypename() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"bucket<string, double, '\\b'>::Iterator", (ptr, i64, i64)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    llvm.return
  }
}

