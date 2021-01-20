INPUT_FILE=$1
cp $1 X86-64-semantics/semantics/x86-configuration.k
(
cd X86-64-semantics/semantics
../scripts/run-single-s-file ../build/nfos.dis
)