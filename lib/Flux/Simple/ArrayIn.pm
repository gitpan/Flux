package Flux::Simple::ArrayIn;
{
  $Flux::Simple::ArrayIn::VERSION = '1.00';
}

use Moo;
with 'Flux::In';

has '_data' => (
    is => 'ro',
    required => 1,
);

sub BUILDARGS {
    my $class = shift;
    my ($data) = @_;
    return { _data => $data };
}

sub read {
    my $self = shift;
    return shift @{ $self->_data };
}

sub read_chunk {
    my $self = shift;
    my ($number) = @_;

    return unless @{ $self->_data };
    return [ splice @{ $self->_data }, 0, $number ];
}

sub commit {}

1;

__END__

=pod

=head1 NAME

Flux::Simple::ArrayIn

=head1 VERSION

version 1.00

=head1 AUTHOR

Vyacheslav Matyukhin <me@berekuk.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
