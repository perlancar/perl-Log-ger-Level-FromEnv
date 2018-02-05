package Log::ger::Level::FromEnv;

# DATE
# VERSION

use Log::ger ();

if (my $ll = $ENV{LOG_LEVEL}) {
    if ($ll eq 'off' || $ll == 0) {
        $Log::ger::Current_Level = 0;
    } elsif ($ll eq 'fatal' || $ll == 10) {
        $Log::ger::Current_Level = 10;
    } elsif ($ll eq 'error' || $ll == 20) {
        $Log::ger::Current_Level = 20;
    } elsif ($ll eq 'warn' || $ll eq 'warning' || $ll == 30) {
        $Log::ger::Current_Level = 30;
    } elsif ($ll eq 'info' || $ll == 40) {
        $Log::ger::Current_Level = 40;
    } elsif ($ll eq 'debug' || $ll == 50) {
        $Log::ger::Current_Level = 50;
    } elsif ($ll eq 'trace' || $ll == 60) {
        $Log::ger::Current_Level = 60;
    }
} elsif ($ENV{TRACE}) {
    $Log::ger::Current_Level = 60;
} elsif ($ENV{DEBUG}) {
    $Log::ger::Current_Level = 50;
} elsif ($ENV{VERBOSE}) {
    $Log::ger::Current_Level = 40;
} elsif ($ENV{QUIET}) {
    $Log::ger::Current_Level = 20;
}

1;
# ABSTRACT: Set default log level from some environment variables

=head1 SYNOPSIS

 use Log::ger;
 use Log::ger::Level::FromEnv;

 log_warn "blah ...";


=head1 DESCRIPTION

This module sets C<$Log::ger::Current_Level> based on hints from several
environment variables: C<LOG_LEVEL> (for example, if set to C<warn> or
C<warning> will set the log level to warning (30)), C<TRACE> (if true, will set
log level to trace (60)), C<DEBUG> (if true, will set log level to debug (50)),
C<VERBOSE> (if true, will set log level to info (40)), C<QUIET> (if true, will
set log level to error (20)).

This is convenient for CLI programs.

=head1 SEE ALSO
