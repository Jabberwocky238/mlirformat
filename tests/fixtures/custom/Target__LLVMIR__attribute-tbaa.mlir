#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "long long", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "agg2_t", members = {<#tbaa_type_desc1, 0>, <#tbaa_type_desc1, 8>}>
#tbaa_type_desc4 = #llvm.tbaa_type_desc<id = "agg1_t", members = {<#tbaa_type_desc2, 0>, <#tbaa_type_desc2, 4>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc3, access_type = #tbaa_type_desc1, offset = 8>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc4, access_type = #tbaa_type_desc2, offset = 0, constant = true>
module {
  llvm.func @tbaa2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.getelementptr inbounds %arg1[%0, 1] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.struct<"struct.agg2_t", (i64, i64)>
    %3 = llvm.load %2 {tbaa = [#tbaa_tag]} : !llvm.ptr -> i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.getelementptr inbounds %arg0[%0, 0] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.struct<"struct.agg1_t", (i32, i32)>
    llvm.store %4, %5 {tbaa = [#tbaa_tag1]} : i32, !llvm.ptr
    llvm.return
  }
}

// -----
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "float", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "agg2_t", members = {<#tbaa_type_desc1, 0>, <#tbaa_type_desc1, 4>}>
#tbaa_type_desc4 = #llvm.tbaa_type_desc<id = "agg1_t", members = {<#tbaa_type_desc2, 0>, <#tbaa_type_desc2, 4>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc3, access_type = #tbaa_type_desc1, offset = 0>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc4, access_type = #tbaa_type_desc2, offset = 0>
module {
  llvm.func @foo(!llvm.ptr)
  llvm.func @tbaa2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.getelementptr inbounds %arg1[%0, 0] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.struct<"struct.agg2_t", (f32, f32)>
    %3 = llvm.load %2 {tbaa = [#tbaa_tag]} : !llvm.ptr -> f32
    %4 = llvm.fptosi %3 : f32 to i32
    %5 = llvm.getelementptr inbounds %arg0[%0, 0] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.struct<"struct.agg1_t", (i32, i32)>
    llvm.store %4, %5 {tbaa = [#tbaa_tag1]} : i32, !llvm.ptr
    %6 = llvm.atomicrmw add %5, %4 monotonic {tbaa = [#tbaa_tag1]} : !llvm.ptr, i32
    %7 = llvm.cmpxchg %5, %6, %4 acq_rel monotonic {tbaa = [#tbaa_tag1]} : !llvm.ptr, i32
    %8 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memcpy"(%arg1, %arg1, %0) <{isVolatile = false, tbaa = [#tbaa_tag1]}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memset"(%arg1, %8, %0) <{isVolatile = false, tbaa = [#tbaa_tag1]}> : (!llvm.ptr, i8, i32) -> ()
    llvm.call @foo(%arg1) {tbaa = [#tbaa_tag1]} : (!llvm.ptr) -> ()
    llvm.return
  }
}

