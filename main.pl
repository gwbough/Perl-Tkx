use strict;
use warnings;
use Tkx;

sub main
{
    my $mainWindow = Tkx::widget->new(".");
    $mainWindow->g_wm_title("FixViewer");
    $mainWindow->g_wm_minsize(100,100);

    my $contentFrame = $mainWindow->new_ttk__frame(-padding => "3 3 12 12");
    $contentFrame->g_grid(-column => 0, -row => 0, -sticky => "nwes");
    $mainWindow->g_grid_columnconfigure(0, -weight => 1);
    $mainWindow->g_grid_rowconfigure(0, -weight => 1);

    my $input;
    my $output;

    #create a textbox where user can enter input
    my $inputbox = $contentFrame->new_ttk__entry(-width => 7, -textvariable => \$input);
    $inputbox->g_grid(-column => 1, -row => 1, -sticky => "we");

    #create a lable which shows whatever is input in the input box
    my $inputlabel = $contentFrame->new_ttk__label(-textvariable => \$output);
    $inputlabel->g_grid(-column => 1, -row => 2, -sticky => "we");

    #create a button and bind a sub to it
    my $button = $contentFrame->new_ttk__button(-text=> "Click me",-command=> sub {dostuff(\$output,\$input);} );
    $button->g_grid(-column => 1, -row => 3, -sticky => "w");

    #bind return key to method, so method will get called when key is hit
    $mainWindow->g_bind("<Return>",sub {dostuff(\$output,\$input);});

    Tkx::MainLoop;
}

sub dostuff
{
    my $output = shift;
    my $input = shift;
    $$output = $$input;
}
