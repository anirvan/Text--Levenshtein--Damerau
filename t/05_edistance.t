use Test::Base;
use Text::Levenshtein::Damerau qw/edistance/;

plan tests => 1 * blocks;

filters {
    input    => [qw/chomp/],
    expected => [qw/chomp/],
};

run {
	my $block = shift;
	is( edistance('four',$block->input), $block->expected );
};

__END__

=== test matching
--- input
four
--- expected
0

=== test insertion
--- input
for
--- expected
1

=== test deletion
--- input
fourth
--- expected
2

=== test transposition
--- input
fuor
--- expected
1

=== test substitution
--- input
fxxr
--- expected
2

=== test case
--- input
FOuR
--- expected
3

=== test case match
--- input
FOUR
--- expected
4

=== test case
--- input
FOuR
--- expected
3

=== test empty
--- input

--- expected
4