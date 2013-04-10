package Flux::Simple::ArrayOut;
{
  $Flux::Simple::ArrayOut::VERSION = '1.00';
}

use Moo;
with 'Flux::Out';

has '_data' => (
    is => 'ro',
    required => 1,
);

sub BUILDARGS {
    my $class = shift;
    my ($data) = @_;
    return { _data => $data };
}

sub write {
    my $self = shift;
    my ($item) = @_;
    push @{ $self->_data }, $item;
    return;
}

sub write_chunk {
    my $self = shift;
    my ($chunk) = @_;

    push @{ $self->_data }, @$chunk;
    return;
}

sub commit {}

1;

__END__

=pod

=head1 NAME

Flux::Simple::ArrayOut

=head1 VERSION

version 1.00

=head1 AUTHOR

Vyacheslav Matyukhin <me@berekuk.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
