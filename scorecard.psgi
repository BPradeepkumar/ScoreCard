use strict;
use warnings;

use ScoreCard;

my $app = ScoreCard->apply_default_middlewares(ScoreCard->psgi_app);
$app;

