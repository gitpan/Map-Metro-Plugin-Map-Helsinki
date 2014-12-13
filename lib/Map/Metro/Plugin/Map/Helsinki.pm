use 5.20.0;

package Map::Metro::Plugin::Map::Helsinki  {
$Map::Metro::Plugin::Map::Helsinki::VERSION = '0.1983';
use Moose;
    use File::ShareDir 'dist_dir';
    use Path::Tiny;
    with 'Map::Metro::Plugin::Map';

    has '+mapfile' => (
        default => sub { path(dist_dir('Map-Metro-Plugin-Map-Helsinki'))->child('map-helsinki.metro')->absolute },
    );
}

1;

__END__

=encoding utf-8

=head1 NAME

Map::Metro::Plugin::Map::Helsinki - Map::Metro map for Helsinki

=head1 SYNOPSIS

    use Map::Metro;
    my $graph = Map::Metro->new('Helsinki')->parse;

    my $graph2 = Map::Metro->new('Helsinki', hooks => 'Helsinki::Swedish')->parse;
    # now the station names are in Swedish

=head1 DESCRIPTION

See L<Map::Metro> for usage information.

This distribution also includes the C<Map::Metro::Plugin::Hook::Helsinki::Swedish> hook, which if applied
translates all station names into Swedish.

=head1 Status

Per 2014-dec-12 it contains the two branches of the Helsinki metro (L<wikipedia|https://en.wikipedia.org/wiki/Helsinki_Metro>)

=head1 AUTHOR

Erik Carlsson E<lt>info@code301.comE<gt>

=head1 COPYRIGHT

Copyright 2014 - Erik Carlsson

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
