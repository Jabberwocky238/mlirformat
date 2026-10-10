module attributes {test.name = "Normal function call"} {
  llvm.func @foo(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(2 : i32) : i32
    %1 = llvm.sub %arg0, %0 : i32
    %2 = llvm.call @bar(%arg0, %1) : (i32, i32) -> i32
    llvm.return %2 : i32
  }
  llvm.func @bar(%arg0: i32, %arg1: i32) -> i32 {
    %0 = llvm.add %arg0, %arg1 : i32
    %1 = llvm.call @foo(%0) : (i32) -> i32
    llvm.return %1 : i32
  }
  llvm.func @entry(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(2 : i32) : i32
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = llvm.icmp "sgt" %arg0, %1 : i32
    llvm.cond_br %2, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %3 = llvm.call @foo(%arg0) : (i32) -> i32
    llvm.br ^bb3(%3 : i32)
  ^bb2:  // pred: ^bb0
    %4 = llvm.add %arg0, %0 : i32
    %5 = llvm.call @bar(%arg0, %4) : (i32, i32) -> i32
    llvm.br ^bb3(%5 : i32)
  ^bb3(%6: i32):  // 2 preds: ^bb1, ^bb2
    llvm.return %6 : i32
  }
}

// -----
module attributes {test.name = "Invoke call"} {
  llvm.mlir.global external constant @_ZTIi() {addr_space = 0 : i32} : !llvm.ptr
  llvm.func @foo(i32) -> !llvm.struct<(i32, f64, i32)>
  llvm.func @bar(!llvm.ptr, !llvm.ptr, !llvm.ptr)
  llvm.func @__gxx_personality_v0(...) -> i32
  llvm.func @invokeLandingpad() -> i32 attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(3 : i32) : i32
    %2 = llvm.mlir.constant("\01") : !llvm.array<1 x i8>
    %3 = llvm.mlir.zero : !llvm.ptr
    %4 = llvm.mlir.zero : !llvm.ptr
    %5 = llvm.mlir.addressof @_ZTIi : !llvm.ptr
    %6 = llvm.mlir.constant(1 : i32) : i32
    %7 = llvm.alloca %6 x i8 : (i32) -> !llvm.ptr
    %8 = llvm.invoke @foo(%6) to ^bb2 unwind ^bb1 : (i32) -> !llvm.struct<(i32, f64, i32)>
  ^bb1:  // 2 preds: ^bb0, ^bb3
    %9 = llvm.landingpad cleanup (catch %3 : !llvm.ptr) (catch %5 : !llvm.ptr) (filter %2 : !llvm.array<1 x i8>) : !llvm.struct<(ptr, i32)>
    %10 = llvm.intr.eh.typeid.for %5 : (!llvm.ptr) -> i32
    llvm.resume %9 : !llvm.struct<(ptr, i32)>
  ^bb2:  // 2 preds: ^bb0, ^bb3
    llvm.return %6 : i32
  ^bb3:  // no predecessors
    llvm.invoke @bar(%7, %5, %4) to ^bb2 unwind ^bb1 : (!llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
  ^bb4:  // no predecessors
    llvm.return %0 : i32
  }
}

