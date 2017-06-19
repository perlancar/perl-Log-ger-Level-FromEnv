package Log::ger::LevelFromEnv;

# DATE
# VERSION

use Log::ger ();

if (my $ll = $ENV{LOG_LEVEL}) {
    if ($ll eq 'off' || $ll == 0) {
        $Log::ger::Current_Level = 0;
    } elsif ($ll eq 'fatal' || $ll == 1) {
        $Log::ger::Current_Level = 1;
    } elsif ($ll eq 'error' || $ll == 2) {
        $Log::ger::Current_Level = 2;
    } elsif ($ll eq 'warn' || $ll eq 'warning' || $ll == 3) {
        $Log::ger::Current_Level = 3;
    } elsif ($ll eq 'info' || $ll == 4) {
        $Log::ger::Current_Level = 4;
    } elsif ($ll eq 'debug' || $ll == 5) {
        $Log::ger::Current_Level = 5;
    } elsif ($ll eq 'trace' || $ll == 6) {
        $Log::ger::Current_Level = 6;
    }
} elsif ($ENV{TRACE}) {
    $Log::ger::Current_Level = 6;
} elsif ($ENV{DEBUG}) {
    $Log::ger::Current_Level = 5;
} elsif ($ENV{VERBOSE}) {
    $Log::ger::Current_Level = 4;
} elsif ($ENV{QUIET}) {
    $Log::ger::Current_Level = 2;
}

1;
# ABSTRACT: Set default log level from some environment variables

=head1 SYNOPSIS

 use Log::ger;
 use Log::ger::LevelFromEnv;

 log_warn "blah ...";


=head1 DESCRIPTION

This module sets C<$Log::ger::Current_Level> based on hints from several
environment variables: C<LOG_LEVEL> (for example, if set to C<warn> or
C<warning> will set the log level to warning (3)), C<TRACE> (if true, will set
log level to trace (6)), C<DEBUG> (if true, will set log level to debug (5)),
C<VERBOSE> (if true, will set log level to info (4)), C<QUIET> (if true, will
set log level to error (2)).

This is convenient for CLI programs.

=head1 SEE ALSO
