module {
  llvm.func @clusterlaunchcontrol_try_cancel(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr<3>) {
    nvvm.clusterlaunchcontrol.try.cancel %arg0, %arg1
    llvm.return
  }
  llvm.func @clusterlaunchcontrol_try_cancel_multicast(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr<3>) {
    nvvm.clusterlaunchcontrol.try.cancel multicast, %arg0, %arg1
    llvm.return
  }
  llvm.func @clusterlaunchcontrol_query_cancel_is_canceled(%arg0: i128) {
    %0 = nvvm.clusterlaunchcontrol.query.cancel query =  is_canceled, %arg0 : i1
    llvm.return
  }
  llvm.func @clusterlaunchcontrol_query_cancel_get_first_cta_id_x(%arg0: i128) {
    %0 = nvvm.clusterlaunchcontrol.query.cancel query =  get_first_cta_id_x, %arg0 : i32
    llvm.return
  }
  llvm.func @clusterlaunchcontrol_query_cancel_get_first_cta_id_y(%arg0: i128) {
    %0 = nvvm.clusterlaunchcontrol.query.cancel query =  get_first_cta_id_y, %arg0 : i32
    llvm.return
  }
  llvm.func @clusterlaunchcontrol_query_cancel_get_first_cta_id_z(%arg0: i128) {
    %0 = nvvm.clusterlaunchcontrol.query.cancel query =  get_first_cta_id_z, %arg0 : i32
    llvm.return
  }
}

