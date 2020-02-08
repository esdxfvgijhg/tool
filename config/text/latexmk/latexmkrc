
#$ENV{'PREVIEW_PDF'} //= 0;
#$ENV{'CONTINUOUS_PREVIEW'} //= 0;
#$ENV{'OUTPUT_PDF_NAME'} //= %S;
#$ENV{'SILENT'} //= 1;

#if ($^O =~ /darwin/) {
#   if ($ENV{'SILENT'} ==0) { print "DIAGNOSTICS = Operating System Detected: Mac OSX\n"; }
#   $ENV{'PREVIEW_PROGRAM'} //= 'preview';
#   $filesep = '/'
#} elsif ($^O =~ /MSWin32/) {
#   if ($ENV{'SILENT'} ==0) { print "DIAGNOSTICS = Operating System: Windows\n"; }
#   $ENV{'PREVIEW_PROGRAM'} //= 'gsview32';
#   $filesep = '\\'
#} elsif ($^O =~ /linux/) {
#   if ($ENV{'SILENT'} ==0) { print "DIAGNOSTICS = Operating System: Linux\n"; }
#   $ENV{'PREVIEW_PROGRAM'} //= 'evince';
#   $filesep = '/'
#}

#$ENV{'PREVIEW_PROGRAM'} //= 'DEFAULT';

#$success_cmd = "python $ENV{'BUILDPDF_PATH'} '$ENV{'INPUT_SOURCE_PATH'}' --latexmk-passthrough-success -o '$ENV{'OUTPUT_PDF_NAME'}'";

#$compiling_cmd = "";

#$failure_cmd = "python $ENV{'BUILDPDF_PATH'} '$ENV{'INPUT_SOURCE_PATH'}' --latexmk-passthrough-fail";

## Check if continuous preview watch is enabled
#if ($ENV{'CONTINUOUS_PREVIEW'} == 1) {   
#   $preview_continuous_mode=1;
#   if ($ENV{'SILENT'} ==0) { print "DIAGNOSTICS = Continuous Preview ENABLED\n"; }
#} else {
#   $preview_continuous_mode = 0;
#}

#if ($ENV{'PREVIEW_PDF'} == 1) { 
#   if ($ENV{'CONTINUOUS_PREVIEW'} == 0) { 
#      $preview_mode = 1;
#   }
#   # Check to see if there is a defined viewer program to use
#   if ($ENV{'PREVIEW_PROGRAM'} ne "DEFAULT") {
#      if ($^O =~ /darwin/) { # Mac
#         # -g option keeps the focus on the window which called the build
#         # -a option to specify what application to use
#         $pdf_previewer = "start evince %O %S";
#      } elsif ($^O =~ /MSWin32/) { # Windows
#         # Use the windows start command to call default PDF viewer
#         $pdf_previewer = "start evince %O %S";
#      } elsif ($^O =~ /linux/) { # Linux
#         # Call the program directly
#         $pdf_previewer = "start evince %O %S";
#      }
#   }
#   if ($ENV{'SILENT'} ==0) { print "DIAGNOSTICS = Preview ENABLED with Program: $ENV{'PREVIEW_PROGRAM'}\n"; }

#   # Type of file to view
#   $view="pdf";
#} else {
#   $preview_mode = 0;
#   $view="none";
#}

#$pdflatex = 'internal buildPDF %O %S';
#$pdflatex_silent_switch = '';

#sub buildPDF {
#   my @args = @_;
#   return system "python", "$ENV{'BUILDPDF_PATH'}","$ENV{'INPUT_SOURCE_PATH'}", "--latexmk-passthrough-build", "-interaction=nonstopmode @args";
#}

## Add glossary dependency to build glossaries
#add_cus_dep('glo', 'gls', 0, 'makeglossaries');

## Add acronym dependency to build glossaries
#add_cus_dep('acn', 'acr', 0, 'makeglossaries');

#sub makeglossaries {
#   my ($base_name, $path) = fileparse( $_[0] );
#   pushd $path;
#   if ( $silent ) {
#      my $return = system "makeglossaries -q $base_name";
#   } else {
#      my $return = system "makeglossaries $base_name";
#   };
#   popd;
#   return $return;
#}

#rajoute des extensions à celles identifiant les fichiers auxiliaires
#@generated_exts = (@generated_exts, 'synctex.gz');
#push @generated_exts, "nav","snm","run.xml" ;

#$clean_ext = 'pdfsync synctex.gz';
#$clean_ext= 'tex.bak tex~ bib~' ;
#$silent     = $ENV{'SILENT'}; # Run latexmk silently, not output to text
#$quiet      = $ENV{'SILENT'};
#$bibtex_use = 1; # Use bibtex if an appropriate *.bib file exists
#$force_mode = 0; # If nonzero, continue processing past minor latex errors including unrecognized cross references
#$bibtex     = "bibtex %S > '$ENV{'TMPDIR'}'${filesep}bibtex.out";


use Term::ANSIColor;
$color = 'red';

print color($color);

{
    no warnings 'redefine';
    sub Run_msg {
        # Same as Run, but give message about my running
        print color('reset'); # NEW LINE-----
        warn_running( "Running '$_[0]'" );
        my $time1 = processing_time();
        my ($pid, $return) = Run($_[0]);
        print color($color); # NEW LINE------
        my $time = processing_time() - $time1;
        push @timings, "'$_[0]': time = $time\n"; 
        return ($pid, $return);
    } #END Run_msg
}





$recorder   = 1; # Create file containing a list of the files that these programs have read and written
$pdf_mode   = 1; # Generate a pdf version of the document using pdflatex

$aux_dir = ".bin"; # Define all output directories to be "tmp"
$tmpdir  = ".bin";
$out_dir = '.bin';

$pdf_mode=1;
$pdf_update_method = 1;
#$preview_mode   = "1";

$dvi_previewer = 'start xdvi -watchfile 1.5';
$ps_previewer  = 'start gv --watch';
$pdf_previewer = 'start evince %O %S';
$postscript_mode = $dvi_mode = 0;

$latex    = 'latex  -shell-escape -synctex=1 --src-specials -interaction=nonstopmode -halt-on-error %O %S';
$pdflatex ="lualatex -shell-escape -synctex=1 --src-specials -interaction=nonstopmode -halt-on-error %O %S";
$pdflatex .= '&& (cp "%D" "%R.pdf"; cp "%Z%R.synctex.gz" "%R.synctex.gz")';

$biber = 'biber %O %S';
$recorder = 1 ;
$sleep_time= 2 ;




