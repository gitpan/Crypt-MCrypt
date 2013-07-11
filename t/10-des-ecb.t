use Test::Most 0.22;
use Crypt::MCrypt;

subtest "decryption using tripledes in ecb mode with nulls in iv" => sub {
    my $algorithm = "tripledes";
    my $mode      = "ecb";
    my $iv        = pack( "H*", "0000000000000000" );
    my $key       = pack( "H*",
        "1234567890123456" . "7890123456789012" . "1234567890123456" );
    my $cipher_text = pack( "H*",
            "E9FF3161EE05ABC9"
          . "7ea3cacb991318aa"
          . "585379599b0eaabb"
          . "c4e474ead1956f47"
          . "6755f13f1af5235d" );
    my $obj = Crypt::MCrypt->new(
        algorithm => $algorithm,
        mode      => $mode,
        key       => $key,
        iv        => $iv,
    );
    my $plain_text = $obj->decrypt($cipher_text);
    my $expected_plain_hex =
        "5231303000390006"
      . "d9cf0151da32abc9"
      . "39a3cd86dc554cfa"
      . "170079119b079b89"
      . "f7d041dce6ad5647";
    is $plain_text, pack( "H*", $expected_plain_hex ),
      "decrypted plaintext matched with expected plaintext";
};

subtest "encryption using tripledes in ecb mode with nulls in iv" => sub {
    my $algorithm = "tripledes";
    my $mode      = "ecb";
    my $iv        = pack( "H*", "0000000000000000" );
    my $key       = pack( "H*",
        "1234567890123456" . "7890123456789012" . "1234567890123456" );
    my $plain_text = pack( "H*",
            "5231303000390006"
          . "d9cf0151da32abc9"
          . "39a3cd86dc554cfa"
          . "170079119b079b89"
          . "f7d041dce6ad5647" );
    my $obj = Crypt::MCrypt->new(
        algorithm => $algorithm,
        mode      => $mode,
        key       => $key,
        iv        => $iv,
    );
    my $cipher_text = $obj->encrypt($plain_text);
    my $expected_cipher_hex =
        "E9FF3161EE05ABC9"
      . "7ea3cacb991318aa"
      . "585379599b0eaabb"
      . "c4e474ead1956f47"
      . "6755f13f1af5235d";
    is $cipher_text, pack( "H*", $expected_cipher_hex ),
      "encrypted ciphertext matched with expected ciphertext";
};
done_testing;
