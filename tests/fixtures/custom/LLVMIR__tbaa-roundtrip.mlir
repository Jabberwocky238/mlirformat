#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#tbaa_root1 = #llvm.tbaa_root<id = "Other language TBAA">
#tbaa_root2 = #llvm.tbaa_root
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root1, 0>}>
#tbaa_type_desc2 = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root2, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc, access_type = #tbaa_type_desc, offset = 0>
#tbaa_tag1 = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
#tbaa_tag2 = #llvm.tbaa_tag<base_type = #tbaa_type_desc2, access_type = #tbaa_type_desc2, offset = 0>
#tbaa_type_desc3 = #llvm.tbaa_type_desc<id = "long long", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc4 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_type_desc5 = #llvm.tbaa_type_desc<id = "agg2_t", members = {<#tbaa_type_desc3, 0>, <#tbaa_type_desc3, 8>}>
#tbaa_type_desc6 = #llvm.tbaa_type_desc<id = "agg1_t", members = {<#tbaa_type_desc4, 0>, <#tbaa_type_desc4, 4>}>
#tbaa_tag3 = #llvm.tbaa_tag<base_type = #tbaa_type_desc5, access_type = #tbaa_type_desc3, offset = 8>
#tbaa_tag4 = #llvm.tbaa_tag<base_type = #tbaa_type_desc6, access_type = #tbaa_type_desc4, offset = 0>
module {
  llvm.func @tbaa1(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i8) : i8
    llvm.store %0, %arg0 {tbaa = [#tbaa_tag]} : i8, !llvm.ptr
    llvm.store %0, %arg1 {tbaa = [#tbaa_tag1]} : i8, !llvm.ptr
    llvm.return
  }
  llvm.func @tbaa2(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.getelementptr inbounds %arg1[%0, 1] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.struct<"struct.agg2_t", (i64, i64)>
    %3 = llvm.load %2 {tbaa = [#tbaa_tag3]} : !llvm.ptr -> i64
    %4 = llvm.trunc %3 : i64 to i32
    %5 = llvm.getelementptr inbounds %arg0[%0, 0] : (!llvm.ptr, i32) -> !llvm.ptr, !llvm.struct<"struct.agg1_t", (i32, i32)>
    llvm.store %4, %5 {tbaa = [#tbaa_tag4]} : i32, !llvm.ptr
    llvm.return
  }
  llvm.func @tbaa3(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i8) : i8
    llvm.store %0, %arg0 {tbaa = [#tbaa_tag, #tbaa_tag1]} : i8, !llvm.ptr
    llvm.return
  }
  llvm.func @tbaa4(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i8) : i8
    llvm.store %0, %arg0 {tbaa = [#tbaa_tag2]} : i8, !llvm.ptr
    llvm.return
  }
}

