"builtin.module"() ({
  "spirv.module"() <{addressing_model = #spirv.addressing_model<Logical>, memory_model = #spirv.memory_model<GLSL450>, vce_triple = #spirv.vce<v1.0, [Shader, Addresses, Float64, Int64, Linkage, VariablePointers], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_variable_pointers]>}> ({
    "spirv.GlobalVariable"() <{binding = 1 : i32, descriptor_set = 0 : i32, sym_name = "var0", type = !spirv.ptr<!spirv.struct<(!spirv.array<128 x f32, stride=4> [0])>, Input>}> : () -> () loc("<stdin>":3:5)
    "spirv.GlobalVariable"() <{binding = 2 : i32, descriptor_set = 0 : i32, sym_name = "var1", type = !spirv.ptr<!spirv.struct<(f32 [0], !spirv.struct<(f32 [0], !spirv.array<16 x f32, stride=4> [4])> [4])>, Input>}> : () -> () loc("<stdin>":4:5)
    "spirv.GlobalVariable"() <{sym_name = "var2", type = !spirv.ptr<!spirv.struct<(f32 [0], i32 [4], f64 [8], i64 [16], f32 [24], i32 [30], f32 [34], i32 [38]), Block>, StorageBuffer>}> : () -> () loc("<stdin>":5:5)
    "spirv.GlobalVariable"() <{sym_name = "var3", type = !spirv.ptr<!spirv.struct<(!spirv.array<128 x !spirv.struct<(!spirv.array<128 x f32, stride=4> [0])>, stride=512> [0]), Block>, StorageBuffer>}> : () -> () loc("<stdin>":6:5)
    "spirv.GlobalVariable"() <{sym_name = "var_buffer_block", type = !spirv.ptr<!spirv.struct<(!spirv.array<128 x f32, stride=4> [0]), BufferBlock>, Uniform>}> : () -> () loc("<stdin>":7:5)
    "spirv.GlobalVariable"() <{sym_name = "var4", type = !spirv.ptr<!spirv.struct<(f32 [0, NonWritable], i32 [4]), Block>, StorageBuffer>}> : () -> () loc("<stdin>":8:5)
    "spirv.GlobalVariable"() <{sym_name = "var5", type = !spirv.ptr<!spirv.struct<(f32 [0, NonWritable], i32 [4, NonWritable, NonReadable]), Block>, StorageBuffer>}> : () -> () loc("<stdin>":9:5)
    "spirv.GlobalVariable"() <{sym_name = "var6", type = !spirv.ptr<!spirv.struct<(f32 [0, NonWritable], i32 [4, NonWritable, NonReadable]), Block>, StorageBuffer>}> : () -> () loc("<stdin>":10:5)
    "spirv.GlobalVariable"() <{sym_name = "var7", type = !spirv.ptr<!spirv.struct<(!spirv.matrix<3 x vector<3xf32>> [0, ColMajor, MatrixStride=16]), Block>, StorageBuffer>}> : () -> () loc("<stdin>":11:5)
    "spirv.GlobalVariable"() <{sym_name = "empty", type = !spirv.ptr<!spirv.struct<()>, StorageBuffer>}> : () -> () loc("<stdin>":12:5)
    "spirv.GlobalVariable"() <{sym_name = "id_empty", type = !spirv.ptr<!spirv.struct<empty_struct, ()>, StorageBuffer>}> : () -> () loc("<stdin>":13:5)
    "spirv.GlobalVariable"() <{sym_name = "id_var0", type = !spirv.ptr<!spirv.struct<test_id, (!spirv.array<128 x f32, stride=4> [0])>, Input>}> : () -> () loc("<stdin>":14:5)
    "spirv.GlobalVariable"() <{sym_name = "recursive_simple", type = !spirv.ptr<!spirv.struct<rec, (!spirv.ptr<!spirv.struct<rec>, StorageBuffer> [0]), Block>, Private>}> : () -> () loc("<stdin>":15:5)
    "spirv.GlobalVariable"() <{sym_name = "recursive_2", type = !spirv.ptr<!spirv.struct<a, (!spirv.ptr<!spirv.struct<b, (!spirv.ptr<!spirv.struct<a>, StorageBuffer> [0]), Block>, StorageBuffer> [0]), Block>, Private>}> : () -> () loc("<stdin>":16:5)
    "spirv.GlobalVariable"() <{sym_name = "recursive_3", type = !spirv.ptr<!spirv.struct<axx, (!spirv.ptr<!spirv.struct<bxx, (!spirv.ptr<!spirv.struct<axx>, StorageBuffer> [0], !spirv.ptr<!spirv.struct<bxx>, StorageBuffer> [8]), Block>, StorageBuffer> [0]), Block>, Private>}> : () -> () loc("<stdin>":17:5)
    "spirv.GlobalVariable"() <{sym_name = "block", type = !spirv.ptr<!spirv.struct<vert, (vector<4xf32> [BuiltIn=0], f32 [BuiltIn=1]), Block>, Output>}> : () -> () loc("<stdin>":18:5)
    "spirv.func"() <{function_control = #spirv.function_control<None>, function_type = (!spirv.ptr<!spirv.struct<(!spirv.array<128 x f32, stride=4> [0])>, Input>, !spirv.ptr<!spirv.struct<(!spirv.array<128 x f32, stride=4> [0])>, Output>) -> (), sym_name = "kernel"}> ({
    ^bb0(%arg0: !spirv.ptr<!spirv.struct<(!spirv.array<128 x f32, stride=4> [0])>, Input> loc("<stdin>":20:10), %arg1: !spirv.ptr<!spirv.struct<(!spirv.array<128 x f32, stride=4> [0])>, Output> loc("<stdin>":20:92)):
      "spirv.Return"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
