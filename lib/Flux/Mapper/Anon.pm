package Flux::Mapper::Anon;
{
  $Flux::Mapper::Anon::VERSION = '1.00';
}

use Moo;
with 'Flux::Mapper::Easy';

has 'cb' => (
    is => 'ro',
    required => 1,
    # CODEREF
);

has 'commit_cb' => (
    is => 'ro',
    # CODEREF
    default => sub {
        sub { return }
    },
);

sub write {
    my ($self, $item) = @_;
    return $self->cb->($item);
}

sub commit {
    my ($self) = @_;
    return $self->commit_cb->();
}

1;

__END__

=pod

=head1 NAME

Flux::Mapper::Anon

=head1 VERSION

version 1.00

=head1 AUTHOR

Vyacheslav Matyukhin <me@berekuk.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
