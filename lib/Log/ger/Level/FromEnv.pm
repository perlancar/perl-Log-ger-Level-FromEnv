package Log::ger::Level::FromEnv;

# AUTHORITY
# DATE
# DIST
# VERSION

use Log::ger::Util;

if (defined($ll = $ENV{LOG_LEVEL})) {
    Log::ger::Util::set_level($ll);
} elsif ($ENV{TRACE}) {
    Log::ger::Util::set_level("trace");
} elsif ($ENV{DEBUG}) {
    Log::ger::Util::set_level("debug");
} elsif ($ENV{VERBOSE}) {
    Log::ger::Util::set_level("info");
} elsif ($ENV{QUIET}) {
    Log::ger::Util::set_level("error");
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

This is convenient for CLI programs or one-liners.


=head1 SEE ALSO

L<Log::ger::App>

L<Log::ger::Screen>
