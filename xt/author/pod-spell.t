use strict;
use warnings;
use Test::More;

# generated by Dist::Zilla::Plugin::Test::PodSpelling 2.006001
use Test::Spelling 0.12;
use Pod::Wordlist;

add_stopwords(<DATA>);
all_pod_files_spelling_ok(qw( bin lib  ));
__DATA__
shantanu
bhadoria
ciphertext
crypto
decrypt
libmcrypt
Shantanu
Bhadoria
at
cpan
dott
org
lib
Crypt
MCrypt
