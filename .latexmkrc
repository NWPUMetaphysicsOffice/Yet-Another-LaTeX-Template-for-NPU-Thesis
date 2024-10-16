################
# nomenclature #
################
push @generated_exts, 'nlo', 'nls';
add_cus_dep("nlo", "nls", 0, "nlo2nls");
sub nlo2nls {
        system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}
