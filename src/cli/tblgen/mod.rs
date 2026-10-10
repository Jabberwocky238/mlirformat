//! `mlirformat tblgen`: ODS (`.td`) ⇒ `<dialect>.gen.rs`.

mod records;

use std::path::{Path, PathBuf};

use records::Records;

#[derive(clap::Args)]
pub struct Args {
    /// The dialects' ops files, e.g. `mlir/include/mlir/Dialect/Arith/IR/ArithOps.td` (several run in parallel).
    #[arg(required = true)]
    td: Vec<PathBuf>,
    /// Include directories for TableGen (usually `mlir/include`).
    #[arg(short = 'I', long = "include")]
    includes: Vec<PathBuf>,
    /// Output directory.
    #[arg(short, long, default_value = ".")]
    out: PathBuf,
    /// The `llvm-tblgen` to run (`--dump-json`).
    #[arg(long = "llvm-tblgen", default_value = "llvm-tblgen")]
    llvm_tblgen: PathBuf,
    /// Read records already dumped with `llvm-tblgen --dump-json` instead of running it (one `.td` only).
    #[arg(long)]
    json: Option<PathBuf>,
    /// Only this dialect (namespace, e.g. `arith`).
    #[arg(long)]
    dialect: Option<String>,
    /// A dialect's type / attribute parameter hook, `<namespace>=<path>`
    /// (`dope=crate::Dope::params` ⇒ `#[mlir::dialect("dope", params = crate::Dope::params)]`). Repeatable.
    #[arg(long = "params", value_name = "NS=PATH")]
    params: Vec<String>,
}

impl Args {
    /// ⭐ Each `.td` file on its own thread (nearly all the time is `llvm-tblgen`); reports in input order.
    pub fn run(self) -> Result<(), String> {
        if let Some(bad) = self.params.iter().find(|p| !p.contains('=')) {
            return Err(format!("--params `{bad}`: expected `<namespace>=<path>`"));
        }
        if self.json.is_some() && self.td.len() != 1 {
            return Err("--json reads the records of exactly one `.td` file".into());
        }
        let reports: Vec<Result<Vec<String>, String>> = std::thread::scope(|s| {
            let workers: Vec<_> = self.td.iter().map(|td| s.spawn(|| self.one(td))).collect();
            workers.into_iter().map(|w| w.join().unwrap_or_else(|_| Err("generator thread panicked".into()))).collect()
        });
        let mut failed = Vec::new();
        for (td, report) in self.td.iter().zip(reports) {
            match report {
                Ok(lines) => lines.iter().for_each(|l| println!("{l}")),
                Err(e) => failed.push(format!("{}: {e}", td.display())),
            }
        }
        if failed.is_empty() { Ok(()) } else { Err(failed.join("\n")) }
    }

    /// Writes one `<dialect>.gen.rs` per dialect with ops defined in `td`; the summary lines.
    fn one(&self, td: &Path) -> Result<Vec<String>, String> {
        let records = match &self.json {
            Some(path) => Records::from_json(&std::fs::read_to_string(path).map_err(|e| format!("{}: {e}", path.display()))?, td),
            None => Records::dump(&self.llvm_tblgen, td, &self.includes),
        }
        .map_err(|e| e.to_string())?;
        let source = td.file_name().map_or_else(String::new, |f| f.to_string_lossy().into_owned());
        let dialects: Vec<_> = records.dialects().into_iter().filter(|d| self.dialect.as_ref().is_none_or(|n| *n == d.name)).collect();
        if dialects.is_empty() {
            return Err("no dialect with ops defined in it".into());
        }
        dialects
            .iter()
            .map(|d| {
                let path = self.out.join(d.file_name());
                let params = self.params.iter().find_map(|p| p.split_once('=').filter(|(ns, _)| *ns == d.name).map(|(_, path)| path));
                std::fs::write(&path, d.render(&source, params)).map_err(|e| format!("writing {}: {e}", path.display()))?;
                let generic = d.ops.iter().filter(|o| o.format.is_none()).count();
                Ok(format!("{}: {} ops ({} custom form, {generic} generic only)", path.display(), d.ops.len(), d.ops.len() - generic))
            })
            .collect()
    }
}
