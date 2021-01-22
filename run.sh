CONFIG_FILE=$1
INPUT_FILE=$2
cp $CONFIG_FILE X86-64-semantics/semantics/x86-configuration.k
cp $INPUT_FILE X86-64-semantics/build
(
cd X86-64-semantics/semantics
../scripts/run-single-s-file ../build/nfos.dis
)