#!/bin/bash
###
### SCRIPTNAME [ options ] a script to harden linux desktops
###
###	-h | --help			display this message and exit
###	-v | --verbose		run the script verbosely ( for debugging purposes ) 
###	-n | --noexec 		print but do not run the commands to harden the host
### -c | --checksum 	run a checksum on the script, display it, and exit
### -i | --install		install the script as a cron job from the client in question
###
### The script is run from: BASEDIR
### The script will cache files in the following directories:
###
###	+ BASEDIR/../cfg -- configuration files for exceptions
###	+ BASEDIR/../var -- log files and output of specific runs
###	+ BASEDIR/../bin -- this script and helper functions and code
###

display_help () {

  scriptname=$( basename $0 ) 
  startdir=$( ls -Ld $PWD ) 
  cat $0 | egrep -i '^###' | sed  's/^###//g' | \
  sed "s/SCRIPTNAME/$scriptname/g" | sed "s#BASEDIR#$startdir#g"
  exit 0

}

initialize_variables () {

  ${verboseflag}
  spacer="    "					 				&& export spacer
  base=$( ls -Ld $PWD )							&& export basedir
  installdir="/var/tmp/hardening"				&& export installdir
  bindir=${installdir}/bin						&& export bindir
  vardir=${installdir}/bin						&& export vardir
  cfgdir=${installdir}/bin						&& export cfgdir
}

initialize_environment () {

  ${verboseflag}
  mkdir -p $cfgdir $bindir $vardir

  
  
}

initialize_language_set () {

  ${verboseflag}
  # languages=$( egrep -i '\"(korean|chinese|english|japanese)\"' $langlist | \
  # egrep -vi alpha  | awk -F, '{print$1}' | sed 's/"//g' ) 
  languages=$( \
    egrep -i '\"(english|japanese)\"' $langlist | egrep -vi alpha  | \
    awk -F, '{print$1}' | sed 's/"//g' \
  ) 
  export languages

}

download_script () {

  ${verboseflag}

}

harden_host () {

  ${verboseflag}


}

process_output () {

  ${verboseflag}

}

main_logic () { 

  initialize_variables
  initialize_environment
  download_script
  harden_host
  process_output

}
  
while getopts "hvcni" options;
do
  case "${options}" in
    h)
      display_help
      exit 0
      ;;
    v)
      verboseflag='set -x'
      export verboseflag
      ;;
    o)
      checksumflag=TRUE
      export checksumflag
      ;;
	n)
      noexecflag=TRUE
      export noexecflag
      ;;	
	i)
      installflag=TRUE
      export installflag
      ;;	
    *)
      display_help
      exit 0
      ;;
  esac
done
shift $((OPTIND-1))

main_logic
