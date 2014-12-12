use strict;
use Test::More;

use Map::Metro;

{
    my $graph = Map::Metro->new('Helsinki')->parse;
    my $routing = $graph->routing_for(qw/Kaisaniemi Rastila/);

    is $routing->get_route(0)->get_step(4)->origin_line_station->station->name, 'Kulosaari', 'Found step from Kulosaari';

}
{
    my $graph = Map::Metro->new('Helsinki', hooks => ['Helsinki::Swedish', 'StreamStations'])->parse;
    my $routing = $graph->routing_for('Gräsviken', 'Vuosaari');

    is $routing->get_route(0)->get_step(7)->origin_line_station->station->name, 'Brändö', 'Found step from Brändö';

    is $graph->get_plugin('StreamStations')->get_station_name(12), 'Gårdsbacka', 'Station indexed 12 is Gårdsbacka in swedish';

}

done_testing;
