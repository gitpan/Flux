package Flux::Out::Role::Easy;
{
  $Flux::Out::Role::Easy::VERSION = '1.02';
}

# ABSTRACT: role to implement output streams with only one write() method

use Moo::Role;
with 'Flux::Out';

sub write_chunk {
    my $self = shift;
    my ($chunk, @extra) = @_;

    die "write_chunk method expects arrayref, you specified: '$chunk'" unless ref($chunk) eq 'ARRAY'; # can chunks be blessed into something?
    for my $item (@$chunk) {
        $self->write($item, @extra);
    }
    return;
}

sub commit {
}

1;

__END__

=pod

=head1 NAME

Flux::Out::Role::Easy - role to implement output streams with only one write() method

=head1 VERSION

version 1.02

=head1 AUTHOR

Vyacheslav Matyukhin <me@berekuk.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
