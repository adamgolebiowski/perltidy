# **This script was automatically generated**
# Created with: ./make_t.pl
# Tue Jun 12 19:09:24 2018

# To locate test #13 for example, search for the string '#13'

use strict;
use Test;
use Carp;
use Perl::Tidy;
my $rparams;
my $rsources;
my $rtests;

BEGIN {

    #####################################
    # SECTION 1: Parameter combinations #
    #####################################
    $rparams = {
        'def'  => "",
        'tso'  => "-tso",
        'vmll' => <<'----------',
-vmll
-bbt=2
-bt=2
-pt=2
-sbt=2
----------
        'vtc' => <<'----------',
-sbvtc=2
-bvtc=2
-pvtc=2
----------
    };

    ######################
    # SECTION 2: Sources #
    ######################
    $rsources = {

        'syntax1' => <<'----------',
# Caused trouble:
print $x **2;
----------

        'syntax2' => <<'----------',
# ? was taken as pattern
my $case_flag = File::Spec->case_tolerant ? '(?i)' : '';
----------

        'ternary1' => <<'----------',
my $flags =
  ( $_ & 1 ) ? ( $_ & 4 ) ? $THRf_DEAD : $THRf_ZOMBIE :
  ( $_ & 4 ) ? $THRf_R_DETACHED : $THRf_R_JOINABLE;
----------

        'ternary2' => <<'----------',
my $a=($b) ? ($c) ? ($d) ? $d1
                         : $d2
                  : ($e) ? $e1
                         : $e2
           : ($f) ? ($g) ? $g1
                         : $g2
                  : ($h) ? $h1
                         : $h2;
----------

        'tick1' => <<'----------',
sub a'this { $p'u'a = "mooo\n"; print $p::u::a; }
a::this();       # print "mooo"
print $p'u'a;    # print "mooo"
sub a::that {
    $p't'u = "wwoo\n";
    return sub { print $p't'u}
}
$a'that = a'that();
$a'that->();     # print "wwoo"
$a'that  = a'that();
$p::t::u = "booo\n";
$a'that->();     # print "booo"
----------

        'trim_quote' => <<'----------',
# space after quote will get trimmed
    push @m, '
all :: pure_all manifypods
	' . $self->{NOECHO} . '$(NOOP)
' 
      unless $self->{SKIPHASH}{'all'};
----------

        'tso1' => <<'----------',
print 0+ '42 EUR';    # 42
----------

        'tutor' => <<'----------',
#!/usr/bin/perl
$y=shift||5;for $i(1..10){$l[$i]="T";$w[$i]=999999;}while(1){print"Name:";$u=<STDIN>;$t=50;$a=time;for(0..9){$x="";for(1..$y){$x.=chr(int(rand(126-33)+33));}while($z ne $x){print"\r\n$x\r\n";$z=<STDIN>;chomp($z);$t-=5;}}$b=time;$t-=($b-$a)*2;$t=0-$t;$z=1;@q=@l;@p=@w;print "You scored $t points\r\nTopTen\r\n";for $i(1..10){if ($t<$p[$z]){$l[$i]=$u;chomp($l[$i]);$w[$i]=$t;$t=1000000}else{$l[$i]=$q[$z];$w[$i]=$p[$z];$z++;}print $l[$i],"\t",$w[$i],"\r\n";}}
----------

        'undoci1' => <<'----------',
        $rinfo{deleteStyle} = [
            -fill      => 'red',
              -stipple => '@' . Tk->findINC('demos/images/grey.25'),
        ];
----------

        'use1' => <<'----------',
# previously this caused an incorrect error message after '2.42'
use lib "$Common::global::gInstallRoot/lib";
use CGI 2.42 qw(fatalsToBrowser);
use RRDs 1.000101;

# the 0666 must expect an operator
use constant MODE => do { 0666 & ( 0777 & ~umask ) };

use IO::File ();
----------

        'use2' => <<'----------',
# Keep the space before the '()' here:
use Foo::Bar ();
use Foo::Bar ();
use Foo::Bar 1.0 ();
use Foo::Bar qw(baz);
use Foo::Bar 1.0 qw(baz);
----------

        'version1' => <<'----------',
# VERSION statement unbroken, no semicolon added; 
our $VERSION = do { my @r = ( q$Revision: 2.2 $ =~ /\d+/g ); sprintf "%d." . "%02d" x $#r, @r }
----------

        'version2' => <<'----------',
# On one line so MakeMaker will see it.
require Exporter; our $VERSION = $Exporter::VERSION;
----------

        'vert' => <<'----------',
# if $w->vert is tokenized as type 'U' then the ? will start a quote
# and an error will occur.
sub vert {
}
sub Restore {
    $w->vert ? $w->delta_width(0) : $w->delta_height(0);
}
----------

        'vmll' => <<'----------',
    # perltidy -act=2 -vmll will leave these intact and greater than 80 columns
    # in length, which is what vmll does
    BEGIN {is_deeply(\@init_metas_called, [1]) || diag(Dumper(\@init_metas_called))}

    This has the comma on the next line
    exception {Class::MOP::Class->initialize("NonExistent")->rebless_instance($foo)},
----------

        'vtc1' => <<'----------',
@lol = (
        [   'Dr. Watson', undef,    '221b', 'Baker St.',
            undef,        'London', 'NW1',  undef,
            'England',    undef
        ],
        [   'Sam Gamgee', undef,      undef, 'Bagshot Row',
            undef,        'Hobbiton', undef, undef,
            'The Shire',  undef],
        );
----------

        'vtc2' => <<'----------',
    ok(
        $s->call(
            SOAP::Data->name('getStateName')
              ->attr( { xmlns => 'urn:/My/Examples' } ),
            1
        )->result eq 'Alabama'
    );
----------
    };

    ##############################
    # SECTION 3: Expected output #
    ##############################
    $rtests = {

        'syntax1.def' => {
            source => "syntax1",
            params => "def",
            expect => <<'#1...........',
# Caused trouble:
print $x **2;
#1...........
        },

        'syntax2.def' => {
            source => "syntax2",
            params => "def",
            expect => <<'#2...........',
# ? was taken as pattern
my $case_flag = File::Spec->case_tolerant ? '(?i)' : '';
#2...........
        },

        'ternary1.def' => {
            source => "ternary1",
            params => "def",
            expect => <<'#3...........',
my $flags =
    ( $_ & 1 )
  ? ( $_ & 4 )
      ? $THRf_DEAD
      : $THRf_ZOMBIE
  : ( $_ & 4 ) ? $THRf_R_DETACHED
  :              $THRf_R_JOINABLE;
#3...........
        },

        'ternary2.def' => {
            source => "ternary2",
            params => "def",
            expect => <<'#4...........',
my $a =
    ($b)
  ? ($c)
      ? ($d)
          ? $d1
          : $d2
      : ($e) ? $e1
    : $e2
  : ($f) ? ($g)
      ? $g1
      : $g2
  : ($h) ? $h1
  :        $h2;
#4...........
        },

        'tick1.def' => {
            source => "tick1",
            params => "def",
            expect => <<'#5...........',
sub a'this { $p'u'a = "mooo\n"; print $p::u::a; }
a::this();       # print "mooo"
print $p'u'a;    # print "mooo"

sub a::that {
    $p't'u = "wwoo\n";
    return sub { print $p't'u}
}
$a'that = a'that();
$a'that->();     # print "wwoo"
$a'that  = a'that();
$p::t::u = "booo\n";
$a'that->();     # print "booo"
#5...........
        },

        'trim_quote.def' => {
            source => "trim_quote",
            params => "def",
            expect => <<'#6...........',
    # space after quote will get trimmed
    push @m, '
all :: pure_all manifypods
	' . $self->{NOECHO} . '$(NOOP)
'
      unless $self->{SKIPHASH}{'all'};
#6...........
        },

        'tso1.def' => {
            source => "tso1",
            params => "def",
            expect => <<'#7...........',
print 0 + '42 EUR';    # 42
#7...........
        },

        'tso1.tso' => {
            source => "tso1",
            params => "tso",
            expect => <<'#8...........',
print 0+ '42 EUR';    # 42
#8...........
        },

        'tutor.def' => {
            source => "tutor",
            params => "def",
            expect => <<'#9...........',
#!/usr/bin/perl
$y = shift || 5;
for $i ( 1 .. 10 ) { $l[$i] = "T"; $w[$i] = 999999; }
while (1) {
    print "Name:";
    $u = <STDIN>;
    $t = 50;
    $a = time;
    for ( 0 .. 9 ) {
        $x = "";
        for ( 1 .. $y ) { $x .= chr( int( rand( 126 - 33 ) + 33 ) ); }
        while ( $z ne $x ) {
            print "\r\n$x\r\n";
            $z = <STDIN>;
            chomp($z);
            $t -= 5;
        }
    }
    $b = time;
    $t -= ( $b - $a ) * 2;
    $t = 0 - $t;
    $z = 1;
    @q = @l;
    @p = @w;
    print "You scored $t points\r\nTopTen\r\n";

    for $i ( 1 .. 10 ) {
        if ( $t < $p[$z] ) {
            $l[$i] = $u;
            chomp( $l[$i] );
            $w[$i] = $t;
            $t = 1000000;
        }
        else { $l[$i] = $q[$z]; $w[$i] = $p[$z]; $z++; }
        print $l[$i], "\t", $w[$i], "\r\n";
    }
}
#9...........
        },

        'undoci1.def' => {
            source => "undoci1",
            params => "def",
            expect => <<'#10...........',
        $rinfo{deleteStyle} = [
            -fill    => 'red',
            -stipple => '@' . Tk->findINC('demos/images/grey.25'),
        ];
#10...........
        },

        'use1.def' => {
            source => "use1",
            params => "def",
            expect => <<'#11...........',
# previously this caused an incorrect error message after '2.42'
use lib "$Common::global::gInstallRoot/lib";
use CGI 2.42 qw(fatalsToBrowser);
use RRDs 1.000101;

# the 0666 must expect an operator
use constant MODE => do { 0666 & ( 0777 & ~umask ) };

use IO::File ();
#11...........
        },

        'use2.def' => {
            source => "use2",
            params => "def",
            expect => <<'#12...........',
# Keep the space before the '()' here:
use Foo::Bar ();
use Foo::Bar ();
use Foo::Bar 1.0 ();
use Foo::Bar qw(baz);
use Foo::Bar 1.0 qw(baz);
#12...........
        },

        'version1.def' => {
            source => "version1",
            params => "def",
            expect => <<'#13...........',
# VERSION statement unbroken, no semicolon added;
our $VERSION = do { my @r = ( q$Revision: 2.2 $ =~ /\d+/g ); sprintf "%d." . "%02d" x $#r, @r }
#13...........
        },

        'version2.def' => {
            source => "version2",
            params => "def",
            expect => <<'#14...........',
# On one line so MakeMaker will see it.
require Exporter; our $VERSION = $Exporter::VERSION;
#14...........
        },

        'vert.def' => {
            source => "vert",
            params => "def",
            expect => <<'#15...........',
# if $w->vert is tokenized as type 'U' then the ? will start a quote
# and an error will occur.
sub vert {
}

sub Restore {
    $w->vert ? $w->delta_width(0) : $w->delta_height(0);
}
#15...........
        },

        'vmll.def' => {
            source => "vmll",
            params => "def",
            expect => <<'#16...........',
    # perltidy -act=2 -vmll will leave these intact and greater than 80 columns
    # in length, which is what vmll does
    BEGIN {
        is_deeply( \@init_metas_called, [1] )
          || diag( Dumper( \@init_metas_called ) );
    }

    This has the comma on the next line exception {
        Class::MOP::Class->initialize("NonExistent")->rebless_instance($foo)
    },
#16...........
        },

        'vmll.vmll' => {
            source => "vmll",
            params => "vmll",
            expect => <<'#17...........',
    # perltidy -act=2 -vmll will leave these intact and greater than 80 columns
    # in length, which is what vmll does
    BEGIN {is_deeply(\@init_metas_called, [1]) || diag(Dumper(\@init_metas_called))}

    This has the comma on the next line exception {
        Class::MOP::Class->initialize("NonExistent")->rebless_instance($foo)
    },
#17...........
        },

        'vtc1.def' => {
            source => "vtc1",
            params => "def",
            expect => <<'#18...........',
@lol = (
    [
        'Dr. Watson', undef,    '221b', 'Baker St.',
        undef,        'London', 'NW1',  undef,
        'England',    undef
    ],
    [
        'Sam Gamgee', undef,      undef, 'Bagshot Row',
        undef,        'Hobbiton', undef, undef,
        'The Shire',  undef
    ],
);
#18...........
        },

        'vtc1.vtc' => {
            source => "vtc1",
            params => "vtc",
            expect => <<'#19...........',
@lol = (
    [
        'Dr. Watson', undef,    '221b', 'Baker St.',
        undef,        'London', 'NW1',  undef,
        'England',    undef ],
    [
        'Sam Gamgee', undef,      undef, 'Bagshot Row',
        undef,        'Hobbiton', undef, undef,
        'The Shire',  undef ], );
#19...........
        },

        'vtc2.def' => {
            source => "vtc2",
            params => "def",
            expect => <<'#20...........',
    ok(
        $s->call(
            SOAP::Data->name('getStateName')
              ->attr( { xmlns => 'urn:/My/Examples' } ),
            1
        )->result eq 'Alabama'
    );
#20...........
        },
    };

    my $ntests = 0 + keys %{$rtests};
    plan tests => $ntests;
}

foreach my $key ( sort keys %{$rtests} ) {
    my $output;
    my $sname  = $rtests->{$key}->{source};
    my $expect = $rtests->{$key}->{expect};
    my $pname  = $rtests->{$key}->{params};
    my $source = $rsources->{$sname};
    my $params = defined($pname) ? $rparams->{$pname} : "";
    my $stderr_string;
    my $errorfile_string;
    my $err = Perl::Tidy::perltidy(
        source      => \$source,
        destination => \$output,
        perltidyrc  => \$params,
        argv        => '',             # for safety; hide any ARGV from perltidy
        stderr      => \$stderr_string,
        errorfile => \$errorfile_string,    # not used when -se flag is set
    );
    if ( $err || $stderr_string || $errorfile_string ) {
        if ($err) {
            print STDERR
"This error received calling Perl::Tidy with '$sname' + '$pname'\n";
            ok( !$err );
        }
        if ($stderr_string) {
            print STDERR "---------------------\n";
            print STDERR "<<STDERR>>\n$stderr_string\n";
            print STDERR "---------------------\n";
            print STDERR
"This error received calling Perl::Tidy with '$sname' + '$pname'\n";
            ok( !$stderr_string );
        }
        if ($errorfile_string) {
            print STDERR "---------------------\n";
            print STDERR "<<.ERR file>>\n$errorfile_string\n";
            print STDERR "---------------------\n";
            print STDERR
"This error received calling Perl::Tidy with '$sname' + '$pname'\n";
            ok( !$errorfile_string );
        }
    }
    else {
        ok( $output, $expect );
    }
}
