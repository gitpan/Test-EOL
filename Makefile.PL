
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Check the correct line endings in your project',
  'AUTHOR' => 'Tomas Doran <bobtfish@bobtfish.net>, Arthur Axel \'fREW\' Schmidt <frioux@gmail.com>, Kent Fredric <kentfredric@gmail.com>, Florian Ragwitz <rafl@debian.org>',
  'BUILD_REQUIRES' => {
    'File::Temp' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Test-EOL',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Test::EOL',
  'PREREQ_PM' => {
    'File::Find' => '0',
    'File::Spec' => '0',
    'FindBin' => '0',
    'Test::Builder' => '0',
    'vars' => '0'
  },
  'VERSION' => '0.9',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



