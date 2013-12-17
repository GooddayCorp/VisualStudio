       var AirForceRanks = "\
                                            AB:Airman Basic|\
                                            Amn:Airman|\
                                            A1C:Airman First Class|\
                                            SrA:Senior Airman|\
                                            SSgt:Staff Sergeant|\
                                            TSgt:Technical Sergeant|\
                                            MSgt:Master Sergeant|\
                                            1stSgt:First Sergeant|\
                                            SMSgt:Senior Master Sergeant|\
                                            1stSgt:First Sergeant|\
                                            CMSgt:Chief Master Sergeant|\
                                            1stSgt:First Sergeant|\
                                            CCMSgt:Command Chief Master Sergeant|\
                                            CMSAF:Chief Master Sergeant of the Air Force|\
                                            2d Lt:Second Lieutenant|\
                                            1st Lt:First Lieutenant|\
                                            Capt:Captain|\
                                            Maj:Major|\
                                            LtCol:Lieutenant Colonel|\
                                            Col:Colonel|\
                                            BrigGen:Brigadier General|\
                                            MajGen:Major General|\
                                            LtGen:Lieutenant General|\
                                            Gen:General";

          ArmyRanks = "PVT:Private|\
                                        PFC:Private First Class|\
                                        SPC:Specialist|\
                                        CPL:Corporal|\
                                        SGT:Sergeant|\
                                        SSG:Staff Sergeant|\
                                        SFC:Sergeant First Class|\
                                        MSG:Master Sergeant|\
                                        1SGT:First Sergeant|\
                                        SGM:Sergeant Major|\
                                        WO1:Warrant Officer|\
                                        WO2:Chief Warrant Officer 2|\
                                        WO3:Chief Warrant Officer 3|\
                                        WO4:Chief Warrant Officer 4|\
                                        WO5:Master Warrant Officer 5|\
                                        2LT:Second Lieutenant|\
                                        1LT:First Lieutenant|\
                                        CPT:Captain|\
                                        MAJ:Major|\
                                        CSM:Command Sergeant Major|\
                                        SMA:Sergeant Major of the Army|\
                                        LTC:Lieutenant Colonel|\
                                        COL:Colonel|\
                                        BG:Brigadier General|\
                                        MG:Major General|\
                                        LTG:Lieutenant General|\
                                        GEN:General";
                                        
          var CoastGuardRanks = "SR:Seaman Recruit|\
                                                   SA:Seaman Apprentice|\
                                                   SN:Seaman|\
                                                   PO3:Petty Officer Third Class|\
                                                   PO2:Petty Officer Second Class|\
                                                   PO1:Petty Officer First Class|\
                                                   CPO:Chief Petty Officer|\
                                                   SCPO:Senior Chief Petty Officer|\
                                                   MCPO:Master Chief Petty Officer|\
                                                   MCPOC:Command Master Chief Petty Officer|\
                                                   CWO-2:Chief Warrant Officer CWO-2|\
                                                   CWO-3:Chief Warrant Officer CWO-3|\
                                                   CWO-4:Chief Warrant Officer CWO-4|\
                                                   ENS:Ensign|\
                                                   LTJG:Lieutenant Junior Grade|\
                                                   LT:Lieutenant|\
                                                   LCDR:Lieutenant Commander|\
                                                   CDR:Commander|\
                                                   CAPT:Captain|\
                                                   RADM (LH):Rear Admiral (Lower Half)|\
                                                   RADM (UH):Rear Admiral (Upper Half)|\
                                                   VADM:Vice Admiral|\
                                                   ADM:Admiral";

          var MarinesRanks = "Pvt:Private|\
                                            PFC:Private First Class|\
                                            LCpl:Lance Corporal|\
                                            Cpl:Corporal|\
                                            Sgt:Sergeant|\
                                            SSgt:Staff Sergeant|\
                                            GySgt:Gunnery Sergeant|\
                                            MSgt:Master Sergeant|\
                                            1stSgt:First Sergeant|\
                                            MGySgt:Master Gunnery Sergeant|\
                                            SgtMaj:Sergeant Major|\
                                            SgtMajMC:Sergeant Major of the Marine Corps|\
                                            WO-1:Warrant Officer|\
                                            CWO-2:Chief Warrant Officer 2|\
                                            CWO-3:Chief Warrant Officer 3|\
                                            CWO-4:Chief Warrant Officer 4|\
                                            CWO-5:Chief Warrant Officer 5|\
                                            2ndLt:Second Lieutenant|\
                                            1stLt:First Lieutenant|\
                                            Capt:Captain|\
                                            Maj:Major|\
                                            LtCol:Lieutenant Colonel|\
                                            Col:Colonel|\
                                            BGen:Brigadier General|\
                                            MajGen:Major General|\
                                            LtGen:Lieutenant General|\
                                            Gen:General ";

          var NavyRanks = "SR:Seaman Recruit|\
                                        SA:Seaman Apprentice|\
                                        SN:Seaman|\
                                        PO3:Petty Officer Third Class|\
                                        PO2:Petty Officer Second Class|\
                                        PO1:Petty Officer First Class|\
                                        CPO:Chief Petty Officer|\
                                        SCPO:Senior Chief Petty Officer|\
                                        MCPO:Master Chief Petty Officer|\
                                        MCPON:Master Chief Petty Officer of the Navy|\
                                        WO1:Warrant Officer First Class|\
                                        CWO2:Chief Warrant Officer Second Class|\
                                        CWO3:Chief Warrant Officer Third Class|\
                                        CWO4:Chief Warrant Officer Fourth Class|\
                                        CWO5:Chief Warrant Officer|\
                                        ENS:Ensign|\
                                        LTJG:Lieutenant Junior Grade|\
                                        LT:Lieutenant|\
                                        LCDR:Lieutenant Commander|\
                                        CDR:Commander|\
                                        CAPT:Captain|\
                                        RDML:Rear Admiral (Lower Half)|\
                                        RADM:Rear Admiral (Upper Half)|\
                                        VADM:Vice Admiral|\
                                        ADM:Admiral|\
                                        FADM:Fleet Admiral ";

         
          function OnBranchChange(Branch) {
            switch(Branch.options[Branch.selectedIndex].value)
            {
                case "Army":
                    populateCountryRank(ArmyRanks.split('|'));
                    break;
                case "Navy":
                    populateCountryRank(NavyRanks.split('|'));
                    break;
                case "Marines":
                    populateCountryRank(MarinesRanks.split('|'));
                    break;
                case "Coast Guard":
                    populateCountryRank(CoastGuardRanks.split('|'));
                    break;               
                default:
                    populateCountryRank(AirForceRanks.split('|'));               
            }
        
        }

          function populateCountryRank(Ranks) {
          	//Add a Case Statement
              //var Ranks = country.split('|');  // Split into lines
              var selObj = document.getElementById('grade_rank');
              selObj.innerHTML = "";
              selObj.options[0] = new Option('Select Rank','');
              selObj.selectedIndex = 0;
              for (var loop = 0; loop < Ranks.length; loop++) 
              {
                lineArray = Ranks[loop].split(':');
                rankAbbrv  = lineArray[0];
                rankName  = lineArray[1];
                addOption(selObj, rankName, rankAbbrv);
              }
        }


        function addOption(selectbox, text, value) 
        {
        	var optn = document.createElement("OPTION");
        	optn.text = text;
        	optn.value = value;
        	selectbox.options.add(optn);
        }