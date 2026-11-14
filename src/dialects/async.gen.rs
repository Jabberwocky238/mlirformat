#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("async.add_to_group", format = "$operand `,` $group `:` type($operand) attr-dict", results(rank))]
pub struct AddToGroupOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[slot(group_ty)]
    pub group: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(is = "!async.group")]
    pub group_ty: Type<'a>,
    #[dtype(is = index)]
    pub rank: Type<'a>,
}

#[mlir::op("async.await_all", format = "$operand attr-dict")]
pub struct AwaitAllOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[dtype(is = "!async.group")]
    pub operand_ty: Type<'a>,
}

#[mlir::op("async.await", results(result))]
pub struct AwaitOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("async.call", format = "$callee `(` $operands `)` attr-dict `:` functional-type($operands, $result)", results(result))]
pub struct CallOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub callee: Attribute<'a>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub operands_ty: Vec<Type<'a>>,
    pub result: Vec<Type<'a>>,
}

#[mlir::op("async.coro.begin", format = "$id attr-dict", results(handle))]
pub struct CoroBeginOp<'a> {
    #[slot(id_ty)]
    pub id: Value<'a>,
    #[dtype(is = "!async.coro.id")]
    pub id_ty: Type<'a>,
    #[dtype(is = "!async.coro.handle")]
    pub handle: Type<'a>,
}

#[mlir::op("async.coro.end", format = "$handle attr-dict")]
pub struct CoroEndOp<'a> {
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    #[dtype(is = "!async.coro.handle")]
    pub handle_ty: Type<'a>,
}

#[mlir::op("async.coro.free", format = "$id `,` $handle attr-dict")]
pub struct CoroFreeOp<'a> {
    #[slot(id_ty)]
    pub id: Value<'a>,
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    #[dtype(is = "!async.coro.id")]
    pub id_ty: Type<'a>,
    #[dtype(is = "!async.coro.handle")]
    pub handle_ty: Type<'a>,
}

#[mlir::op("async.coro.id", format = "attr-dict", results(id))]
pub struct CoroIdOp<'a> {
    #[dtype(is = "!async.coro.id")]
    pub id: Type<'a>,
}

#[mlir::op("async.coro.save", format = "$handle attr-dict", results(state))]
pub struct CoroSaveOp<'a> {
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    #[dtype(is = "!async.coro.handle")]
    pub handle_ty: Type<'a>,
    #[dtype(is = "!async.coro.state")]
    pub state: Type<'a>,
}

#[mlir::op("async.coro.suspend", format = "$state `,` $suspendDest `,` $resumeDest `,` $cleanupDest attr-dict")]
pub struct CoroSuspendOp<'a> {
    #[slot(state_ty)]
    pub state: Value<'a>,
    #[successor(name = "suspendDest")]
    pub suspend_dest: Str<'a>,
    #[successor(name = "resumeDest")]
    pub resume_dest: Str<'a>,
    #[successor(name = "cleanupDest")]
    pub cleanup_dest: Str<'a>,
    #[dtype(is = "!async.coro.state")]
    pub state_ty: Type<'a>,
}

#[mlir::op("async.create_group", format = "$size `:` type($result) attr-dict", results(result))]
pub struct CreateGroupOp<'a> {
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[dtype(is = index)]
    pub size_ty: Type<'a>,
    #[dtype(is = "!async.group")]
    pub result: Type<'a>,
}

#[mlir::op("async.execute", results(token, body_results))]
pub struct ExecuteOp<'a> {
    #[slot(dependencies_ty)]
    pub dependencies: Vec<Value<'a>>,
    #[slot(body_operands_ty, name = "bodyOperands")]
    pub body_operands: Vec<Value<'a>>,
    #[region(name = "bodyRegion")]
    pub body_region: Region<'a>,
    #[dtype(is = "!async.token")]
    pub dependencies_ty: Type<'a>,
    pub body_operands_ty: Vec<Type<'a>>,
    #[dtype(is = "!async.token")]
    pub token: Type<'a>,
    #[dtype(strip = "async.value")]
    pub body_results: Vec<Type<'a>>,
}

#[mlir::op("async.func")]
pub struct FuncOp<'a> {
    #[attr(symbol)]
    pub sym_name: Attribute<'a>,
    pub function_type: Attribute<'a>,
    pub sym_visibility: Option<Attribute<'a>>,
    pub arg_attrs: Option<Attribute<'a>>,
    pub res_attrs: Option<Attribute<'a>>,
    pub body: Region<'a>,
}

#[mlir::op("async.return", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct ReturnOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::op("async.runtime.add_ref", format = "$operand attr-dict `:` type($operand)")]
pub struct RuntimeAddRefOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[attr(int = "i64")]
    pub count: Attribute<'a>,
    pub operand_ty: Type<'a>,
}

#[mlir::op("async.runtime.add_to_group", format = "$operand `,` $group attr-dict `:` type($operand)", results(rank))]
pub struct RuntimeAddToGroupOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[slot(group_ty)]
    pub group: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(is = "!async.group")]
    pub group_ty: Type<'a>,
    #[dtype(is = index)]
    pub rank: Type<'a>,
}

#[mlir::op("async.runtime.await_and_resume", format = "$operand `,` $handle attr-dict `:` type($operand)")]
pub struct RuntimeAwaitAndResumeOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(is = "!async.coro.handle")]
    pub handle_ty: Type<'a>,
}

#[mlir::op("async.runtime.await", format = "$operand attr-dict `:` type($operand)")]
pub struct RuntimeAwaitOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
}

#[mlir::op("async.runtime.create_group", format = "$size `:` type($result) attr-dict", results(result))]
pub struct RuntimeCreateGroupOp<'a> {
    #[slot(size_ty)]
    pub size: Value<'a>,
    #[dtype(is = index)]
    pub size_ty: Type<'a>,
    #[dtype(is = "!async.group")]
    pub result: Type<'a>,
}

#[mlir::op("async.runtime.create", format = "attr-dict `:` type($result)", results(result))]
pub struct RuntimeCreateOp<'a> {
    pub result: Type<'a>,
}

#[mlir::op("async.runtime.drop_ref", format = "$operand attr-dict `:` type($operand)")]
pub struct RuntimeDropRefOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[attr(int = "i64")]
    pub count: Attribute<'a>,
    pub operand_ty: Type<'a>,
}

#[mlir::op("async.runtime.is_error", format = "$operand attr-dict `:` type($operand)", results(is_error))]
pub struct RuntimeIsErrorOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    #[dtype(is = i1)]
    pub is_error: Type<'a>,
}

#[mlir::op("async.runtime.load", format = "$storage attr-dict `:` type($storage)", results(result))]
pub struct RuntimeLoadOp<'a> {
    #[slot(storage_ty)]
    pub storage: Value<'a>,
    #[dtype(strip = "async.value")]
    pub storage_ty: Type<'a>,
    #[dtype(el = storage_ty)]
    pub result: Type<'a>,
}

#[mlir::op("async.runtime.num_worker_threads", format = "attr-dict `:` type($result)", results(result))]
pub struct RuntimeNumWorkerThreadsOp<'a> {
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("async.runtime.resume", format = "$handle attr-dict")]
pub struct RuntimeResumeOp<'a> {
    #[slot(handle_ty)]
    pub handle: Value<'a>,
    #[dtype(is = "!async.coro.handle")]
    pub handle_ty: Type<'a>,
}

#[mlir::op("async.runtime.set_available", format = "$operand attr-dict `:` type($operand)")]
pub struct RuntimeSetAvailableOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
}

#[mlir::op("async.runtime.set_error", format = "$operand attr-dict `:` type($operand)")]
pub struct RuntimeSetErrorOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
}

#[mlir::op("async.runtime.store", format = "$value `,` $storage attr-dict `:` type($storage)")]
pub struct RuntimeStoreOp<'a> {
    #[slot(value_ty)]
    pub value: Value<'a>,
    #[slot(storage_ty)]
    pub storage: Value<'a>,
    #[dtype(el = storage_ty)]
    pub value_ty: Type<'a>,
    #[dtype(strip = "async.value")]
    pub storage_ty: Type<'a>,
}

#[mlir::op("async.yield", format = "($operands^ `:` type($operands))? attr-dict")]
pub struct YieldOp<'a> {
    #[slot(operands_ty)]
    pub operands: Vec<Value<'a>>,
    pub operands_ty: Vec<Type<'a>>,
}

#[mlir::dialect(
    "async",
    ops = [AddToGroupOp, AwaitAllOp, AwaitOp, CallOp, CoroBeginOp, CoroEndOp, CoroFreeOp, CoroIdOp, CoroSaveOp, CoroSuspendOp, CreateGroupOp, ExecuteOp, FuncOp, ReturnOp, RuntimeAddRefOp, RuntimeAddToGroupOp, RuntimeAwaitAndResumeOp, RuntimeAwaitOp, RuntimeCreateGroupOp, RuntimeCreateOp, RuntimeDropRefOp, RuntimeIsErrorOp, RuntimeLoadOp, RuntimeNumWorkerThreadsOp, RuntimeResumeOp, RuntimeSetAvailableOp, RuntimeSetErrorOp, RuntimeStoreOp, YieldOp]
)]
pub struct AsyncDialect;
