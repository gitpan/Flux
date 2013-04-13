package Flux::In::Role::Easy;
{
  $Flux::In::Role::Easy::VERSION = '1.01';
}

# ABSTRACT: role to implement input streams with only one read() method

use Moo::Role;
with 'Flux::In';

sub read_chunk {
    my $self = shift;
    my ($limit) = @_;

    my @chunk;
    while (defined($_ = $self->read)) {
        push @chunk, $_;
        last if @chunk >= $limit;
    }
    return unless @chunk; # return false if nothing can be read
    return \@chunk;
}

sub commit {
}

1;

__END__

=pod

=head1 NAME

Flux::In::Role::Easy - role to implement input streams with only one read() method

=head1 VERSION

version 1.01

=head1 AUTHOR

Vyacheslav Matyukhin <me@berekuk.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
