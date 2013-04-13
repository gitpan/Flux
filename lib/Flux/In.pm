package Flux::In;
{
  $Flux::In::VERSION = '1.02';
}

# ABSTRACT: input stream role

use Moo::Role;

requires 'read';

requires 'read_chunk';

requires 'commit';


1;

__END__

=pod

=head1 NAME

Flux::In - input stream role

=head1 VERSION

version 1.02

=head1 SYNOPSIS

    $line = $in->read;
    $chunk = $in->read_chunk($limit);
    $in->commit;

=head1 DESCRIPTION

C<Flux::In> is the role which every reading stream must implement.

Consumers must implement C<read>, C<read_chunk> and C<commit> methods.

=head1 INTERFACE

=over

=item B<read()>

Get the next item from the stream.

Returns undef when there's no data left.

=item B<read_chunk($limit)>

Get the new chunk with items. Chunk is an arrayref with items, ordered as if C<read()> was invoked several times.

C<$limit> is a recommendation. Most input streams respect it and return exactly this number of items in chunk, but some don't. So if you get a chunk with 1 item when you asked for 5, don't treat it as a sign that you don't need to read further. Read until you get an undef or an empty chunk.

=item B<commit()>

Commit input stream's position.

Generally, successful commit means that you can restart your program and continue from the same position next time. Although some streams don't support position at all, for example, C<array_in> from L<Stream::Simple>.

Stream's author should make sure that stream is still readable after this.

=back

=head1 AUTHOR

Vyacheslav Matyukhin <me@berekuk.ru>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Yandex LLC.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
