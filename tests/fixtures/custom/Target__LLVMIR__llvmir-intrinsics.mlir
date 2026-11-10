module {
  llvm.func @intrinsics(%arg0: f32, %arg1: f32, %arg2: vector<8xf32>, %arg3: !llvm.ptr) {
    %0 = llvm.intr.fmuladd(%arg0, %arg1, %arg0) : (f32, f32, f32) -> f32
    %1 = llvm.intr.fmuladd(%arg2, %arg2, %arg2) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    %2 = llvm.intr.fma(%arg0, %arg1, %arg0) : (f32, f32, f32) -> f32
    %3 = llvm.intr.fma(%arg2, %arg2, %arg2) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "llvm.intr.prefetch"(%arg3) <{cache = 1 : i32, hint = 3 : i32, rw = 0 : i32}> : (!llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @fpclass_test(%arg0: f32) -> i1 {
    %0 = "llvm.intr.is.fpclass"(%arg0) <{bit = 0 : i32}> : (f32) -> i1
    llvm.return %0 : i1
  }
  llvm.func @exp_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.exp(%arg0) : (f32) -> f32
    %1 = llvm.intr.exp(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @exp2_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.exp2(%arg0) : (f32) -> f32
    %1 = llvm.intr.exp2(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @exp10_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.exp10(%arg0) : (f32) -> f32
    %1 = llvm.intr.exp10(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @ldexp_test(%arg0: f32, %arg1: vector<8xf32>, %arg2: i32) {
    %0 = llvm.intr.ldexp(%arg0, %arg2) : (f32, i32) -> f32
    %1 = llvm.intr.ldexp(%arg1, %arg2) : (vector<8xf32>, i32) -> vector<8xf32>
    llvm.return
  }
  llvm.func @frexp_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.frexp(%arg0) : (f32) -> !llvm.struct<(f32, i32)>
    %1 = llvm.intr.frexp(%arg1) : (vector<8xf32>) -> !llvm.struct<(vector<8xf32>, i32)>
    llvm.return
  }
  llvm.func @log_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.log(%arg0) : (f32) -> f32
    %1 = llvm.intr.log(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @log10_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.log10(%arg0) : (f32) -> f32
    %1 = llvm.intr.log10(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @log2_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.log2(%arg0) : (f32) -> f32
    %1 = llvm.intr.log2(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @fabs_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.fabs(%arg0) : (f32) -> f32
    %1 = llvm.intr.fabs(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @arithmetic_fence_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.arithmetic.fence(%arg0) : (f32) -> f32
    %1 = llvm.intr.arithmetic.fence(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @sqrt_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.sqrt(%arg0) : (f32) -> f32
    %1 = llvm.intr.sqrt(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @ceil_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.ceil(%arg0) : (f32) -> f32
    %1 = llvm.intr.ceil(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @floor_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.floor(%arg0) : (f32) -> f32
    %1 = llvm.intr.floor(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @trig_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.sin(%arg0) : (f32) -> f32
    %1 = llvm.intr.sin(%arg1) : (vector<8xf32>) -> vector<8xf32>
    %2 = llvm.intr.cos(%arg0) : (f32) -> f32
    %3 = llvm.intr.cos(%arg1) : (vector<8xf32>) -> vector<8xf32>
    %4 = llvm.intr.tan(%arg0) : (f32) -> f32
    %5 = llvm.intr.tan(%arg1) : (vector<8xf32>) -> vector<8xf32>
    %6 = llvm.intr.sincos(%arg0) : (f32) -> !llvm.struct<(f32, f32)>
    %7 = llvm.intr.sincos(%arg1) : (vector<8xf32>) -> !llvm.struct<(vector<8xf32>, vector<8xf32>)>
    llvm.return
  }
  llvm.func @inv_trig_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.asin(%arg0) : (f32) -> f32
    %1 = llvm.intr.asin(%arg1) : (vector<8xf32>) -> vector<8xf32>
    %2 = llvm.intr.acos(%arg0) : (f32) -> f32
    %3 = llvm.intr.acos(%arg1) : (vector<8xf32>) -> vector<8xf32>
    %4 = llvm.intr.atan(%arg0) : (f32) -> f32
    %5 = llvm.intr.atan(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @atan2_test(%arg0: f32, %arg1: f32, %arg2: vector<8xf32>, %arg3: vector<8xf32>) {
    %0 = llvm.intr.atan2(%arg0, %arg1) : (f32, f32) -> f32
    %1 = llvm.intr.atan2(%arg2, %arg3) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @hyperbolic_trig_test(%arg0: f32, %arg1: vector<8xf32>) {
    %0 = llvm.intr.sinh(%arg0) : (f32) -> f32
    %1 = llvm.intr.sinh(%arg1) : (vector<8xf32>) -> vector<8xf32>
    %2 = llvm.intr.cosh(%arg0) : (f32) -> f32
    %3 = llvm.intr.cosh(%arg1) : (vector<8xf32>) -> vector<8xf32>
    %4 = llvm.intr.tanh(%arg0) : (f32) -> f32
    %5 = llvm.intr.tanh(%arg1) : (vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @copysign_test(%arg0: f32, %arg1: f32, %arg2: vector<8xf32>, %arg3: vector<8xf32>) {
    %0 = llvm.intr.copysign(%arg0, %arg1) : (f32, f32) -> f32
    %1 = llvm.intr.copysign(%arg2, %arg3) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @pow_test(%arg0: f32, %arg1: f32, %arg2: vector<8xf32>, %arg3: vector<8xf32>) {
    %0 = llvm.intr.pow(%arg0, %arg1) : (f32, f32) -> f32
    %1 = llvm.intr.pow(%arg2, %arg3) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @rint_test(%arg0: f32, %arg1: f64, %arg2: vector<8xf32>, %arg3: vector<8xf64>) {
    %0 = llvm.intr.rint(%arg0) : (f32) -> f32
    %1 = llvm.intr.rint(%arg1) : (f64) -> f64
    %2 = llvm.intr.rint(%arg2) : (vector<8xf32>) -> vector<8xf32>
    %3 = llvm.intr.rint(%arg3) : (vector<8xf64>) -> vector<8xf64>
    llvm.return
  }
  llvm.func @nearbyint_test(%arg0: f32, %arg1: f64, %arg2: vector<8xf32>, %arg3: vector<8xf64>) {
    %0 = llvm.intr.nearbyint(%arg0) : (f32) -> f32
    %1 = llvm.intr.nearbyint(%arg1) : (f64) -> f64
    %2 = llvm.intr.nearbyint(%arg2) : (vector<8xf32>) -> vector<8xf32>
    %3 = llvm.intr.nearbyint(%arg3) : (vector<8xf64>) -> vector<8xf64>
    llvm.return
  }
  llvm.func @lround_test(%arg0: f32, %arg1: f64, %arg2: vector<2xf32>, %arg3: vector<2xf64>) {
    %0 = llvm.intr.lround(%arg0) : (f32) -> i32
    %1 = llvm.intr.lround(%arg0) : (f32) -> i64
    %2 = llvm.intr.lround(%arg1) : (f64) -> i32
    %3 = llvm.intr.lround(%arg1) : (f64) -> i64
    %4 = llvm.intr.lround(%arg2) : (vector<2xf32>) -> vector<2xi32>
    %5 = llvm.intr.lround(%arg3) : (vector<2xf64>) -> vector<2xi32>
    %6 = llvm.intr.lround(%arg2) : (vector<2xf32>) -> vector<2xi64>
    %7 = llvm.intr.lround(%arg3) : (vector<2xf64>) -> vector<2xi64>
    llvm.return
  }
  llvm.func @llround_test(%arg0: f32, %arg1: f64) {
    %0 = llvm.intr.llround(%arg0) : (f32) -> i64
    %1 = llvm.intr.llround(%arg1) : (f64) -> i64
    llvm.return
  }
  llvm.func @lrint_test(%arg0: f32, %arg1: f64, %arg2: vector<2xf32>, %arg3: vector<2xf64>) {
    %0 = llvm.intr.lrint(%arg0) : (f32) -> i32
    %1 = llvm.intr.lrint(%arg0) : (f32) -> i64
    %2 = llvm.intr.lrint(%arg1) : (f64) -> i32
    %3 = llvm.intr.lrint(%arg1) : (f64) -> i64
    %4 = llvm.intr.lrint(%arg2) : (vector<2xf32>) -> vector<2xi32>
    %5 = llvm.intr.lrint(%arg3) : (vector<2xf64>) -> vector<2xi32>
    %6 = llvm.intr.lrint(%arg2) : (vector<2xf32>) -> vector<2xi64>
    %7 = llvm.intr.lrint(%arg3) : (vector<2xf64>) -> vector<2xi64>
    llvm.return
  }
  llvm.func @llrint_test(%arg0: f32, %arg1: f64, %arg2: vector<2xf32>, %arg3: vector<2xf64>) {
    %0 = llvm.intr.llrint(%arg0) : (f32) -> i64
    %1 = llvm.intr.llrint(%arg1) : (f64) -> i64
    %2 = llvm.intr.llrint(%arg2) : (vector<2xf32>) -> vector<2xi64>
    %3 = llvm.intr.llrint(%arg3) : (vector<2xf64>) -> vector<2xi64>
    llvm.return
  }
  llvm.func @bitreverse_test(%arg0: i32, %arg1: vector<8xi32>) {
    %0 = llvm.intr.bitreverse(%arg0) : (i32) -> i32
    %1 = llvm.intr.bitreverse(%arg1) : (vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @byteswap_test(%arg0: i32, %arg1: vector<8xi32>) {
    %0 = llvm.intr.bswap(%arg0) : (i32) -> i32
    %1 = llvm.intr.bswap(%arg1) : (vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @ctlz_test(%arg0: i32, %arg1: vector<8xi32>) {
    %0 = "llvm.intr.ctlz"(%arg0) <{is_zero_poison = false}> : (i32) -> i32
    %1 = "llvm.intr.ctlz"(%arg1) <{is_zero_poison = true}> : (vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @cttz_test(%arg0: i32, %arg1: vector<8xi32>) {
    %0 = "llvm.intr.cttz"(%arg0) <{is_zero_poison = false}> : (i32) -> i32
    %1 = "llvm.intr.cttz"(%arg1) <{is_zero_poison = true}> : (vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @abs_test(%arg0: i32, %arg1: vector<8xi32>) {
    %0 = "llvm.intr.abs"(%arg0) <{is_int_min_poison = false}> : (i32) -> i32
    %1 = "llvm.intr.abs"(%arg1) <{is_int_min_poison = true}> : (vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @ctpop_test(%arg0: i32, %arg1: vector<8xi32>) {
    %0 = llvm.intr.ctpop(%arg0) : (i32) -> i32
    %1 = llvm.intr.ctpop(%arg1) : (vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @fshl_test(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: vector<8xi32>, %arg4: vector<8xi32>, %arg5: vector<8xi32>) {
    %0 = llvm.intr.fshl(%arg0, %arg1, %arg2) : (i32, i32, i32) -> i32
    %1 = llvm.intr.fshl(%arg3, %arg4, %arg5) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @fshr_test(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: vector<8xi32>, %arg4: vector<8xi32>, %arg5: vector<8xi32>) {
    %0 = llvm.intr.fshr(%arg0, %arg1, %arg2) : (i32, i32, i32) -> i32
    %1 = llvm.intr.fshr(%arg3, %arg4, %arg5) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @maximum_test(%arg0: f32, %arg1: f32, %arg2: vector<8xf32>, %arg3: vector<8xf32>) {
    %0 = llvm.intr.maximum(%arg0, %arg1) : (f32, f32) -> f32
    %1 = llvm.intr.maximum(%arg2, %arg3) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @minimum_test(%arg0: f32, %arg1: f32, %arg2: vector<8xf32>, %arg3: vector<8xf32>) {
    %0 = llvm.intr.minimum(%arg0, %arg1) : (f32, f32) -> f32
    %1 = llvm.intr.minimum(%arg2, %arg3) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @maxnum_test(%arg0: f32, %arg1: f32, %arg2: vector<8xf32>, %arg3: vector<8xf32>) {
    %0 = llvm.intr.maxnum(%arg0, %arg1) : (f32, f32) -> f32
    %1 = llvm.intr.maxnum(%arg2, %arg3) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @minnum_test(%arg0: f32, %arg1: f32, %arg2: vector<8xf32>, %arg3: vector<8xf32>) {
    %0 = llvm.intr.minnum(%arg0, %arg1) : (f32, f32) -> f32
    %1 = llvm.intr.minnum(%arg2, %arg3) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    llvm.return
  }
  llvm.func @smax_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.smax(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.smax(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @smin_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.smin(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.smin(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @umax_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.umax(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.umax(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @umin_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.umin(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.umin(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @fake_use(%arg0: i32, %arg1: !llvm.ptr) {
    llvm.intr.fake.use %arg0 : i32
    llvm.intr.fake.use %arg1 : !llvm.ptr
    llvm.intr.fake.use %arg0, %arg1 : i32, !llvm.ptr
    llvm.return
  }
  llvm.func @assume_without_opbundles(%arg0: i1) {
    llvm.intr.assume %arg0 : i1
    llvm.return
  }
  llvm.func @assume_with_opbundles(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(true) : i1
    %1 = llvm.mlir.constant(8 : i32) : i32
    llvm.intr.assume %0 ["align"(%arg0, %1 : !llvm.ptr, i32)] : i1
    llvm.return
  }
  llvm.func @vector_reductions(%arg0: f32, %arg1: vector<8xf32>, %arg2: vector<8xi32>) {
    %0 = "llvm.intr.vector.reduce.add"(%arg2) : (vector<8xi32>) -> i32
    %1 = "llvm.intr.vector.reduce.and"(%arg2) : (vector<8xi32>) -> i32
    %2 = llvm.intr.vector.reduce.fmax(%arg1) : (vector<8xf32>) -> f32
    %3 = llvm.intr.vector.reduce.fmin(%arg1) : (vector<8xf32>) -> f32
    %4 = llvm.intr.vector.reduce.fmaximum(%arg1) : (vector<8xf32>) -> f32
    %5 = llvm.intr.vector.reduce.fminimum(%arg1) : (vector<8xf32>) -> f32
    %6 = "llvm.intr.vector.reduce.mul"(%arg2) : (vector<8xi32>) -> i32
    %7 = "llvm.intr.vector.reduce.or"(%arg2) : (vector<8xi32>) -> i32
    %8 = "llvm.intr.vector.reduce.smax"(%arg2) : (vector<8xi32>) -> i32
    %9 = "llvm.intr.vector.reduce.smin"(%arg2) : (vector<8xi32>) -> i32
    %10 = "llvm.intr.vector.reduce.umax"(%arg2) : (vector<8xi32>) -> i32
    %11 = "llvm.intr.vector.reduce.umin"(%arg2) : (vector<8xi32>) -> i32
    %12 = "llvm.intr.vector.reduce.fadd"(%arg0, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<8xf32>) -> f32
    %13 = "llvm.intr.vector.reduce.fmul"(%arg0, %arg1) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<8xf32>) -> f32
    %14 = "llvm.intr.vector.reduce.fadd"(%arg0, %arg1) <{fastmathFlags = #llvm.fastmath<reassoc>}> : (f32, vector<8xf32>) -> f32
    %15 = "llvm.intr.vector.reduce.fmul"(%arg0, %arg1) <{fastmathFlags = #llvm.fastmath<reassoc>}> : (f32, vector<8xf32>) -> f32
    %16 = "llvm.intr.vector.reduce.xor"(%arg2) : (vector<8xi32>) -> i32
    llvm.return
  }
  llvm.func @matrix_intrinsics(%arg0: vector<64xf32>, %arg1: vector<48xf32>, %arg2: !llvm.ptr, %arg3: i64) {
    %0 = llvm.intr.matrix.multiply %arg0, %arg1 {lhs_columns = 16 : i32, lhs_rows = 4 : i32, rhs_columns = 3 : i32} : (vector<64xf32>, vector<48xf32>) -> vector<12xf32>
    %1 = llvm.intr.matrix.transpose %arg1 {columns = 16 : i32, rows = 3 : i32} : vector<48xf32> into vector<48xf32>
    %2 = llvm.intr.matrix.column.major.load %arg2, <stride = %arg3> {columns = 16 : i32, isVolatile = false, rows = 3 : i32} : vector<48xf32> from !llvm.ptr stride i64
    llvm.intr.matrix.column.major.store %2, %arg2, <stride = %arg3> {columns = 16 : i32, isVolatile = false, rows = 3 : i32} : vector<48xf32> to !llvm.ptr stride i64
    llvm.return
  }
  llvm.func @get_active_lane_mask(%arg0: i64, %arg1: i64) -> vector<7xi1> {
    %0 = llvm.intr.get.active.lane.mask %arg0, %arg1 : i64, i64 to vector<7xi1>
    llvm.return %0 : vector<7xi1>
  }
  llvm.func @masked_load_store_intrinsics(%arg0: !llvm.ptr, %arg1: vector<7xi1>) {
    %0 = llvm.intr.masked.load %arg0, %arg1 {alignment = 1 : i32} : (!llvm.ptr, vector<7xi1>) -> vector<7xf32>
    %1 = llvm.intr.masked.load %arg0, %arg1 {alignment = 1 : i32, nontemporal} : (!llvm.ptr, vector<7xi1>) -> vector<7xf32>
    %2 = llvm.intr.masked.load %arg0, %arg1, %0 {alignment = 1 : i32} : (!llvm.ptr, vector<7xi1>, vector<7xf32>) -> vector<7xf32>
    llvm.intr.masked.store %1, %arg0, %arg1 {alignment = 1 : i32} : vector<7xf32>, vector<7xi1> into !llvm.ptr
    llvm.intr.masked.store %1, %arg0, %arg1 {alignment = 1 : i32, nontemporal} : vector<7xf32>, vector<7xi1> into !llvm.ptr
    llvm.return
  }
  llvm.func @masked_gather_scatter_intrinsics(%arg0: vector<7x!llvm.ptr>, %arg1: vector<7xi1>) {
    %0 = llvm.intr.masked.gather %arg0, %arg1 {alignment = 1 : i32} : (vector<7x!llvm.ptr>, vector<7xi1>) -> vector<7xf32>
    %1 = llvm.intr.masked.gather %arg0, %arg1, %0 {alignment = 1 : i32} : (vector<7x!llvm.ptr>, vector<7xi1>, vector<7xf32>) -> vector<7xf32>
    llvm.intr.masked.scatter %1, %arg0, %arg1 {alignment = 1 : i32} : vector<7xf32>, vector<7xi1> into vector<7x!llvm.ptr>
    llvm.return
  }
  llvm.func @masked_expand_compress_intrinsics(%arg0: !llvm.ptr, %arg1: vector<7xi1>, %arg2: vector<7xf32>) {
    %0 = "llvm.intr.masked.expandload"(%arg0, %arg1, %arg2) : (!llvm.ptr, vector<7xi1>, vector<7xf32>) -> vector<7xf32>
    "llvm.intr.masked.compressstore"(%0, %arg0, %arg1) : (vector<7xf32>, !llvm.ptr, vector<7xi1>) -> ()
    llvm.return
  }
  llvm.func @masked_expand_compress_intrinsics_with_alignment(%arg0: !llvm.ptr, %arg1: vector<7xi1>, %arg2: vector<7xf32>) {
    %0 = "llvm.intr.masked.expandload"(%arg0, %arg1, %arg2) <{arg_attrs = [{llvm.align = 8 : i32}, {}, {}]}> : (!llvm.ptr, vector<7xi1>, vector<7xf32>) -> vector<7xf32>
    "llvm.intr.masked.compressstore"(%0, %arg0, %arg1) <{arg_attrs = [{}, {llvm.align = 8 : i32}, {}]}> : (vector<7xf32>, !llvm.ptr, vector<7xi1>) -> ()
    llvm.return
  }
  llvm.func @annotate_intrinsics(%arg0: !llvm.ptr, %arg1: i16, %arg2: !llvm.ptr, %arg3: !llvm.ptr, %arg4: !llvm.ptr, %arg5: i32, %arg6: !llvm.ptr) {
    "llvm.intr.var.annotation"(%arg0, %arg3, %arg4, %arg5, %arg6) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr) -> ()
    %0 = "llvm.intr.ptr.annotation"(%arg2, %arg3, %arg4, %arg5, %arg6) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr) -> !llvm.ptr
    %1 = "llvm.intr.annotation"(%arg1, %arg3, %arg4, %arg5) : (i16, !llvm.ptr, !llvm.ptr, i32) -> i16
    llvm.return
  }
  llvm.func @trap_intrinsics() {
    llvm.intr.trap
    llvm.intr.debugtrap
    llvm.intr.ubsantrap <{failureKind = 1 : i8}>
    llvm.intr.trap
    llvm.intr.debugtrap
    llvm.intr.ubsantrap <{failureKind = 1 : i8}>
    llvm.return
  }
  llvm.func @memcpy_test(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    "llvm.intr.memcpy"(%arg1, %arg2, %arg0) <{arg_attrs = [{llvm.align = 4 : i64}, {llvm.align = 8 : i64}, {}], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy.inline"(%arg1, %arg2) <{arg_attrs = [{llvm.align = 4 : i64}, {}], isVolatile = true, len = 10 : i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.intr.memcpy.inline"(%arg1, %arg2) <{isVolatile = true, len = 10 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.intr.memcpy"(%arg1, %arg2, %arg0) <{arg_attrs = [{llvm.align = 4 : i64}, {llvm.align = 8 : i64}], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    llvm.return
  }
  llvm.func @memmove_test(%arg0: i32, %arg1: !llvm.ptr, %arg2: !llvm.ptr) {
    "llvm.intr.memmove"(%arg1, %arg2, %arg0) <{arg_attrs = [{llvm.align = 4 : i64}, {llvm.align = 8 : i64}, {}], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    llvm.return
  }
  llvm.func @memset_test(%arg0: i32, %arg1: !llvm.ptr, %arg2: i8) {
    %0 = llvm.mlir.constant(false) : i1
    "llvm.intr.memset"(%arg1, %arg2, %arg0) <{arg_attrs = [{llvm.align = 8 : i64}, {}, {}], isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    "llvm.intr.memset.inline"(%arg1, %arg2) <{arg_attrs = [{llvm.align = 8 : i64}, {}], isVolatile = true, len = 10 : i32}> : (!llvm.ptr, i8) -> ()
    "llvm.intr.memset.inline"(%arg1, %arg2) <{isVolatile = true, len = 10 : i64}> : (!llvm.ptr, i8) -> ()
    llvm.return
  }
  llvm.func @sadd_with_overflow_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = "llvm.intr.sadd.with.overflow"(%arg0, %arg1) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %1 = "llvm.intr.sadd.with.overflow"(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    llvm.return
  }
  llvm.func @uadd_with_overflow_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = "llvm.intr.uadd.with.overflow"(%arg0, %arg1) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %1 = "llvm.intr.uadd.with.overflow"(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    llvm.return
  }
  llvm.func @ssub_with_overflow_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = "llvm.intr.ssub.with.overflow"(%arg0, %arg1) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %1 = "llvm.intr.ssub.with.overflow"(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    llvm.return
  }
  llvm.func @usub_with_overflow_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = "llvm.intr.usub.with.overflow"(%arg0, %arg1) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %1 = "llvm.intr.usub.with.overflow"(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    llvm.return
  }
  llvm.func @smul_with_overflow_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = "llvm.intr.smul.with.overflow"(%arg0, %arg1) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %1 = "llvm.intr.smul.with.overflow"(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    llvm.return
  }
  llvm.func @umul_with_overflow_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = "llvm.intr.umul.with.overflow"(%arg0, %arg1) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %1 = "llvm.intr.umul.with.overflow"(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    llvm.return
  }
  llvm.func @is_constant(%arg0: i32) {
    %0 = "llvm.intr.is.constant"(%arg0) : (i32) -> i1
    llvm.return
  }
  llvm.func @expect(%arg0: i32) {
    %0 = llvm.mlir.constant(42 : i32) : i32
    %1 = llvm.intr.expect %arg0, %0 : i32
    llvm.return
  }
  llvm.func @expect_with_probability(%arg0: i16) {
    %0 = llvm.mlir.constant(42 : i16) : i16
    %1 = llvm.intr.expect.with.probability %arg0, %0, 5.000000e-01 : i16
    llvm.return
  }
  llvm.mlir.global external thread_local @tls_var(0 : i32) {addr_space = 0 : i32, alignment = 4 : i64, dso_local} : i32
  llvm.func @threadlocal_test() {
    %0 = llvm.mlir.addressof @tls_var : !llvm.ptr
    %1 = "llvm.intr.threadlocal.address"(%0) : (!llvm.ptr) -> !llvm.ptr
    llvm.return
  }
  llvm.func @sadd_sat_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.sadd.sat(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.sadd.sat(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @uadd_sat_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.uadd.sat(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.uadd.sat(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @ssub_sat_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.ssub.sat(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.ssub.sat(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @usub_sat_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.usub.sat(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.usub.sat(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @sshl_sat_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.sshl.sat(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.sshl.sat(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @ushl_sat_test(%arg0: i32, %arg1: i32, %arg2: vector<8xi32>, %arg3: vector<8xi32>) {
    %0 = llvm.intr.ushl.sat(%arg0, %arg1) : (i32, i32) -> i32
    %1 = llvm.intr.ushl.sat(%arg2, %arg3) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    llvm.return
  }
  llvm.func @coro_id() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(16 : i64) : i64
    %2 = llvm.alloca %1 x i8 : (i64) -> !llvm.ptr
    %3 = llvm.mlir.zero : !llvm.ptr
    %4 = llvm.intr.coro.id %0, %2, %3, %3 : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> token
    llvm.return
  }
  llvm.func @coro_begin(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.zero : !llvm.ptr
    %2 = llvm.intr.coro.id %0, %1, %1, %1 : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> token
    %3 = llvm.intr.coro.begin %2, %arg0 : (token, !llvm.ptr) -> !llvm.ptr
    llvm.return
  }
  llvm.func @coro_size() {
    %0 = llvm.intr.coro.size : i64
    %1 = llvm.intr.coro.size : i32
    llvm.return
  }
  llvm.func @coro_align() {
    %0 = llvm.intr.coro.align : i64
    %1 = llvm.intr.coro.align : i32
    llvm.return
  }
  llvm.func @coro_save(%arg0: !llvm.ptr) {
    %0 = llvm.intr.coro.save %arg0 : (!llvm.ptr) -> token
    llvm.return
  }
  llvm.func @coro_suspend(%arg0: i1) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.zero : !llvm.ptr
    %2 = llvm.intr.coro.id %0, %1, %1, %1 : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> token
    %3 = llvm.intr.coro.suspend %2, %arg0 : i8
    llvm.return
  }
  llvm.func @coro_end(%arg0: !llvm.ptr, %arg1: i1) {
    %0 = llvm.mlir.none : token
    %1 = llvm.intr.coro.end %arg0, %arg1, %0 : (!llvm.ptr, i1, token) -> !llvm.void
    llvm.return
  }
  llvm.func @coro_free(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.zero : !llvm.ptr
    %2 = llvm.intr.coro.id %0, %1, %1, %1 : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> token
    %3 = llvm.intr.coro.free %2, %arg0 : (token, !llvm.ptr) -> !llvm.ptr
    llvm.return
  }
  llvm.func @coro_resume(%arg0: !llvm.ptr) {
    llvm.intr.coro.resume %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func @coro_promise(%arg0: !llvm.ptr, %arg1: i32, %arg2: i1) {
    %0 = llvm.intr.coro.promise %arg0, %arg1, %arg2 : (!llvm.ptr, i32, i1) -> !llvm.ptr
    llvm.return
  }
  llvm.func @eh_typeid_for(%arg0: !llvm.ptr) {
    %0 = llvm.intr.eh.typeid.for %arg0 : (!llvm.ptr) -> i32
    llvm.return
  }
  llvm.func @stack_save() {
    %0 = llvm.intr.stacksave : !llvm.ptr
    %1 = llvm.intr.stacksave : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @stack_restore(%arg0: !llvm.ptr, %arg1: !llvm.ptr<1>) {
    llvm.intr.stackrestore %arg0 : !llvm.ptr
    llvm.intr.stackrestore %arg1 : !llvm.ptr<1>
    llvm.return
  }
  llvm.func @vector_predication_intrinsics(%arg0: vector<8xi32>, %arg1: vector<8xi32>, %arg2: vector<8xf32>, %arg3: vector<8xf32>, %arg4: vector<8xi64>, %arg5: vector<8xf64>, %arg6: vector<8x!llvm.ptr>, %arg7: i32, %arg8: f32, %arg9: !llvm.ptr, %arg10: !llvm.ptr, %arg11: vector<8xi1>, %arg12: i32) {
    %0 = "llvm.intr.vp.add"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %1 = "llvm.intr.vp.sub"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %2 = "llvm.intr.vp.mul"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %3 = "llvm.intr.vp.sdiv"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %4 = "llvm.intr.vp.udiv"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %5 = "llvm.intr.vp.srem"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %6 = "llvm.intr.vp.urem"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %7 = "llvm.intr.vp.ashr"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %8 = "llvm.intr.vp.lshr"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %9 = "llvm.intr.vp.shl"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %10 = "llvm.intr.vp.or"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %11 = "llvm.intr.vp.and"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %12 = "llvm.intr.vp.xor"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %13 = "llvm.intr.vp.smax"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %14 = "llvm.intr.vp.smin"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %15 = "llvm.intr.vp.umax"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %16 = "llvm.intr.vp.umin"(%arg0, %arg1, %arg11, %arg12) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %17 = "llvm.intr.vp.fadd"(%arg2, %arg3, %arg11, %arg12) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %18 = "llvm.intr.vp.fsub"(%arg2, %arg3, %arg11, %arg12) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %19 = "llvm.intr.vp.fmul"(%arg2, %arg3, %arg11, %arg12) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %20 = "llvm.intr.vp.fdiv"(%arg2, %arg3, %arg11, %arg12) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %21 = "llvm.intr.vp.frem"(%arg2, %arg3, %arg11, %arg12) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %22 = "llvm.intr.vp.fneg"(%arg2, %arg11, %arg12) : (vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %23 = "llvm.intr.vp.fma"(%arg2, %arg3, %arg3, %arg11, %arg12) : (vector<8xf32>, vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %24 = "llvm.intr.vp.fmuladd"(%arg2, %arg3, %arg3, %arg11, %arg12) : (vector<8xf32>, vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %25 = "llvm.intr.vp.reduce.add"(%arg7, %arg0, %arg11, %arg12) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %26 = "llvm.intr.vp.reduce.mul"(%arg7, %arg0, %arg11, %arg12) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %27 = "llvm.intr.vp.reduce.and"(%arg7, %arg0, %arg11, %arg12) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %28 = "llvm.intr.vp.reduce.or"(%arg7, %arg0, %arg11, %arg12) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %29 = "llvm.intr.vp.reduce.xor"(%arg7, %arg0, %arg11, %arg12) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %30 = "llvm.intr.vp.reduce.smax"(%arg7, %arg0, %arg11, %arg12) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %31 = "llvm.intr.vp.reduce.smin"(%arg7, %arg0, %arg11, %arg12) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %32 = "llvm.intr.vp.reduce.umax"(%arg7, %arg0, %arg11, %arg12) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %33 = "llvm.intr.vp.reduce.umin"(%arg7, %arg0, %arg11, %arg12) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %34 = "llvm.intr.vp.reduce.fadd"(%arg8, %arg2, %arg11, %arg12) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
    %35 = "llvm.intr.vp.reduce.fmul"(%arg8, %arg2, %arg11, %arg12) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
    %36 = "llvm.intr.vp.reduce.fmax"(%arg8, %arg2, %arg11, %arg12) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
    %37 = "llvm.intr.vp.reduce.fmin"(%arg8, %arg2, %arg11, %arg12) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
    %38 = "llvm.intr.vp.select"(%arg11, %arg0, %arg1, %arg12) : (vector<8xi1>, vector<8xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %39 = "llvm.intr.vp.merge"(%arg11, %arg0, %arg1, %arg12) : (vector<8xi1>, vector<8xi32>, vector<8xi32>, i32) -> vector<8xi32>
    "llvm.intr.vp.store"(%arg0, %arg9, %arg11, %arg12) : (vector<8xi32>, !llvm.ptr, vector<8xi1>, i32) -> ()
    %40 = "llvm.intr.vp.load"(%arg9, %arg11, %arg12) : (!llvm.ptr, vector<8xi1>, i32) -> vector<8xi32>
    "llvm.intr.experimental.vp.strided.store"(%arg0, %arg9, %arg7, %arg11, %arg12) : (vector<8xi32>, !llvm.ptr, i32, vector<8xi1>, i32) -> ()
    %41 = "llvm.intr.experimental.vp.strided.load"(%arg9, %arg7, %arg11, %arg12) : (!llvm.ptr, i32, vector<8xi1>, i32) -> vector<8xi32>
    %42 = "llvm.intr.vp.trunc"(%arg4, %arg11, %arg12) : (vector<8xi64>, vector<8xi1>, i32) -> vector<8xi32>
    %43 = "llvm.intr.vp.zext"(%arg0, %arg11, %arg12) : (vector<8xi32>, vector<8xi1>, i32) -> vector<8xi64>
    %44 = "llvm.intr.vp.sext"(%arg0, %arg11, %arg12) : (vector<8xi32>, vector<8xi1>, i32) -> vector<8xi64>
    %45 = "llvm.intr.vp.fptrunc"(%arg5, %arg11, %arg12) : (vector<8xf64>, vector<8xi1>, i32) -> vector<8xf32>
    %46 = "llvm.intr.vp.fpext"(%arg2, %arg11, %arg12) : (vector<8xf32>, vector<8xi1>, i32) -> vector<8xf64>
    %47 = "llvm.intr.vp.fptoui"(%arg5, %arg11, %arg12) : (vector<8xf64>, vector<8xi1>, i32) -> vector<8xi64>
    %48 = "llvm.intr.vp.fptosi"(%arg5, %arg11, %arg12) : (vector<8xf64>, vector<8xi1>, i32) -> vector<8xi64>
    %49 = "llvm.intr.vp.ptrtoint"(%arg6, %arg11, %arg12) : (vector<8x!llvm.ptr>, vector<8xi1>, i32) -> vector<8xi64>
    %50 = "llvm.intr.vp.inttoptr"(%arg4, %arg11, %arg12) : (vector<8xi64>, vector<8xi1>, i32) -> vector<8x!llvm.ptr>
    llvm.return
  }
  llvm.func @vector_insert_extract(%arg0: vector<8xi32>, %arg1: vector<4xi32>, %arg2: vector<[4]xi32>) {
    %0 = llvm.intr.vector.insert %arg0, %arg2[0] : vector<8xi32> into vector<[4]xi32>
    %1 = llvm.intr.vector.insert %arg1, %arg2[0] : vector<4xi32> into vector<[4]xi32>
    %2 = llvm.intr.vector.insert %arg1, %1[4] : vector<4xi32> into vector<[4]xi32>
    %3 = llvm.intr.vector.insert %arg1, %arg0[4] : vector<4xi32> into vector<8xi32>
    %4 = llvm.intr.vector.extract %2[0] : vector<8xi32> from vector<[4]xi32>
    %5 = llvm.intr.vector.extract %2[0] : vector<4xi32> from vector<[4]xi32>
    %6 = llvm.intr.vector.extract %arg0[6] : vector<2xi32> from vector<8xi32>
    llvm.return
  }
  llvm.func @vector_deinterleave2(%arg0: vector<4xf64>, %arg1: vector<[8]xi32>) {
    %0 = "llvm.intr.vector.deinterleave2"(%arg0) : (vector<4xf64>) -> !llvm.struct<(vector<2xf64>, vector<2xf64>)>
    %1 = "llvm.intr.vector.deinterleave2"(%arg1) : (vector<[8]xi32>) -> !llvm.struct<(vector<[4]xi32>, vector<[4]xi32>)>
    llvm.return
  }
  llvm.func @lifetime() {
    %0 = llvm.mlir.constant(16 : i64) : i64
    %1 = llvm.alloca %0 x i8 : (i64) -> !llvm.ptr
    llvm.intr.lifetime.start %1 : !llvm.ptr
    llvm.intr.lifetime.end %1 : !llvm.ptr
    llvm.return
  }
  llvm.func @invariant(%arg0: !llvm.ptr) {
    %0 = llvm.intr.invariant.start 16, %arg0 : !llvm.ptr
    llvm.intr.invariant.end %0, 16, %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func @invariant_group(%arg0: !llvm.ptr) {
    %0 = llvm.intr.launder.invariant.group %arg0 : !llvm.ptr
    %1 = llvm.intr.strip.invariant.group %arg0 : !llvm.ptr
    llvm.return
  }
  llvm.func @ssa_copy(%arg0: f32) -> f32 {
    %0 = llvm.intr.ssa.copy %arg0 : f32
    llvm.return %0 : f32
  }
  llvm.func @ptrmask(%arg0: !llvm.ptr, %arg1: i64) -> !llvm.ptr {
    %0 = llvm.intr.ptrmask %arg0, %arg1 : (!llvm.ptr, i64) -> !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @vector_ptrmask(%arg0: vector<8x!llvm.ptr>, %arg1: vector<8xi64>) -> vector<8x!llvm.ptr> {
    %0 = llvm.intr.ptrmask %arg0, %arg1 : (vector<8x!llvm.ptr>, vector<8xi64>) -> vector<8x!llvm.ptr>
    llvm.return %0 : vector<8x!llvm.ptr>
  }
  llvm.func @experimental_constrained_fadd(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = llvm.intr.experimental.constrained.fadd %arg0, %arg0 towardzero ignore : f32
    %1 = llvm.intr.experimental.constrained.fadd %arg1, %arg1 towardzero ignore : vector<4xf32>
    llvm.return
  }
  llvm.func @experimental_constrained_fsub(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = llvm.intr.experimental.constrained.fsub %arg0, %arg0 towardzero ignore : f32
    %1 = llvm.intr.experimental.constrained.fsub %arg1, %arg1 towardzero ignore : vector<4xf32>
    llvm.return
  }
  llvm.func @experimental_constrained_fmul(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = llvm.intr.experimental.constrained.fmul %arg0, %arg0 towardzero ignore : f32
    %1 = llvm.intr.experimental.constrained.fmul %arg1, %arg1 towardzero ignore : vector<4xf32>
    llvm.return
  }
  llvm.func @experimental_constrained_fdiv(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = llvm.intr.experimental.constrained.fdiv %arg0, %arg0 towardzero ignore : f32
    %1 = llvm.intr.experimental.constrained.fdiv %arg1, %arg1 towardzero ignore : vector<4xf32>
    llvm.return
  }
  llvm.func @experimental_constrained_frem(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = llvm.intr.experimental.constrained.frem %arg0, %arg0 towardzero ignore : f32
    %1 = llvm.intr.experimental.constrained.frem %arg1, %arg1 towardzero ignore : vector<4xf32>
    llvm.return
  }
  llvm.func @experimental_constrained_fma(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = llvm.intr.experimental.constrained.fma %arg0, %arg0, %arg0 towardzero ignore : f32
    %1 = llvm.intr.experimental.constrained.fma %arg1, %arg1, %arg1 towardzero ignore : vector<4xf32>
    llvm.return
  }
  llvm.func @experimental_constrained_fmuladd(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = llvm.intr.experimental.constrained.fmuladd %arg0, %arg0, %arg0 towardzero ignore : f32
    %1 = llvm.intr.experimental.constrained.fmuladd %arg1, %arg1, %arg1 towardzero ignore : vector<4xf32>
    llvm.return
  }
  llvm.func @experimental_constrained_uitofp(%arg0: i32, %arg1: vector<4xi32>) {
    %0 = llvm.intr.experimental.constrained.uitofp %arg0 towardzero ignore : i32 to f32
    %1 = llvm.intr.experimental.constrained.uitofp %arg0 tonearest maytrap : i32 to f32
    %2 = llvm.intr.experimental.constrained.uitofp %arg0 upward strict : i32 to f32
    %3 = llvm.intr.experimental.constrained.uitofp %arg0 downward ignore : i32 to f32
    %4 = llvm.intr.experimental.constrained.uitofp %arg0 tonearestaway ignore : i32 to f32
    %5 = llvm.intr.experimental.constrained.uitofp %arg1 upward strict : vector<4xi32> to vector<4xf32>
    llvm.return
  }
  llvm.func @experimental_constrained_sitofp(%arg0: i32, %arg1: vector<4xi32>) {
    %0 = llvm.intr.experimental.constrained.sitofp %arg0 towardzero ignore : i32 to f32
    %1 = llvm.intr.experimental.constrained.sitofp %arg0 tonearest maytrap : i32 to f32
    %2 = llvm.intr.experimental.constrained.sitofp %arg0 upward strict : i32 to f32
    %3 = llvm.intr.experimental.constrained.sitofp %arg0 downward ignore : i32 to f32
    %4 = llvm.intr.experimental.constrained.sitofp %arg0 tonearestaway ignore : i32 to f32
    %5 = llvm.intr.experimental.constrained.sitofp %arg1 upward strict : vector<4xi32> to vector<4xf32>
    llvm.return
  }
  llvm.func @experimental_constrained_fptrunc(%arg0: f64, %arg1: vector<4xf32>) {
    %0 = llvm.intr.experimental.constrained.fptrunc %arg0 towardzero ignore : f64 to f32
    %1 = llvm.intr.experimental.constrained.fptrunc %arg0 tonearest maytrap : f64 to f32
    %2 = llvm.intr.experimental.constrained.fptrunc %arg0 upward strict : f64 to f32
    %3 = llvm.intr.experimental.constrained.fptrunc %arg0 downward ignore : f64 to f32
    %4 = llvm.intr.experimental.constrained.fptrunc %arg0 tonearestaway ignore : f64 to f32
    %5 = llvm.intr.experimental.constrained.fptrunc %arg1 upward strict : vector<4xf32> to vector<4xf16>
    llvm.return
  }
  llvm.func @experimental_constrained_fpext(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = llvm.intr.experimental.constrained.fpext %arg0 ignore : f32 to f64
    %1 = llvm.intr.experimental.constrained.fpext %arg0 maytrap : f32 to f64
    %2 = llvm.intr.experimental.constrained.fpext %arg0 strict : f32 to f64
    %3 = llvm.intr.experimental.constrained.fpext %arg1 strict : vector<4xf32> to vector<4xf64>
    llvm.return
  }
  llvm.func @ucmp(%arg0: i32, %arg1: i32) -> i2 {
    %0 = llvm.intr.ucmp(%arg0, %arg1) : (i32, i32) -> i2
    llvm.return %0 : i2
  }
  llvm.func @vector_ucmp(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi32> {
    %0 = llvm.intr.ucmp(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
  llvm.func @scmp(%arg0: i32, %arg1: i32) -> i2 {
    %0 = llvm.intr.scmp(%arg0, %arg1) : (i32, i32) -> i2
    llvm.return %0 : i2
  }
  llvm.func @vector_scmp(%arg0: vector<4xi32>, %arg1: vector<4xi32>) -> vector<4xi32> {
    %0 = llvm.intr.scmp(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    llvm.return %0 : vector<4xi32>
  }
}

