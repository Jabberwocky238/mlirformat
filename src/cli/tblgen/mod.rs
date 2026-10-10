//! `mlirformat tblgen`: ODS (`.td`) ⇒ `<dialect>.gen.rs`.

mod records;

use std::path::PathBuf;

use records::Records;

#[derive(clap::Args)]
pub struct Args {
    /// The dialect's ops file, e.g. `mlir/include/mlir/Dialect/Arith/IR/ArithOps.td`.
    td: PathBuf,
    /// Include directories for TableGen (usually `mlir/include`).
    #[arg(short = 'I', long = "include")]
    includes: Vec<PathBuf>,
    /// Output directory.
    #[arg(short, long, default_value = ".")]
    out: PathBuf,
    /// The `llvm-tblgen` to run (`--dump-json`).
    #[arg(long = "llvm-tblgen", default_value = "llvm-tblgen")]
    llvm_tblgen: PathBuf,
    /// Read records already dumped with `llvm-tblgen --dump-json` instead of running it.
    #[arg(long)]
    json: Option<PathBuf>,
    /// Only this dialect (namespace, e.g. `arith`).
    #[arg(long)]
    dialect: Option<String>,
}

impl Args {
    /// Writes one `<dialect>.gen.rs` per dialect with ops defined in the `.td` file.
    pub fn run(self) -> Result<(), String> {
        let records = match &self.json {
            Some(path) => Records::from_json(&std::fs::read_to_string(path).map_err(|e| format!("{}: {e}", path.display()))?, &self.td),
            None => Records::dump(&self.llvm_tblgen, &self.td, &self.includes),
        }
        .map_err(|e| e.to_string())?;
        let source = self.td.file_name().map_or_else(String::new, |f| f.to_string_lossy().into_owned());
        let dialects: Vec<_> = records.dialects().into_iter().filter(|d| self.dialect.as_ref().is_none_or(|n| *n == d.name)).collect();
        if dialects.is_empty() {
            return Err(format!("no dialect with ops defined in {}", self.td.display()));
        }
        for d in dialects {
            let path = self.out.join(d.file_name());
            std::fs::write(&path, d.render(&source)).map_err(|e| format!("writing {}: {e}", path.display()))?;
            let generic = d.ops.iter().filter(|o| o.format.is_none()).count();
            println!("{}: {} ops ({} custom form, {generic} generic only)", path.display(), d.ops.len(), d.ops.len() - generic);
        }
        Ok(())
    }
}
