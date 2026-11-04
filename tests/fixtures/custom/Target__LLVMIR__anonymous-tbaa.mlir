#tbaa_root = #llvm.tbaa_root
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "long long", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module {
  llvm.func @tbaa_anonymous_root(%arg0: !llvm.ptr) {
    %0 = llvm.load %arg0 {tbaa = [#tbaa_tag]} : !llvm.ptr -> i64
    llvm.return
  }
}

