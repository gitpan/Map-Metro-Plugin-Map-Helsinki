use Map::Metro::Standard::Moops;

class Map::Metro::Plugin::Hook::Helsinki::Swedish using Moose {

    use Map::Metro::Hook;
    use Encode qw/encode_utf8 decode_utf8/;

    method register {
        before_add_station => sub {

            my $self = shift;
            my $station = shift;

            $station->name($self->station_translation($station->name));

        };
    }

    method station_translation($name) {
        my $to_swedish = {
            decode_utf8('Ruoholahti') => 'Gräsviken',
            decode_utf8('Kamppi') => 'Kampen',
            decode_utf8('Rautatientori') => 'Järnvägstorget',
            decode_utf8('Kaisaniemi') => 'Kajsaniemi',
            decode_utf8('Hakaniemi') => 'Hagnäs',
            decode_utf8('Sörnälnen') => 'Sörnäs',
            decode_utf8('Kalasatama') => 'Fiskhamnen',
            decode_utf8('Kulosaari') => 'Brändö',
            decode_utf8('Herttoniemi') => 'Hertonäs',
            decode_utf8('Siilitie') => 'Igelkottsvägen',
            decode_utf8('Itäkeskus') => 'Östra centrum',
            decode_utf8('Myllypuro') => 'Kvarnbäcken',
            decode_utf8('Kontula') => 'Gårdsbacka',
            decode_utf8('Mellunmäki') => 'Mellungsbacka',
            decode_utf8('Puotila') => 'Botby gård',
            decode_utf8('Rastila') => 'Rastböle',
            decode_utf8('Vuosaari') => 'Nordsjö',
        };
        return $to_swedish->{ $name } // $name;
    }

}

1;
