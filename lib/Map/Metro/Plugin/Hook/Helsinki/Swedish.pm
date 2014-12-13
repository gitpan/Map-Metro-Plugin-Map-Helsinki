use Map::Metro::Standard::Moops;

class Map::Metro::Plugin::Hook::Helsinki::Swedish using Moose {

    use Map::Metro::Hook;
    use Encode qw/encode_utf8 decode_utf8/;
    use utf8;

    method register {
        before_add_station => sub {

            my $self = shift;
            my $station = shift;
            $station->set_name($self->station_translation($station->name));

        };
    }

    method station_translation($name) {
        my $to_swedish = {
            'Ruoholahti' => 'Gräsviken',
            'Kamppi' => 'Kampen',
            'Rautatientori' => 'Järnvägstorget',
            'Kaisaniemi' => 'Kajsaniemi',
            'Hakaniemi' => 'Hagnäs',
            'Sörnälnen' => 'Sörnäs',
            'Kalasatama' => 'Fiskhamnen',
            'Kulosaari' => 'Brändö',
            'Herttoniemi' => 'Hertonäs',
            'Siilitie' => 'Igelkottsvägen',
            'Itäkeskus' => 'Östra centrum',
            'Myllypuro' => 'Kvarnbäcken',
            'Kontula' => 'Gårdsbacka',
            'Mellunmäki' => 'Mellungsbacka',
            'Puotila' => 'Botby gård',
            'Rastila' => 'Rastböle',
            'Vuosaari' => 'Nordsjö',
        };
        return $to_swedish->{ $name } // $name;
    }

}

1;
