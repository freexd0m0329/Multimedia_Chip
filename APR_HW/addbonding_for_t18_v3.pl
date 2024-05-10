#! /usr/bin/perl 
######################################################################
#   Calculate bonding pads location from placed def   
#   Generate ECO file for SOC Encounter
#   Version 2.0
#                                         Nian Shyang Chang 071225
######################################################################
#Modify
# v3.20100525 clhuang NOT Perform linear place with inner pad at side
# v3.20100109	Neal		Bug fix
# v3.20091023 clhuang add routing blockage and output addRouteBlk.cmd 
# v3.20100308 clhuang write out bonding info to bonding company
#To do
# v3.20091023 clhunag power label for multi-domain vdd
# v3.20091023 clhuang fix routing blockage top metel info. in io.list

if (@ARGV != 1) {
    print <<USAGE_doc;

**********************************************************************
**     Before using this program, you must prepare an IO pad list file 
** named io.list. This file list all the io pads in the IO library.
** You can find it in the design kit library. 
**     This program calculate the bonding pads location to be added  
** from a routed DEF and generate a file named "addbond.cmd" of adding 
** instruction for SOC Encounter. 
** To execute it, type "source addbond.cmd" under SOC Encounter terminal. 
**********************************************************************

    Usage: $0 routed_def 

USAGE_doc

    exit(1);
}      

my $defName = shift;
    # $innerBPad $outerBPad $chipLeft $chipRight $chipUp $chipDown $designName
    # global vars: $unitdm 
my ($ioPadHash,$innerBPad,$outerBPad,$linearBPad,$BPadSetting) = readIOPadList("io.list");

my ($WestPads,$EastPads,$NorthPads,$SouthPads,$chipLeft,$chipRight,$chipUp,
    $chipDown,$designName,$unitdm)=readDEF($defName,$ioPadHash);
#&adjustUnitDistanceMicron($innerBPad,$outerBPad,$linearBPad,$unitdm);


print "\nOverwrite files addbond.cmd......\n\n";
print "\nOverwrite files addRouteBlk.cmd......\n\n";
open (cmdfile,"> bonding.info");	    
close(cmdfile);

createCMDFile($designName, $WestPads, $EastPads, $NorthPads, $SouthPads, $BPadSetting,$innerBPad,$outerBPad,$linearBPad,$ioPadHash);

print "\nCreate finish, you can execute it at SOC Encounter terminal: \n\n";
print "If you are setting routing blockage:\n";
print "Encounter> source addRouteBlk.cmd\n\n";
print "If you are adding bonding pad:\n";
print "Encounter> source addbond.cmd\n\n";

exit(0);

#=========     main program end ==========
sub readIOPadList(){
    my ($padListFile) = @_;
    open (ioPadList, $padListFile)|| die ("Error: Failed to open pad description file\n");
    my %ioPadHash = ();
    my $innerBPad;
    my $outerBPad;
    my $linearBPad;
    my %BPadSetting = ();
    my $innerBPadName;
    my $outerBPadName;
    my $linearBPadName;
    while (<ioPadList>){
        chomp;
        s/#.*$//;
        next if(/^[\s\t]*$/);
        ($keyword,$value1,$value2,$value3,$value4,$value5,$value6)=split(/[\s\t]+/);
        if ($keyword =~ /Linear_IOPad_Length/i) {
            $linearIOPadLength = $value1;
        }elsif ($keyword =~ /Stagger_IOPad_Length/i) {
            $staggerIOPadLength = $value1;
        }elsif($keyword =~ /Inner_Bond_Name/i){
            $innerBPadName = $value1;
        }elsif($keyword =~ /Outer_Bond_Name/i){
            $outerBPadName = $value1;
        }elsif($keyword =~ /Linear_Bond_Name/i){
            $linearBPadName = $value1;
        }elsif($keyword =~ /South_Left_Start/i){
            $BPadSetting{south}->{start} = $value1;
        }elsif($keyword =~ /North_Left_Start/i){
            $BPadSetting{north}->{start} = $value1;
        }elsif($keyword =~ /West_Down_Start/i){
            $BPadSetting{west}->{start} = $value1;
        }elsif($keyword =~ /East_Down_Start/i){
            $BPadSetting{east}->{start} = $value1;
        }elsif($keyword =~ /North_Pad_Use/i){
            $BPadSetting{north}->{type} = $value1;
        }elsif($keyword =~ /West_Pad_Use/i){
            $BPadSetting{west}->{type} = $value1;
        }elsif($keyword =~ /East_Pad_Use/i){
            $BPadSetting{east}->{type} = $value1;
        }elsif($keyword =~ /South_Pad_Use/i){
            $BPadSetting{south}->{type} = $value1;
        }elsif($keyword =~ /\w+/){
            my $isBPad=0;
            if ($keyword eq $innerBPadName){
                $innerBPad= {"name"=>$keyword,"length"=>$value1,"lin_pitch"=>$value2,"stg_pitch"=>$value3,"ovlap"=>$value4,"cntr_offset"=>$value5,"width"=>$value6};
                $isBPad=1;
            }
            if ($keyword eq $outerBPadName){
                $outerBPad= {"name"=>$keyword,"length"=>$value1,"lin_pitch"=>$value2,"stg_pitch"=>$value3,"ovlap"=>$value4,"cntr_offset"=>$value5,"width"=>$value6};
                $isBPad=1;
            }
            if ($keyword eq $linearBPadName){
                $linearBPad= {"name"=>$keyword,"length"=>$value1,"lin_pitch"=>$value2,"stg_pitch"=>$value3,"ovlap"=>$value4,"cntr_offset"=>$value5,"width"=>$value6};
                $isBPad=1;
            }
            next if ($isBPad==1);
            $ioPadHash{$keyword} = {slot=>$value1,fstpin_cntr=>$value2,sndpin_cntr=>$value3,width=>$value4};
        }
    }
    close(ioPadList);
    return(\%ioPadHash,$innerBPad,$outerBPad,$linearBPad,\%BPadSetting);
}

sub readDEF(){
    my ($defName,$ioPadHash) = @_;
    my $unit_distance_microns = 0;
    open (routedDef, $defName) || die ("Error: Failed to open $defName\n");
    while (<routedDef>){
        chomp;
        if(/^UNITS DISTANCE MICRONS/i){
            s/\s+/ /g;
            $unit_distance_microns = (split(/\s/))[3]; 
            last;
        }
    }
    close (routedDef);
    if ($unit_distance_microns ==0){
        printf ("Error, Can't find UNIT DISTANCE MICRONS in def, set to 1000\n");
        $unit_distance_microns=1000;
    }

    open (routedDef, $defName) || die ("Error: Failed to open $defName\n");
    my @WestPads = ();
    my @EastPads = ();
    my @NorthPads = ();
    my @SouthPads = ();
    my $componentSection=0;
    my $componentLine = "";
    my $eastIOLength;
    if($BPadSetting->{east}->{type} =~ /Stagger/i){
        $eastIOLength = $staggerIOPadLength;
    }else{
        $eastIOLength = $linearIOPadLength;
    }
    my $northIOLength;
    if($BPadSetting->{north}->{type} =~ /Stagger/i){
        $northIOLength = $staggerIOPadLength;
    }else{
        $northIOLength = $linearIOPadLength;
    }

    while (<routedDef>){
        chomp;
        if(/^DIEAREA/i){
            s/[();]//g;
            ($keywork, $chipLeft, $chipDown, $chipRight, $chipUp)= split(/\s+/);
            $chipLeft=$chipLeft*1000/$unit_distance_microns;
            $chipDown=$chipDown*1000/$unit_distance_microns;
            $chipRight=$chipRight*1000/$unit_distance_microns;
            $chipUp=$chipUp*1000/$unit_distance_microns;
        }
        if(/^DESIGN\s+(\w+)\s+\;/i){
            $designName = $1;
        }
        $componentSection = 0 if(/^END COMPONENTS/i);
        if($componentSection == 1){
            $componentLine = $componentLine.$_;
            if(/\;\s*$/){
                print "Err! def error at $.\n" if($componentLine !~ /^\s*\-/);

                my @terms = split(/\s\+\s/,$componentLine);
                my ($instance, $cell, $status, $locX, $locY, $direction);

                foreach my $term (@terms){
                    if($term =~ /\B- /){
                        my $dash;
                       ($dash,$instance,$cell) = split(/ /,$term);
                    }elsif($term =~ /(FIXED|PLACED)/){
                        $term =~ s/[();]//g;
                        $term =~ s/\s+/ /g;
                        ($status,$locX,$locY,$direction) = split(/\s+/,$term);
                        $locX=$locX*1000/$unit_distance_microns;
                        $locY=$locY*1000/$unit_distance_microns;
                    }
                }
                #print ("$instance,$cell,$status,$locX,$locY,$direction\n");

                if (defined $ioPadHash->{$cell}){
                    if(($status !~ /PLACED/i) && ($status !~ /FIXED/i)){
                        print "Error!! $. : $cell must be PLACED or FIXED\n"; 
                    }

                    #print ("$instance,$cell,$status,$locX,$locY,$direction,$chipRight\n");			
                    my $Pin1Offset;
                    my $Pin2Offset;
                    if($ioPadHash->{$cell}->{slot}== 1){
                        $Pin1Offset=$ioPadHash->{$cell}->{fstpin_cntr};
                        $Pin2Offset="nil";
                    }
                    if($ioPadHash->{$cell}->{slot}== 2){
                        if($direction =~ /\b(FW|W|FS|N)\b/){
                            $Pin1Offset=$ioPadHash->{$cell}->{fstpin_cntr};
                            $Pin2Offset=$ioPadHash->{$cell}->{sndpin_cntr};
                        }else{ # $direction =~ /E|FE|S|FN/
                               # swap pin1 and pin2 order
                            $Pin1Offset=$ioPadHash->{$cell}->{sndpin_cntr};
                            $Pin2Offset=$ioPadHash->{$cell}->{fstpin_cntr};
                        }
                    } 
                    my $padWidth=$ioPadHash->{$cell}->{width};

                    if (($locX == $chipLeft) &&  ($direction eq "E")){
                        # west side 
                        if($Pin1Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX,
                                       Y=> $locY+$padWidth-$Pin1Offset,dir=> $direction,
                                       place=>"yes"};
                            push (@WestPads , $tmp);
                        }elsif($Pin1Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX,
                                       Y=> $locY+$padWidth-2000, dir=> $direction ,
                                       place=>"no"};
                            push (@WestPads , $tmp);
                        }
                        if($Pin2Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX,
                                       Y=> $locY+$padWidth-$Pin2Offset, dir=> $direction,
                                       place=>"yes"};
                            push (@WestPads , $tmp);
                        }elsif($Pin2Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX,
                                       Y=> $locY+$padWidth-2000, dir=> $direction ,
                                       place=>"no"};
                            push (@WestPads , $tmp);
                        }
                    }elsif (($locX == $chipLeft) && ($direction eq "FW")){
                        # west side 
                        if($Pin1Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX,
                                       Y=> $locY+$Pin1Offset,dir=> $direction,
                                       place=>"yes"};
                            push (@WestPads , $tmp);
                        }elsif($Pin1Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX,
                                       Y=> $locY+2000, dir=> $direction ,
                                       place=>"no"};
                            push (@WestPads , $tmp);
                        }
                        if($Pin2Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX,
                                       Y=> $locY+$Pin2Offset, dir=> $direction,
                                       place=>"yes"};
                            push (@WestPads , $tmp);
                        }elsif($Pin2Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX,
                                       Y=> $locY+2000, dir=> $direction ,
                                       place=>"no"};
                            push (@WestPads , $tmp);
                        }
                    }elsif (($locX == $chipRight - $eastIOLength) && ($direction eq "W")){ 
                        # east side
                        if($Pin1Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$eastIOLength,
                                       Y=> $locY+$Pin1Offset,dir=> $direction,
                                       place=>"yes"};
                            push (@EastPads , $tmp);
				#print ("1.$instance,$cell,$status,$locX,$locY,$direction,$chipRight,$tmp\n");
                        }elsif($Pin1Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+$eastIOLength,
                                       Y=> $locY+2000, dir=> $direction ,
                                       place=>"no"};
                            push (@EastPads , $tmp);
				#print ("2.$instance,$cell,$status,$locX,$locY,$direction,$chipRight\n");
                        }
                        if($Pin2Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$eastIOLength,
                                       Y=> $locY+$Pin2Offset, dir=> $direction,
                                       place=>"yes"};
                            push (@EastPads , $tmp);
				#print ("3.$instance,$cell,$status,$locX,$locY,$direction,$chipRight\n");
                        }elsif($Pin2Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+$eastIOLength,
                                       Y=> $locY+2000, dir=> $direction ,
                                       place=>"no"};
                            push (@EastPads , $tmp);
				#print ("4.$instance,$cell,$status,$locX,$locY,$direction,$chipRight\n");
                        }
                    }elsif (($locX == $chipRight - $eastIOLength) && ($direction eq "FE")){ 
                        # east side
                        if($Pin1Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$eastIOLength,
                                       Y=> $locY+$padWidth-$Pin1Offset,dir=> $direction,
                                       place=>"yes"};
                            push (@EastPads , $tmp);
                        }elsif($Pin1Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+$eastIOLength,
                                       Y=> $locY+$padWidth-2000, dir=> $direction ,
                                       place=>"no"};
                            push (@EastPads , $tmp);
                        }
                        if($Pin2Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$eastIOLength,
                                       Y=> $locY+$padWidth-$Pin2Offset, dir=> $direction,
                                       place=>"yes"};
                            push (@EastPads , $tmp);
                        }elsif($Pin2Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+$eastIOLength,
                                       Y=> $locY+$padWidth-2000, dir=> $direction ,
                                       place=>"no"};
                            push (@EastPads , $tmp);
                        }
                    }elsif (($locY == $chipUp - $northIOLength) && ($direction eq "S")){ 
                        #north side
                        if($Pin1Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$padWidth-$Pin1Offset,
                                       Y=> $locY+$northIOLength,dir=> $direction,
                                       place=>"yes"};
                            push (@NorthPads , $tmp);
                        }elsif($Pin1Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+$padWidth-2000,
                                       Y=> $locY+$northIOLength, dir=> $direction ,
                                       place=>"no"};
                            push (@NorthPads , $tmp);
                        }
                        if($Pin2Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$padWidth-$Pin2Offset,
                                       Y=> $locY+$northIOLength, dir=> $direction,
                                       place=>"yes"};
                            push (@NorthPads , $tmp);
                        }elsif($Pin2Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+$padWidth-2000,
                                       Y=> $locY+$northIOLength, dir=> $direction ,
                                       place=>"no"};
                            push (@NorthPads , $tmp);
                        }
                    }elsif (($locY == $chipUp - $northIOLength) && ($direction eq "FS")){ 
                        #north side
                        if($Pin1Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$Pin1Offset,
                                       Y=> $locY+$northIOLength,dir=> $direction,
                                       place=>"yes"};
                            push (@NorthPads , $tmp);
                        }elsif($Pin1Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+2000,
                                       Y=> $locY+$northIOLength, dir=> $direction ,
                                       place=>"no"};
                            push (@NorthPads , $tmp);
                        }
                        if($Pin2Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$Pin2Offset,
                                       Y=> $locY+$northIOLength, dir=> $direction,
                                       place=>"yes"};
                            push (@NorthPads , $tmp);
                        }elsif($Pin2Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+2000,
                                       Y=> $locY+$northIOLength, dir=> $direction ,
                                       place=>"no"};
                            push (@NorthPads , $tmp);
                        }
                    }elsif (($locY == $chipDown) && ($direction eq "N")){ 
                        #south side
                        if($Pin1Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$Pin1Offset,
                                       Y=> $locY,dir=> $direction,
                                       place=>"yes"};
                            push (@SouthPads , $tmp);
                        }elsif($Pin1Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+2000,
                                       Y=> $locY, dir=> $direction ,
                                       place=>"no"};
                            push (@SouthPads , $tmp);
                        }
                        if($Pin2Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$Pin2Offset,
                                       Y=> $locY, dir=> $direction,
                                       place=>"yes"};
                            push (@SouthPads , $tmp);
                        }elsif($Pin2Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+2000,
                                       Y=> $locY, dir=> $direction ,
                                       place=>"no"};
                            push (@SouthPads , $tmp);
                        }
                    }elsif (($locY == $chipDown) && ($direction eq "FN")){ 
                        #south side
                        if($Pin1Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$padWidth-$Pin1Offset,
                                       Y=> $locY,dir=> $direction,
                                       place=>"yes"};
                            push (@SouthPads , $tmp);
                        }elsif($Pin1Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+$padWidth-2000,
                                       Y=> $locY, dir=> $direction ,
                                       place=>"no"};
                            push (@SouthPads , $tmp);
                        }
                        if($Pin2Offset =~ /\d+/){
                            my $tmp = {type=>$cell,X=>$locX+$padWidth-$Pin2Offset,
                                       Y=> $locY, dir=> $direction,
                                       place=>"yes"};
                            push (@SouthPads , $tmp);
                        }elsif($Pin2Offset =~ /skip/){
                            my $tmp = {type=>$cell,X=>$locX+$padWidth-2000,
                                       Y=> $locY, dir=> $direction ,
                                       place=>"no"};
                            push (@SouthPads , $tmp);
                        }
                    }else{
                        print "Warning !! $.: IO PAD not on the chip boundary or direction error. \n";
                        print ("$instance,$cell($locX,$locY)$direction,$chipLeft,$chipDown,$chipUp,$chipRight\n");
                    }
                }
                $componentLine = "";
            }
        } # if componentSection
        $componentSection = 1 if(/^COMPONENTS/i);
    } # while route.def
    close (routedDef);

    my @sortedWestPads = sort{$a->{Y} <=> $b->{Y}} @WestPads;
    my @sortedEastPads = sort{$a->{Y} <=> $b->{Y}} @EastPads;
    my @sortedNorthPads = sort{$a->{X} <=> $b->{X}} @NorthPads;
    my @sortedSouthPads = sort{$a->{X} <=> $b->{X}} @SouthPads;
    return(\@sortedWestPads,\@sortedEastPads,\@sortedNorthPads,\@sortedSouthPads,
            $chipLeft,$chipRight,$chipUp,$chipDown,$designName,
            $unit_distance_microns);
}


sub createCMDFile()
{
    my ($designName,$WestPads,$EastPads,$NorthPads,$SouthPads,$BPadSetting,$innerBPad,$outerBPad,$linearBPad,$ioPadHash) = @_;

    my $addInst;
    my $addInstTmp;
    my $valid=1;
    
    my $addRouteBlk;

    foreach my $side ( qw (west east south north ) ){
        my $curPads;
        $curPads = $WestPads if ($side eq "west");
        $curPads = $EastPads if ($side eq "east");
        $curPads = $SouthPads if ($side eq "south");
        $curPads = $NorthPads if ($side eq "north");

        if($BPadSetting->{$side}->{type} =~ /Linear/i){
            ($addInstTmp,$valid) = printCmdInLinear($curPads,$linearBPad,$side );
            if($valid){
                $addInst = "$addInst"."$addInstTmp";
            }else{
                print("********************************************************************\n");
                print("** Error!! Pad pitch violation near ($addInstTmp) at $side side \n");
                print("** Unable to add boud pad without inducing spacing violation\n");
                print("********************************************************************\n\n");
                exit(0);
            }
        }else{   #$BPadSetting->{$side}->{type} =~ /Sgatter/
            #20100525 clhuang NOT Perform linear place with inner pad at side
            #($addInstTmp,$valid) = printCmdInLinear($curPads,$innerBPad,$side );
            #if($valid){
            #    print("Perform linear place with inner pad at $side side\n");
            #    $addInst = "$addInst"."$addInstTmp";
            #}else{
                if($BPadSetting->{$side}->{start} =~ /Outer/){
                    ($addInstTmp,$valid) = printCmdInStagger($curPads,$outerBPad,$innerBPad,$side );
                }else{ #Inner
                    ($addInstTmp,$valid) = printCmdInStagger($curPads,$innerBPad,$outerBPad,$side );
                }
                if($valid==0){
                    print("********************************************************************\n");
                    print("** Error!! Pad pitch violation near ($addInstTmp) at $side side \n");
                    print("** Unable to add boud pad without inducing spacing violation\n");
                    print("********************************************************************\n\n");
                    exit(0);
                }
                $addInst = "$addInst"."$addInstTmp";
            #}
        }
    }


    open (cmdfile,">addbond.cmd")||die("Error: Failed to open addbond.cmd\n");
    print cmdfile ("$addInst");
    print cmdfile ("setDrawView place\n");
    print cmdfile ("redraw\n");
    close(cmdfile);

    $addRouteBlk=addRouteBlk();
    open (cmdfile,">addRouteBlk.cmd")||die("Error: Failed to open addRouteBlk.cmd\n");
    print cmdfile ("$addRouteBlk");
    print cmdfile ("setDrawView place\n");
    print cmdfile ("redraw\n");
    close(cmdfile);
}


sub printCmdInLinear()
{
    my ($BPadlocs,$BPad,$side) = @_;
    my $cmdString;
    my $BPadx;
    my $BPady;
    my $pitch= $BPad->{lin_pitch};
    my $cell=$BPad->{name};
    my $countNum=1;
    my $prepoint=-999999;
    my $curpoint;
    foreach $pad (@$BPadlocs){
        if($side eq "west"){
            #v3p1-20100119 Neal Bug fix
            $BPadx = $pad->{X}-$BPad->{"length"}+ $BPad->{ovlap};
            if($pad->{dir} eq "E"){
                $BPady = $pad->{Y}+$BPad->{cntr_offset}-$BPad->{width};
            }elsif($pad->{dir} eq "FW"){
                $BPady = $pad->{Y}-$BPad->{cntr_offset};
            }
            $curpoint=$BPady;
        }elsif($side eq "east"){
	    #v3p1-20100119 Neal Bug fix
	    $BPadx = $pad->{X}-$BPad->{ovlap};
            if($pad->{dir} eq "FE"){
                $BPady = $pad->{Y}+$BPad->{cntr_offset}-$BPad->{width};
            }elsif($pad->{dir} eq "W"){
                $BPady = $pad->{Y}-$BPad->{cntr_offset};
            }
            $curpoint=$BPady;
        }elsif($side eq "north"){
            #v3p1-20100119 Neal Bug fix
            $BPady = $pad->{Y}-$BPad->{ovlap};
            if($pad->{dir} eq "S"){
                $BPadx = $pad->{X}+$BPad->{cntr_offset}-$BPad->{width};
            }elsif($pad->{dir} eq "FS"){
                $BPadx = $pad->{X}-$BPad->{cntr_offset};
            }
            $curpoint=$BPadx;
        }elsif($side eq "south"){
            #v3p1-20100119 Neal Bug fix
	    $BPady = $pad->{Y}-$BPad->{"length"}+$BPad->{ovlap};
            if($pad->{dir} eq "FN"){
                $BPadx = $pad->{X}+$BPad->{cntr_offset}-$BPad->{width};
            }elsif($pad->{dir} eq "N"){
                $BPadx = $pad->{X}-$BPad->{cntr_offset};
            }
            $curpoint=$BPadx;
        }
        my $dir=&compass2dir($pad->{dir});
        $BPadx = $BPadx/1000;
        $BPady = $BPady/1000;
        if($pad->{place} eq "yes"){
            $cmdString= $cmdString."addInst -physical -cell $cell -inst BPad_$side$countNum -loc $BPadx $BPady -ori $dir\n";
            if(($curpoint-$prepoint)<$pitch){
                my $errorx=$pad->{X}/1000;
                my $errory=$pad->{Y}/1000;
                my $errorloc="$errorx,$errory";
                return ($errorloc,0) 
            }
        }
        $prepoint=$curpoint;
        $countNum++;
    }
return ($cmdString,1) 
}

sub printCmdInStagger()
{
    #The BPad in parameter2 will used as started BPad
    my ($BPadlocs,$BPad1,$BPad2,$side) = @_;
    my $cmdString;
    my $BPadx;
    my $BPady;
    my $countNum= 1;
    my $cell;
    my $prepoint=-999999;
    my $curpoint;
    my $stgpitch;
    if($BPad1->{stg_pitch}>$BPad2->{stg_pitch}){
        $stgpitch=$BPad1->{stg_pitch};
    }else{
        $stgpitch=$BPad2->{stg_pitch};
    }
    my $BPad1_prepoint=-999999;
    my $BPad2_prepoint=-999999;
    foreach $pad (@$BPadlocs){
        my $period = $countNum%2;
        if($side eq "west"){
            if ($period == 1){
                $BPadx = $pad->{X}-$BPad1->{"length"}+$BPad1->{ovlap};
                if($pad->{dir} eq "E"){
                    $BPady = $pad->{Y}+$BPad1->{cntr_offset}-$BPad1->{width};
                }elsif($pad->{dir} eq "FW"){
                    $BPady = $pad->{Y}-$BPad1->{cntr_offset};
                }
                $cell = $BPad1->{name};
            }else{
                $BPadx = $pad->{X}-$BPad2->{"length"}+$BPad2->{ovlap};
                if($pad->{dir} eq "E"){
                    $BPady = $pad->{Y}+$BPad2->{cntr_offset}-$BPad2->{width};
                }elsif($pad->{dir} eq "FW"){
                    $BPady = $pad->{Y}-$BPad2->{cntr_offset};
                }
                $cell = $BPad2->{name};
            }
            $curpoint=$BPady;
        }elsif($side eq "east"){
            if ($period == 1){
                $BPadx = $pad->{X}-$BPad1->{ovlap};
                if($pad->{dir} eq "FE"){
                    $BPady = $pad->{Y}+$BPad1->{cntr_offset}-$BPad1->{width};
                }elsif($pad->{dir} eq "W"){
                    $BPady = $pad->{Y}-$BPad1->{cntr_offset};
                }
                $cell = $BPad1->{name};
            }else {
                $BPadx = $pad->{X}-$BPad2->{ovlap};
                if($pad->{dir} eq "FE"){
                    $BPady = $pad->{Y}+$BPad2->{cntr_offset}-$BPad2->{width};
                }elsif($pad->{dir} eq "W"){
                    $BPady = $pad->{Y}-$BPad2->{cntr_offset};
                }
                $cell = $BPad2->{name};
            }
            $curpoint=$BPady;
        }elsif($side eq "north"){
            if ($period == 1){
                $BPady = $pad->{Y}-$BPad1->{ovlap};
                if($pad->{dir} eq "S"){
                    $BPadx = $pad->{X}+$BPad1->{cntr_offset}-$BPad1->{width};
                }elsif($pad->{dir} eq "FS"){
                    $BPadx = $pad->{X}-$BPad1->{cntr_offset};
                }
                $cell = $BPad1->{name};
            }else {
                $BPady = $pad->{Y}-$BPad2->{ovlap};
                if($pad->{dir} eq "S"){
                    $BPadx = $pad->{X}+$BPad2->{cntr_offset}-$BPad2->{width};
                }elsif($pad->{dir} eq "FS"){
                    $BPadx = $pad->{X}-$BPad2->{cntr_offset};
                }
                $cell = $BPad2->{name};
            }
            $curpoint=$BPadx;
        }elsif($side eq "south"){
            if ($period == 1){
                $BPady = $pad->{Y}-$BPad1->{"length"}+$BPad1->{ovlap};
                if($pad->{dir} eq "FN"){
                    $BPadx = $pad->{X}+$BPad1->{cntr_offset}-$BPad1->{width};
                }elsif($pad->{dir} eq "N"){
                    $BPadx = $pad->{X}-$BPad1->{cntr_offset};
                }
                $cell = $BPad1->{name};
            }else {
                $BPady = $pad->{Y}-$BPad2->{"length"}+$BPad2->{ovlap};
                if($pad->{dir} eq "FN"){
                    $BPadx = $pad->{X}+$BPad2->{cntr_offset}-$BPad2->{width};
                }elsif($pad->{dir} eq "N"){
                    $BPadx = $pad->{X}-$BPad2->{cntr_offset};
                }
                $cell = $BPad2->{name};
            }
            $curpoint=$BPadx;
        }
        my $dir=&compass2dir($pad->{dir});
        $BPadx = $BPadx/1000;
        $BPady = $BPady/1000;
        if($pad->{place} eq "yes"){	
            $cmdString= $cmdString."addInst -physical -cell $cell -inst BPad_$side$countNum -loc $BPadx $BPady -ori $dir\n";
	        	       	    
	    my $BPadorigx;
	    my $BPadorigy;
	    my $bondinfo;	    
	    if ($side eq "west"){
		$BPadorigy = $BPady+15;
		if ($cell eq "PAD60GU"){
			$BPadorigx = 40;
		}elsif ($cell eq "PAD60NU"){
			$BPadorigx = 135;
		}else{
			print ("error!!");
		}		
	    	print ("BPad_$side$countNum $cell $side $BPadorigx $BPadorigy $dir\n");
		$bondinfo = "$bondinfo"."BPad_$side$countNum $BPadorigx $BPadorigy\n";		
	    }elsif ($side eq "east"){
		$BPadorigy = $BPady+15;
		if ($cell eq "PAD60GU"){
			$BPadorigx = $chipRight/1000 - 40;
		}elsif ($cell eq "PAD60NU"){
			$BPadorigx = $chipRight/1000 - 135;
		}else{
			print ("error!!");
		}		
	    	print ("BPad_$side$countNum $cell $side $BPadorigx $BPadorigy $dir\n");
		$bondinfo = "$bondinfo"."BPad_$side$countNum $BPadorigx $BPadorigy\n";
	    } elsif ($side eq "north"){
		$BPadorigx = $BPadx + 15;
		if ($cell eq "PAD60GU"){
			$BPadorigy = $chipUp/1000 - 40;
		}elsif ($cell eq "PAD60NU"){
			$BPadorigy = $chipUp/1000 - 135;
		}else{
			print ("error!!");
		}		
	    	print ("BPad_$side$countNum $cell $side $BPadorigx $BPadorigy $dir\n");
		$bondinfo = "$bondinfo"."BPad_$side$countNum $BPadorigx $BPadorigy\n";
	     } elsif ($side eq "south"){
		$BPadorigx = $BPadx + 15;
		if ($cell eq "PAD60GU"){
			$BPadorigy = 40;
		}elsif ($cell eq "PAD60NU"){
			$BPadorigy = 135;
		}else{
			print ("error!!");
		}		
	    	print ("BPad_$side$countNum $cell $side $BPadorigx $BPadorigy $dir\n");
		$bondinfo = "$bondinfo"."BPad_$side$countNum $BPadorigx $BPadorigy\n";
	    } else{
	    	print ("Error!!\n");
	    }
	    	open (cmdfile,">> bonding.info")||die("Error: Failed to open bounding.info\n");	    
	    	print cmdfile ("$bondinfo");
	    	close(cmdfile);	    
	    
            my $errorx=$pad->{X}/1000;
            my $errory=$pad->{Y}/1000;
            my $errorloc="$errorx,$errory";
            return ($errorloc,0) if(($curpoint-$prepoint)<$stgpitch);
            $prepoint=$curpoint;
            if ($period ==1){
                return ($errorloc,0) if(($curpoint-$BPad1_prepoint)<$BPad1->{lin_pitch});
                $BPad1_prepoint=$curpoint;
            }else{
                return ($errorloc,0) if(($curpoint-$BPad2_prepoint)<$BPad2->{lin_pitch});
                $BPad2_prepoint=$curpoint;
            }
        }
        $countNum++;
	
    }
    return ($cmdString,1)
}



sub adjustUnitDistanceMicron()
{
    my ($innerBPad,$outerBPad,$linearBPad,$unitdm)= @_;
    $innerBPad->{"length"} = $innerBPad->{"length"} *$unitdm /1000;
    $outerBPad->{"length"} = $outerBPad->{"length"} *$unitdm /1000;
    $linearBPad->{"length"} = $linearBPad->{"length"} *$unitdm /1000;

    $innerBPad->{"ovlap"} = $innerBPad->{"ovlap"} *$unitdm /1000;
    $outerBPad->{"ovlap"} = $outerBPad->{"ovlap"} *$unitdm /1000;
    $linearBPad->{"ovlap"} = $linearBPad->{"ovlap"} *$unitdm /1000;

    $innerBPad->{"cntr_offset"} = $innerBPad->{"cntr_offset"} *$unitdm /1000;
    $outerBPad->{"cntr_offset"} = $outerBPad->{"cntr_offset"} *$unitdm /1000;
    $linearBPad->{"cntr_offset"} = $linearBPad->{"cntr_offset"} *$unitdm /1000;

    $innerBPad->{"width"} = $innerBPad->{"width"} *$unitdm /1000;
    $outerBPad->{"width"} = $outerBPad->{"width"} *$unitdm /1000;
    $linearBPad->{"width"} = $linearBPad->{"width"} *$unitdm /1000;

    $innerBPad->{lin_pitch} = $innerBPad->{lin_pitch} *$unitdm /1000;
    $outerBPad->{lin_pitch} = $outerBPad->{lin_pitch} *$unitdm /1000;
    $linearBPad->{lin_pitch} = $linearBPad->{lin_pitch} *$unitdm /1000;

    $innerBPad->{stg_pitch} = $innerBPad->{stg_pitch} *$unitdm /1000;
    $outerBPad->{stg_pitch} = $outerBPad->{stg_pitch} *$unitdm /1000;
    $linearBPad->{stg_pitch} = $linearBPad->{stg_pitch} *$unitdm /1000;
}


sub compass2dir()
{
    my $compass=uc(shift);
    my %com2dir = (
        "N" => "R0",
        "W" => "R90",
        "S" => "R180",
        "E" => "R270",
        "FS" => "MX",
        "FW" => "MX90",
        "FN" => "MY",
        "FE" => "MY90"
    );
    if (defined $com2dir{$compass}){
        return($com2dir{$compass});
    }else{
        printf("Undefined direction : $compass\n");
        return("$compass");
    }
}

sub getBPadPar()
{
    my ($BPadPar ,$BPadHash) = @_;
    if (defined ($BPadHash->{$BPadPar})){
        return($BPadHash->{$BPadPar});
    }else{
       print ("Error!! , $BPadPar not defined\n");
    }
}


sub addRouteBlk()
{
    my $routeBlk_N;
    my $routeBlk_E;
    my $rsizechipup;
    my $rsizechipdown;
    my $rsizechipright;
    my $rsizechipleft;

    $rsizechipup = $chipUp/1000;
    $rsizechipdown = $chipDown/1000;
    $rsizechipright = $chipRight/1000;
    $rsizechipleft = $chipLeft/1000;
    $rsizestaggerIOPadLength = $staggerIOPadLength/1000;

    $routeBlk_E = $rsizechipright - $rsizestaggerIOPadLength;
    $routeBlk_N = $rsizechipup - $rsizestaggerIOPadLength;

    $cmdString= "createRouteBlk -box $rsizechipleft $rsizechipdown $rsizestaggerIOPadLength $rsizechipup -layer 5 -name IORouteblk_W\n";
    $cmdString= $cmdString."createRouteBlk -box $rsizechipleft $rsizechipdown $rsizechipright $rsizestaggerIOPadLength -layer 5 -name IORouteblk_S\n";
    $cmdString= $cmdString."createRouteBlk -box $rsizechipleft $routeBlk_N $rsizechipright $rsizechipup -layer 5 -name IORouteblk_N\n";
    $cmdString= $cmdString."createRouteBlk -box $routeBlk_E $rsizechipdown $rsizechipright $rsizechipup -layer 5 -name IORouteblk_E\n";

    return ($cmdString);
}

