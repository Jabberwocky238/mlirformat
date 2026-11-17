"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "clusterlaunchcontrol_try_cancel", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr<3> loc("<stdin>":3:8), %arg7: !llvm.ptr<3> loc("<stdin>":3:29)):
    "nvvm.clusterlaunchcontrol.try.cancel"(%arg6, %arg7) : (!llvm.ptr<3>, !llvm.ptr<3>) -> () loc("<stdin>":4:5)
    "llvm.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "clusterlaunchcontrol_try_cancel_multicast", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<3> loc("<stdin>":8:8), %arg5: !llvm.ptr<3> loc("<stdin>":8:29)):
    "nvvm.clusterlaunchcontrol.try.cancel"(%arg4, %arg5) <{multicast}> : (!llvm.ptr<3>, !llvm.ptr<3>) -> () loc("<stdin>":9:5)
    "llvm.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i128)>, linkage = #llvm.linkage<external>, sym_name = "clusterlaunchcontrol_query_cancel_is_canceled", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: i128 loc("<stdin>":13:8)):
    %3 = "nvvm.clusterlaunchcontrol.query.cancel"(%arg3) <{query_type = #nvvm<cluster_launch_control_query_type is_canceled>}> : (i128) -> i1 loc("<stdin>":14:10)
    "llvm.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i128)>, linkage = #llvm.linkage<external>, sym_name = "clusterlaunchcontrol_query_cancel_get_first_cta_id_x", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i128 loc("<stdin>":18:8)):
    %2 = "nvvm.clusterlaunchcontrol.query.cancel"(%arg2) <{query_type = #nvvm<cluster_launch_control_query_type get_first_cta_id_x>}> : (i128) -> i32 loc("<stdin>":19:10)
    "llvm.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i128)>, linkage = #llvm.linkage<external>, sym_name = "clusterlaunchcontrol_query_cancel_get_first_cta_id_y", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: i128 loc("<stdin>":23:8)):
    %1 = "nvvm.clusterlaunchcontrol.query.cancel"(%arg1) <{query_type = #nvvm<cluster_launch_control_query_type get_first_cta_id_y>}> : (i128) -> i32 loc("<stdin>":24:10)
    "llvm.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i128)>, linkage = #llvm.linkage<external>, sym_name = "clusterlaunchcontrol_query_cancel_get_first_cta_id_z", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i128 loc("<stdin>":28:8)):
    %0 = "nvvm.clusterlaunchcontrol.query.cancel"(%arg0) <{query_type = #nvvm<cluster_launch_control_query_type get_first_cta_id_z>}> : (i128) -> i32 loc("<stdin>":29:10)
    "llvm.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":1:1)
