requires 'perl', '5.020000';

requires 'Map::Metro', '0.1700';
requires 'Encode';

on 'test' => sub {
    requires 'Test::NoTabs';
};
