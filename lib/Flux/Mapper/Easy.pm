package Flux::Mapper::Easy;
{
  $Flux::Mapper::Easy::VERSION = '1.00';
}

use Moo::Role;
with 'Flux::Mapper';

sub write_chunk {
    my ($self, $chunk) = @_;
    die "write_chunk method expects arrayref, you specified: '$chunk'" unless ref($chunk) eq 'ARRAY'; # can chunks be blessed into something?
    my @result_chunk;
    for my $item (@$chunk) {
        push @result_chunk, $self->write($item);
    }
    return \@result_chunk;
}

sub commit {
    return ();
}

1;

__END__

=pod

=head1 NAME

Flux::Mapper::Easy

=head1 VERSION

version 1.00

=head1 AUTHOR

Vyacheslav Matyukhin <me@berekuk.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
