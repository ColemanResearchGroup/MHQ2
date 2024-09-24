
### Define MHQ1 Phenotypes for comparison
### Code directly converted from Davis et al 2020

#####Physician Diagnosed Disorders#####

Full_Data_MHQ2$MHQ1.SRSocPhobia<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
  			   ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 1) |
		                  (!is.na(`20544-0.2`) & `20544-0.2` == 1) |
		                  (!is.na(`20544-0.3`) & `20544-0.3` == 1) |
		                  (!is.na(`20544-0.4`) & `20544-0.4` == 1) |
		                  (!is.na(`20544-0.5`) & `20544-0.5` == 1) |
		                  (!is.na(`20544-0.6`) & `20544-0.6` == 1) |
		                  (!is.na(`20544-0.7`) & `20544-0.7` == 1) |
		                  (!is.na(`20544-0.8`) & `20544-0.8` == 1) |
		                  (!is.na(`20544-0.9`) & `20544-0.9` == 1) |
		                  (!is.na(`20544-0.10`) & `20544-0.10` == 1) |
		                  (!is.na(`20544-0.11`) & `20544-0.11` == 1) |
		                  (!is.na(`20544-0.12`) & `20544-0.12` == 1) |
		                  (!is.na(`20544-0.13`) & `20544-0.13` == 1) |
		                  (!is.na(`20544-0.14`) & `20544-0.14` == 1) |
		                  (!is.na(`20544-0.15`) & `20544-0.15` == 1) |
		                  (!is.na(`20544-0.16`) & `20544-0.16` == 1), 1, 0)))

Full_Data_MHQ2$MHQ1.SRSchizophrenia<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			       ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 2) |
		                      (!is.na(`20544-0.2`) & `20544-0.2` == 2) |
		                      (!is.na(`20544-0.3`) & `20544-0.3` == 2) |
		                      (!is.na(`20544-0.4`) & `20544-0.4` == 2) |
		                      (!is.na(`20544-0.5`) & `20544-0.5` == 2) |
		                      (!is.na(`20544-0.6`) & `20544-0.6` == 2) |
		                      (!is.na(`20544-0.7`) & `20544-0.7` == 2) |
		                      (!is.na(`20544-0.8`) & `20544-0.8` == 2) |
		                      (!is.na(`20544-0.9`) & `20544-0.9` == 2) |
		                      (!is.na(`20544-0.10`) & `20544-0.10` == 2) |
		                      (!is.na(`20544-0.11`) & `20544-0.11` == 2) |
		                      (!is.na(`20544-0.12`) & `20544-0.12` == 2) |
		                      (!is.na(`20544-0.13`) & `20544-0.13` == 2) |
		                      (!is.na(`20544-0.14`) & `20544-0.14` == 2) |
		                      (!is.na(`20544-0.15`) & `20544-0.15` == 2) |
		                      (!is.na(`20544-0.16`) & `20544-0.16` == 2), 1, 0)))

Full_Data_MHQ2$MHQ1.SRPsychosisOther<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			        ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 3) |
		                       (!is.na(`20544-0.2`) & `20544-0.2` == 3) |
		                       (!is.na(`20544-0.3`) & `20544-0.3` == 3) |
		                       (!is.na(`20544-0.4`) & `20544-0.4` == 3) |
		                       (!is.na(`20544-0.5`) & `20544-0.5` == 3) |
		                       (!is.na(`20544-0.6`) & `20544-0.6` == 3) |
		                       (!is.na(`20544-0.7`) & `20544-0.7` == 3) |
		                       (!is.na(`20544-0.8`) & `20544-0.8` == 3) |
		                       (!is.na(`20544-0.9`) & `20544-0.9` == 3) |
		                       (!is.na(`20544-0.10`) & `20544-0.10` == 3) |
		                       (!is.na(`20544-0.11`) & `20544-0.11` == 3) |
		                       (!is.na(`20544-0.12`) & `20544-0.12` == 3) |
		                       (!is.na(`20544-0.13`) & `20544-0.13` == 3) |
		                       (!is.na(`20544-0.14`) & `20544-0.14` == 3) |
		                       (!is.na(`20544-0.15`) & `20544-0.15` == 3) |
		                       (!is.na(`20544-0.16`) & `20544-0.16` == 3), 1, 0)))

Full_Data_MHQ2$MHQ1.SRPsychosisAny<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA,
					 ifelse((!is.na(MHQ1.SRSchizophrenia) & MHQ1.SRSchizophrenia == 1) | (!is.na(MHQ1.SRPsychosisOther) & MHQ1.SRPsychosisOther == 1), 1, 0)))


Full_Data_MHQ2$MHQ1.SRPersonalityDisorder<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
				     ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 4) |
		                            (!is.na(`20544-0.2`) & `20544-0.2` == 4) |
		      		            (!is.na(`20544-0.3`) & `20544-0.3` == 4) |
		      		            (!is.na(`20544-0.4`) & `20544-0.4` == 4) |
		      		            (!is.na(`20544-0.5`) & `20544-0.5` == 4) |
		      		            (!is.na(`20544-0.6`) & `20544-0.6` == 4) |
		      		            (!is.na(`20544-0.7`) & `20544-0.7` == 4) |
		      		            (!is.na(`20544-0.8`) & `20544-0.8` == 4) |
		      		            (!is.na(`20544-0.9`) & `20544-0.9` == 4) |
		      		            (!is.na(`20544-0.10`) & `20544-0.10` == 4) |
		      		            (!is.na(`20544-0.11`) & `20544-0.11` == 4) |
		      		            (!is.na(`20544-0.12`) & `20544-0.12` == 4) |
		      		            (!is.na(`20544-0.13`) & `20544-0.13` == 4) |
		      		            (!is.na(`20544-0.14`) & `20544-0.14` == 4) |
		      		            (!is.na(`20544-0.15`) & `20544-0.15` == 4) |
		      		            (!is.na(`20544-0.16`) & `20544-0.16` == 4), 1, 0)))

Full_Data_MHQ2$MHQ1.SROtherPhobia<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			     ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 5) |
		      	            (!is.na(`20544-0.2`) & `20544-0.2` == 5) |
		      	            (!is.na(`20544-0.3`) & `20544-0.3` == 5) |
		      	            (!is.na(`20544-0.4`) & `20544-0.4` == 5) |
		    	            (!is.na(`20544-0.5`) & `20544-0.5` == 5) |
		      	            (!is.na(`20544-0.6`) & `20544-0.6` == 5) |
		      	            (!is.na(`20544-0.7`) & `20544-0.7` == 5) |
		      	            (!is.na(`20544-0.8`) & `20544-0.8` == 5) |
		      	            (!is.na(`20544-0.9`) & `20544-0.9` == 5) |
		      	            (!is.na(`20544-0.10`) & `20544-0.10` == 5) |
		      	            (!is.na(`20544-0.11`) & `20544-0.11` == 5) |
		      	            (!is.na(`20544-0.12`) & `20544-0.12` == 5) |
		      	            (!is.na(`20544-0.13`) & `20544-0.13` == 5) |
		      	            (!is.na(`20544-0.14`) & `20544-0.14` == 5) |
		      	            (!is.na(`20544-0.15`) & `20544-0.15` == 5) |
		      	            (!is.na(`20544-0.16`) & `20544-0.16` == 5), 1, 0)))

Full_Data_MHQ2$MHQ1.SRPanicAttacks<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			      ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 6) |
		                     (!is.na(`20544-0.2`) & `20544-0.2` == 6) |
		                     (!is.na(`20544-0.3`) & `20544-0.3` == 6) |
		                     (!is.na(`20544-0.4`) & `20544-0.4` == 6) |
		                     (!is.na(`20544-0.5`) & `20544-0.5` == 6) |
		                     (!is.na(`20544-0.6`) & `20544-0.6` == 6) |
		                     (!is.na(`20544-0.7`) & `20544-0.7` == 6) |
		                     (!is.na(`20544-0.8`) & `20544-0.8` == 6) |
		                     (!is.na(`20544-0.9`) & `20544-0.9` == 6) |
		                     (!is.na(`20544-0.10`) & `20544-0.10` == 6) |
		                     (!is.na(`20544-0.11`) & `20544-0.11` == 6) |
		                     (!is.na(`20544-0.12`) & `20544-0.12` == 6) |
		                     (!is.na(`20544-0.13`) & `20544-0.13` == 6) |
		                     (!is.na(`20544-0.14`) & `20544-0.14` == 6) |
		                     (!is.na(`20544-0.15`) & `20544-0.15` == 6) |
		                     (!is.na(`20544-0.16`) & `20544-0.16` == 6), 1, 0)))

Full_Data_MHQ2$MHQ1.SROCD<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
		     ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 7) |
		            (!is.na(`20544-0.2`) & `20544-0.2` == 7) |
		            (!is.na(`20544-0.3`) & `20544-0.3` == 7) |
		            (!is.na(`20544-0.4`) & `20544-0.4` == 7) |
		            (!is.na(`20544-0.5`) & `20544-0.5` == 7) |
		            (!is.na(`20544-0.6`) & `20544-0.6` == 7) |
		            (!is.na(`20544-0.7`) & `20544-0.7` == 7) |
		            (!is.na(`20544-0.8`) & `20544-0.8` == 7) |
		            (!is.na(`20544-0.9`) & `20544-0.9` == 7) |
		            (!is.na(`20544-0.10`) & `20544-0.10` == 7) |
		            (!is.na(`20544-0.11`) & `20544-0.11` == 7) |
		            (!is.na(`20544-0.12`) & `20544-0.12` == 7) |
		            (!is.na(`20544-0.13`) & `20544-0.13` == 7) |
		            (!is.na(`20544-0.14`) & `20544-0.14` == 7) |
		            (!is.na(`20544-0.15`) & `20544-0.15` == 7) |
		            (!is.na(`20544-0.16`) & `20544-0.16` == 7), 1, 0)))

Full_Data_MHQ2$MHQ1.SRManiaBIP<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			  ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 10) |
		                 (!is.na(`20544-0.2`) & `20544-0.2` == 10) |
		                 (!is.na(`20544-0.3`) & `20544-0.3` == 10) |
		                 (!is.na(`20544-0.4`) & `20544-0.4` == 10) |
		                 (!is.na(`20544-0.5`) & `20544-0.5` == 10) |
		                 (!is.na(`20544-0.6`) & `20544-0.6` == 10) |
		                 (!is.na(`20544-0.7`) & `20544-0.7` == 10) |
		                 (!is.na(`20544-0.8`) & `20544-0.8` == 10) |
		                 (!is.na(`20544-0.9`) & `20544-0.9` == 10) |
		                 (!is.na(`20544-0.10`) & `20544-0.10` == 10) |
		                 (!is.na(`20544-0.11`) & `20544-0.11` == 10) |
		                 (!is.na(`20544-0.12`) & `20544-0.12` == 10) |
		                 (!is.na(`20544-0.13`) & `20544-0.13` == 10) |
		                 (!is.na(`20544-0.14`) & `20544-0.14` == 10) |
		                 (!is.na(`20544-0.15`) & `20544-0.15` == 10) |
		                 (!is.na(`20544-0.16`) & `20544-0.16` == 10), 1, 0)))

Full_Data_MHQ2$MHQ1.SRDepression<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			    ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 11) |
		                   (!is.na(`20544-0.2`) & `20544-0.2` == 11) |
		                   (!is.na(`20544-0.3`) & `20544-0.3` == 11) |
		                   (!is.na(`20544-0.4`) & `20544-0.4` == 11) |
		                   (!is.na(`20544-0.5`) & `20544-0.5` == 11) |
		                   (!is.na(`20544-0.6`) & `20544-0.6` == 11) |
		                   (!is.na(`20544-0.7`) & `20544-0.7` == 11) |
		                   (!is.na(`20544-0.8`) & `20544-0.8` == 11) |
		                   (!is.na(`20544-0.9`) & `20544-0.9` == 11) |
		                   (!is.na(`20544-0.10`) & `20544-0.10` == 11) |
		                   (!is.na(`20544-0.11`) & `20544-0.11` == 11) |
		                   (!is.na(`20544-0.12`) & `20544-0.12` == 11) |
		                   (!is.na(`20544-0.13`) & `20544-0.13` == 11) |
		                   (!is.na(`20544-0.14`) & `20544-0.14` == 11) |
		                   (!is.na(`20544-0.15`) & `20544-0.15` == 11) |
		                   (!is.na(`20544-0.16`) & `20544-0.16` == 11), 1, 0)))

Full_Data_MHQ2$MHQ1.SRMood<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA,
		      ifelse(!is.na(MHQ1.SRManiaBIP) & MHQ1.SRManiaBIP == 1 |
		      	     !is.na(MHQ1.SRDepression) & MHQ1.SRDepression == 1, 1, 0)))

Full_Data_MHQ2$MHQ1.SRBulimiaNervosa<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			        ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 12) |
		                       (!is.na(`20544-0.2`) & `20544-0.2` == 12) |
		                       (!is.na(`20544-0.3`) & `20544-0.3` == 12) |
		                       (!is.na(`20544-0.4`) & `20544-0.4` == 12) |
		                       (!is.na(`20544-0.5`) & `20544-0.5` == 12) |
		                       (!is.na(`20544-0.6`) & `20544-0.6` == 12) |
		                       (!is.na(`20544-0.7`) & `20544-0.7` == 12) |
		                       (!is.na(`20544-0.8`) & `20544-0.8` == 12) |
		                       (!is.na(`20544-0.9`) & `20544-0.9` == 12) |
		                       (!is.na(`20544-0.10`) & `20544-0.10` == 12) |
		                       (!is.na(`20544-0.11`) & `20544-0.11` == 12) |
		                       (!is.na(`20544-0.12`) & `20544-0.12` == 12) |
		                       (!is.na(`20544-0.13`) & `20544-0.13` == 12) |
		                       (!is.na(`20544-0.14`) & `20544-0.14` == 12) |
		                       (!is.na(`20544-0.15`) & `20544-0.15` == 12) |
		                       (!is.na(`20544-0.16`) & `20544-0.16` == 12), 1, 0)))

Full_Data_MHQ2$MHQ1.SRBingeEating<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			     ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 13) |
		                    (!is.na(`20544-0.2`) & `20544-0.2` == 13) |
		                    (!is.na(`20544-0.3`) & `20544-0.3` == 13) |
		                    (!is.na(`20544-0.4`) & `20544-0.4` == 13) |
		                    (!is.na(`20544-0.5`) & `20544-0.5` == 13) |
		                    (!is.na(`20544-0.6`) & `20544-0.6` == 13) |
		                    (!is.na(`20544-0.7`) & `20544-0.7` == 13) |
		                    (!is.na(`20544-0.8`) & `20544-0.8` == 13) |
		                    (!is.na(`20544-0.9`) & `20544-0.9` == 13) |
		                    (!is.na(`20544-0.10`) & `20544-0.10` == 13) |
		                    (!is.na(`20544-0.11`) & `20544-0.11` == 13) |
		                    (!is.na(`20544-0.12`) & `20544-0.12` == 13) |
		                    (!is.na(`20544-0.13`) & `20544-0.13` == 13) |
		                    (!is.na(`20544-0.14`) & `20544-0.14` == 13) |
		                    (!is.na(`20544-0.15`) & `20544-0.15` == 13) |
		                    (!is.na(`20544-0.16`) & `20544-0.16` == 13), 1, 0)))

Full_Data_MHQ2$MHQ1.SRASD<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
		     ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 14) |
		            (!is.na(`20544-0.2`) & `20544-0.2` == 14) |
		            (!is.na(`20544-0.3`) & `20544-0.3` == 14) |
		            (!is.na(`20544-0.4`) & `20544-0.4` == 14) |
		            (!is.na(`20544-0.5`) & `20544-0.5` == 14) |
		            (!is.na(`20544-0.6`) & `20544-0.6` == 14) |
		            (!is.na(`20544-0.7`) & `20544-0.7` == 14) |
		            (!is.na(`20544-0.8`) & `20544-0.8` == 14) |
		            (!is.na(`20544-0.9`) & `20544-0.9` == 14) |
		            (!is.na(`20544-0.10`) & `20544-0.10` == 14) |
		            (!is.na(`20544-0.11`) & `20544-0.11` == 14) |
		            (!is.na(`20544-0.12`) & `20544-0.12` == 14) |
		            (!is.na(`20544-0.13`) & `20544-0.13` == 14) |
		            (!is.na(`20544-0.14`) & `20544-0.14` == 14) |
		            (!is.na(`20544-0.15`) & `20544-0.15` == 14) |
		            (!is.na(`20544-0.16`) & `20544-0.16` == 14), 1, 0)))

Full_Data_MHQ2$MHQ1.SRGADandOthers<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			      ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 15) |
		                     (!is.na(`20544-0.2`) & `20544-0.2` == 15) |
		                     (!is.na(`20544-0.3`) & `20544-0.3` == 15) |
		                     (!is.na(`20544-0.4`) & `20544-0.4` == 15) |
		                     (!is.na(`20544-0.5`) & `20544-0.5` == 15) |
		                     (!is.na(`20544-0.6`) & `20544-0.6` == 15) |
		                     (!is.na(`20544-0.7`) & `20544-0.7` == 15) |
		                     (!is.na(`20544-0.8`) & `20544-0.8` == 15) |
		                     (!is.na(`20544-0.9`) & `20544-0.9` == 15) |
		                     (!is.na(`20544-0.10`) & `20544-0.10` == 15) |
		                     (!is.na(`20544-0.11`) & `20544-0.11` == 15) |
		                     (!is.na(`20544-0.12`) & `20544-0.12` == 15) |
		                     (!is.na(`20544-0.13`) & `20544-0.13` == 15) |
		                     (!is.na(`20544-0.14`) & `20544-0.14` == 15) |
		                     (!is.na(`20544-0.15`) & `20544-0.15` == 15) |
		                     (!is.na(`20544-0.16`) & `20544-0.16` == 15), 1, 0)))

Full_Data_MHQ2$MHQ1.SRAnorexiaNervosa<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			         ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 16) |
		                        (!is.na(`20544-0.2`) & `20544-0.2` == 16) |
		                        (!is.na(`20544-0.3`) & `20544-0.3` == 16) |
		                        (!is.na(`20544-0.4`) & `20544-0.4` == 16) |
		                        (!is.na(`20544-0.5`) & `20544-0.5` == 16) |
		                        (!is.na(`20544-0.6`) & `20544-0.6` == 16) |
		                        (!is.na(`20544-0.7`) & `20544-0.7` == 16) |
		                        (!is.na(`20544-0.8`) & `20544-0.8` == 16) |
		                        (!is.na(`20544-0.9`) & `20544-0.9` == 16) |
		                        (!is.na(`20544-0.10`) & `20544-0.10` == 16) |
		                        (!is.na(`20544-0.11`) & `20544-0.11` == 16) |
		                        (!is.na(`20544-0.12`) & `20544-0.12` == 16) |
		                        (!is.na(`20544-0.13`) & `20544-0.13` == 16) |
		                        (!is.na(`20544-0.14`) & `20544-0.14` == 16) |
		                        (!is.na(`20544-0.15`) & `20544-0.15` == 16) |
		                        (!is.na(`20544-0.16`) & `20544-0.16` == 16), 1, 0)))

Full_Data_MHQ2$MHQ1.SREatingDisorderAny<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA,
				   ifelse((!is.na(MHQ1.SRAnorexiaNervosa) & MHQ1.SRAnorexiaNervosa == 1) | 
			         	  (!is.na(MHQ1.SRBulimiaNervosa) & MHQ1.SRBulimiaNervosa == 1) |
			         	  (!is.na(MHQ1.SRBingeEating) & MHQ1.SRBingeEating == 1), 1, 0)))

Full_Data_MHQ2$MHQ1.SRAgoraphobia<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
			     ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 17) |
		                    (!is.na(`20544-0.2`) & `20544-0.2` == 17) |
		                    (!is.na(`20544-0.3`) & `20544-0.3` == 17) |
		                    (!is.na(`20544-0.4`) & `20544-0.4` == 17) |
		                    (!is.na(`20544-0.5`) & `20544-0.5` == 17) |
		                    (!is.na(`20544-0.6`) & `20544-0.6` == 17) |
		                    (!is.na(`20544-0.7`) & `20544-0.7` == 17) |
		                    (!is.na(`20544-0.8`) & `20544-0.8` == 17) |
		                    (!is.na(`20544-0.9`) & `20544-0.9` == 17) |
		                    (!is.na(`20544-0.10`) & `20544-0.10` == 17) |
		                    (!is.na(`20544-0.11`) & `20544-0.11` == 17) |
		                    (!is.na(`20544-0.12`) & `20544-0.12` == 17) |
		                    (!is.na(`20544-0.13`) & `20544-0.13` == 17) |
		                    (!is.na(`20544-0.14`) & `20544-0.14` == 17) |
		                    (!is.na(`20544-0.15`) & `20544-0.15` == 17) |
		                    (!is.na(`20544-0.16`) & `20544-0.16` == 17), 1, 0)))

Full_Data_MHQ2$MHQ1.SRAnxietyAny<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA,
			    ifelse((!is.na(MHQ1.SRSocPhobia) & MHQ1.SRSocPhobia == 1) | 
			           (!is.na(MHQ1.SRGADandOthers) & MHQ1.SRGADandOthers == 1) |
			           (!is.na(MHQ1.SRPanicAttacks) & MHQ1.SRPanicAttacks == 1) |
			           (!is.na(MHQ1.SRAgoraphobia) & MHQ1.SRAgoraphobia == 1) |
			           (!is.na(MHQ1.SROtherPhobia) & MHQ1.SROtherPhobia == 1) |
			           (!is.na(MHQ1.SROCD) & MHQ1.SROCD == 1), 1, 0)))

Full_Data_MHQ2$MHQ1.SRADHD<-with(Full_Data_MHQ2, ifelse(is.na(`20499-0.0`), NA, 
		      ifelse((!is.na(`20544-0.1`) & `20544-0.1` == 18) |
		             (!is.na(`20544-0.2`) & `20544-0.2` == 18) |
		             (!is.na(`20544-0.3`) & `20544-0.3` == 18) |
		             (!is.na(`20544-0.4`) & `20544-0.4` == 18) |
		             (!is.na(`20544-0.5`) & `20544-0.5` == 18) |
		             (!is.na(`20544-0.6`) & `20544-0.6` == 18) |
		             (!is.na(`20544-0.7`) & `20544-0.7` == 18) |
		             (!is.na(`20544-0.8`) & `20544-0.8` == 18) |
		             (!is.na(`20544-0.9`) & `20544-0.9` == 18) |
		             (!is.na(`20544-0.10`) & `20544-0.10` == 18) |
		             (!is.na(`20544-0.11`) & `20544-0.11` == 18) |
		             (!is.na(`20544-0.12`) & `20544-0.12` == 18) |
		             (!is.na(`20544-0.13`) & `20544-0.13` == 18) |
		             (!is.na(`20544-0.14`) & `20544-0.14` == 18) |
		             (!is.na(`20544-0.15`) & `20544-0.15` == 18) |
		             (!is.na(`20544-0.16`) & `20544-0.16` == 18), 1, 0)))


#####Interview Diagnoses At Baseline######

InterviewDepression<-apply(Full_Data_MHQ2[,grep("`20002.0", colnames(Full_Data_MHQ2))], 1, function(row) "1286" %in% row)

Full_Data_MHQ2$MHQ1.InterviewDepression[c(InterviewDepression)]<-1

####HES Inpatient Diagnoses######

ICDFields<-c("F300","F308","F311","F314","F317","F320","F323","F32","F332","F338","F341","F380","F39","F301","F309","F312","F315","F318","F321","F328","F330","F333","F339","F348","F381","F302","F310","F313","F316","F319","F322","F329","F331","F334","F340","F349","F388")


HESMood<-apply(Full_Data_MHQ2[,grep("f.4120", colnames(Full_Data_MHQ2))], 1, function(row) ICDFields %in% row)

HESMood_Combined<-numeric()

for(indiv in 1:dim(Full_Data_MHQ2)[1]){
    HESMood_Combined[indiv]<-ifelse(sum(HESMood[(((indiv-1)*length(ICDFields))+1):(indiv*length(ICDFields))]) == 0, 0, 1)
}

Full_Data_MHQ2$MHQ1.HESMood[c(HESMood_Combined==1)]<-1

#####Drug-derived Diagnoses######

## List of codes for antidepressants

antidepcodes<-c("1140879616","1140921600","1140879540","1140867878","1140916282","1140909806","1140867888","1141152732","1141180212","1140879634","1140867876","1140882236",
                "1141190158","1141200564","1140867726","1140879620","1140867818","1140879630","1140879628","1141151946","1140867948","1140867624","1140867756","1140867884",
                "1141151978","1141152736","1141201834","1140867690","1140867640","1140867920","1140867850","1140879544","1141200570","1140867934","1140867758","1140867914",
                "1140867820","1141151982","1140882244","1140879556","1140867852","1140867860","1140917460","1140867938","1140867856","1140867922","1140910820","1140882312",
                "1140867944","1140867784","1140867812","1140867668","1140867940")

DrugDepression<-apply(Full_Data_MHQ2[,grep("`20003.0", colnames(Full_Data_MHQ2))], 1, function(row) antidepcodes %in% row)

DrugDepression_Combined<-numeric()

for(indiv in 1:dim(Full_Data_MHQ2)[1]){
    DrugDepression_Combined[indiv]<-ifelse(sum(DrugDepression[(((indiv-1)*length(antidepcodes))+1):(indiv*length(antidepcodes))]) == 0, 0, 1)
}

Full_Data_MHQ2$MHQ1.DrugDepression[DrugDepression_Combined==1]<-1

###Smith Depression Diagnosis 2013

Full_Data_MHQ2$MHQ1.SmithDepression<-with(Full_Data_MHQ2, ifelse(is.na(`20126-0.0`), NA,
			       ifelse(!is.na(`20126-0.0`) & `20126-0.0` > 2, 1, 0)))

#####Depression######

#####Recent depression: PHQ-9######

Full_Data_MHQ2$MHQ1.PHQ9.No.Info<-with(Full_Data_MHQ2,ifelse((is.na(`20514-0.0`) | `20514-0.0` < 0) &
                                  (is.na(`20510-0.0`) | `20510-0.0` < 0),1,0))

Full_Data_MHQ2$MHQ1.PHQ9.Screen<-with(Full_Data_MHQ2,ifelse(((!is.na(`20514-0.0`) & `20514-0.0` >= 2) |
				  (!is.na(`20510-0.0`) & `20510-0.0` >= 2)) &
				 (!is.na(MHQ1.PHQ9.No.Info) & MHQ1.PHQ9.No.Info == 0),1,0))
Full_Data_MHQ2$MHQ1.PHQ9.Items<-0

Full_Data_MHQ2$MHQ1.PHQ9.Items<-with(Full_Data_MHQ2, ifelse(!is.na(`20514-0.0`) & `20514-0.0` >= 3, MHQ1.PHQ9.Items + 1, MHQ1.PHQ9.Items))
Full_Data_MHQ2$MHQ1.PHQ9.Items<-with(Full_Data_MHQ2, ifelse(!is.na(`20507-0.0`) & `20507-0.0` >= 3, MHQ1.PHQ9.Items + 1, MHQ1.PHQ9.Items))
Full_Data_MHQ2$MHQ1.PHQ9.Items<-with(Full_Data_MHQ2, ifelse(!is.na(`20510-0.0`) & `20510-0.0` >= 3, MHQ1.PHQ9.Items + 1, MHQ1.PHQ9.Items))
Full_Data_MHQ2$MHQ1.PHQ9.Items<-with(Full_Data_MHQ2, ifelse(!is.na(`20508-0.0`) & `20508-0.0` >= 3, MHQ1.PHQ9.Items + 1, MHQ1.PHQ9.Items))
Full_Data_MHQ2$MHQ1.PHQ9.Items<-with(Full_Data_MHQ2, ifelse(!is.na(`20517-0.0`) & `20517-0.0` >= 3, MHQ1.PHQ9.Items + 1, MHQ1.PHQ9.Items))
Full_Data_MHQ2$MHQ1.PHQ9.Items<-with(Full_Data_MHQ2, ifelse(!is.na(`20518-0.0`) & `20518-0.0` >= 3, MHQ1.PHQ9.Items + 1, MHQ1.PHQ9.Items))
Full_Data_MHQ2$MHQ1.PHQ9.Items<-with(Full_Data_MHQ2, ifelse(!is.na(`20519-0.0`) & `20519-0.0` >= 3, MHQ1.PHQ9.Items + 1, MHQ1.PHQ9.Items))
Full_Data_MHQ2$MHQ1.PHQ9.Items<-with(Full_Data_MHQ2, ifelse(!is.na(`20511-0.0`) & `20511-0.0` >= 3, MHQ1.PHQ9.Items + 1, MHQ1.PHQ9.Items))
Full_Data_MHQ2$MHQ1.PHQ9.Items<-with(Full_Data_MHQ2, ifelse(!is.na(`20513-0.0`) & `20513-0.0` >= 2, MHQ1.PHQ9.Items + 1, MHQ1.PHQ9.Items))


Full_Data_MHQ2$MHQ1.PHQ9.Severity<-with(Full_Data_MHQ2, ifelse(`20514-0.0` < 0 | is.na(`20514-0.0`), 0, as.numeric(`20514-0.0`)-1) +
			     ifelse(`20507-0.0` < 0 | is.na(`20507-0.0`), 0, as.numeric(`20507-0.0`)-1) +
			     ifelse(`20510-0.0` < 0 | is.na(`20510-0.0`), 0, as.numeric(`20510-0.0`)-1) +
			     ifelse(`20508-0.0` < 0 | is.na(`20508-0.0`), 0, as.numeric(`20508-0.0`)-1) +
			     ifelse(`20517-0.0` < 0 | is.na(`20517-0.0`), 0, as.numeric(`20517-0.0`)-1) +
			     ifelse(`20518-0.0` < 0 | is.na(`20518-0.0`), 0, as.numeric(`20518-0.0`)-1) +
			     ifelse(`20519-0.0` < 0 | is.na(`20519-0.0`), 0, as.numeric(`20519-0.0`)-1) +
			     ifelse(`20513-0.0` < 0 | is.na(`20513-0.0`), 0, as.numeric(`20513-0.0`)-1) +
			     ifelse(`20511-0.0` < 0 | is.na(`20511-0.0`), 0, as.numeric(`20511-0.0`)-1))

#####Lifetime depression:  CIDI-MDD######

Full_Data_MHQ2$MHQ1.CIDI.MDD.No.Info<-with(Full_Data_MHQ2,ifelse(((is.na(`20446-0.0`) | `20446-0.0` < 0) &
				       (is.na(`20441-0.0`) | `20441-0.0` < 0 )), 1, 0))

Full_Data_MHQ2$MHQ1.CIDI.MDD.Screen<-with(Full_Data_MHQ2,ifelse(((!is.na(`20446-0.0`) & `20446-0.0` == 1) |
			              (!is.na(`20441-0.0`) & `20441-0.0` == 1)) &
				     (!is.na(`20436-0.0`) & `20436-0.0` > 2) &
				     (!is.na(`20439-0.0`) & `20439-0.0` > 1) &
				     (!is.na(`20440-0.0`) & `20440-0.0` > 1), 1, 0))

Full_Data_MHQ2$MHQ1.CIDI.MDD.Response<-0

Full_Data_MHQ2$MHQ1.CIDI.MDD.Response<-with(Full_Data_MHQ2, ifelse(!is.na(`20446-0.0`) & `20446-0.0` > 0, MHQ1.CIDI.MDD.Response + 1, MHQ1.CIDI.MDD.Response))
Full_Data_MHQ2$MHQ1.CIDI.MDD.Response<-with(Full_Data_MHQ2, ifelse(!is.na(`20441-0.0`) & `20441-0.0` > 0, MHQ1.CIDI.MDD.Response + 1, MHQ1.CIDI.MDD.Response))
Full_Data_MHQ2$MHQ1.CIDI.MDD.Response<-with(Full_Data_MHQ2, ifelse(!is.na(`20449-0.0`) & `20449-0.0` > 0, MHQ1.CIDI.MDD.Response + 1, MHQ1.CIDI.MDD.Response))
Full_Data_MHQ2$MHQ1.CIDI.MDD.Response<-with(Full_Data_MHQ2, ifelse(!is.na(`20536-0.0`) & `20536-0.0` > 0, MHQ1.CIDI.MDD.Response + 1, MHQ1.CIDI.MDD.Response))
Full_Data_MHQ2$MHQ1.CIDI.MDD.Response<-with(Full_Data_MHQ2, ifelse(!is.na(`20532-0.0`) & `20532-0.0` > 0, MHQ1.CIDI.MDD.Response + 1, MHQ1.CIDI.MDD.Response))
Full_Data_MHQ2$MHQ1.CIDI.MDD.Response<-with(Full_Data_MHQ2, ifelse(!is.na(`20435-0.0`) & `20435-0.0` > 0, MHQ1.CIDI.MDD.Response + 1, MHQ1.CIDI.MDD.Response))
Full_Data_MHQ2$MHQ1.CIDI.MDD.Response<-with(Full_Data_MHQ2, ifelse(!is.na(`20450-0.0`) & `20450-0.0` > 0, MHQ1.CIDI.MDD.Response + 1, MHQ1.CIDI.MDD.Response))
Full_Data_MHQ2$MHQ1.CIDI.MDD.Response<-with(Full_Data_MHQ2, ifelse(!is.na(`20437-0.0`) & `20437-0.0` > 0, MHQ1.CIDI.MDD.Response + 1, MHQ1.CIDI.MDD.Response))

Full_Data_MHQ2$MHQ1.CIDI.MDD.Severity<-with(Full_Data_MHQ2, ifelse(as.numeric(`20446-0.0`) < 0 | is.na(`20446-0.0`), 0, as.numeric(`20446-0.0`)) +
				 ifelse(as.numeric(`20441-0.0`) < 0 | is.na(`20441-0.0`), 0, as.numeric(`20441-0.0`)) +
				 ifelse(as.numeric(`20449-0.0`) < 0 | is.na(`20449-0.0`), 0, as.numeric(`20449-0.0`)) +
				 ifelse(as.numeric(`20536-0.0`) < 1 | is.na(`20536-0.0`), 0, 1) +
				 ifelse(as.numeric(`20532-0.0`) < 0 | is.na(`20532-0.0`), 0, as.numeric(`20532-0.0`)) +
				 ifelse(as.numeric(`20435-0.0`) < 0 | is.na(`20435-0.0`), 0, as.numeric(`20435-0.0`)) +
				 ifelse(as.numeric(`20450-0.0`) < 0 | is.na(`20450-0.0`), 0, as.numeric(`20450-0.0`)) +
				 ifelse(as.numeric(`20437-0.0`) < 0 | is.na(`20437-0.0`), 0, as.numeric(`20437-0.0`)))

#####Depression Diagnoses#####

### Depressed ever is equivalent to screening for caseness on the CIDI

Full_Data_MHQ2$MHQ1.Depressed.Ever<-with(Full_Data_MHQ2, ifelse(MHQ1.CIDI.MDD.No.Info == 1, NA,
			      ifelse(MHQ1.CIDI.MDD.Screen == 1 & (!is.na(MHQ1.CIDI.MDD.Response) & MHQ1.CIDI.MDD.Response > 4), 1, 
			      ifelse(MHQ1.CIDI.MDD.Screen == 0 & 
			             (!is.na(MHQ1.PHQ9.Severity) & MHQ1.PHQ9.Severity < 5) & 
				     (is.na(MHQ1.SRDepression) | (!is.na(MHQ1.SRDepression) & MHQ1.SRDepression == 0)) &
				     (is.na(MHQ1.InterviewDepression) | (!is.na(MHQ1.InterviewDepression) & MHQ1.InterviewDepression == 0)), 0, NA))))

### Depressed ever severe has all non-core symptoms and "a lot" of impairment on the CIDI

Full_Data_MHQ2$MHQ1.Depressed.Ever.Severe<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Depressed.Ever), NA,
				     ifelse(MHQ1.Depressed.Ever == 0, 0,
				     ifelse(MHQ1.Depressed.Ever == 1 &
				           (!is.na(MHQ1.CIDI.MDD.Severity) & MHQ1.CIDI.MDD.Severity == 8) &
					   (!is.na(`20440-0.0`) & `20440-0.0` == 3), 1, 0))))

### Depression current is PHQ9 and CIDI case

Full_Data_MHQ2$MHQ1.Depressed.Current<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Depressed.Ever) | MHQ1.PHQ9.No.Info == 1, NA,
				 ifelse(MHQ1.Depressed.Ever == 0 | (!is.na(MHQ1.PHQ9.Severity) & MHQ1.PHQ9.Severity < 5), 0,
				 ifelse(MHQ1.Depressed.Ever == 1 & (!is.na(MHQ1.PHQ9.Screen) & MHQ1.PHQ9.Screen == 1) &
				        (!is.na(MHQ1.PHQ9.Items) & MHQ1.PHQ9.Items > 4), 1, 0))))

### Depression current severe includes severity of PHQ9

Full_Data_MHQ2$MHQ1.Depressed.Current.Severe<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Depressed.Ever) | MHQ1.PHQ9.No.Info == 1, NA,
					ifelse(MHQ1.Depressed.Ever == 0 | (!is.na(MHQ1.PHQ9.Severity) & MHQ1.PHQ9.Severity < 5), 0,
					ifelse(MHQ1.Depressed.Ever == 1 & (!is.na(MHQ1.PHQ9.Screen) & MHQ1.PHQ9.Screen == 1) &
					       (!is.na(MHQ1.PHQ9.Items) & MHQ1.PHQ9.Items > 4) & (!is.na(MHQ1.PHQ9.Severity) & MHQ1.PHQ9.Severity > 15), 1, 0))))

### Subthreshold Depression

Full_Data_MHQ2$MHQ1.Subthreshold.Depression<-with(Full_Data_MHQ2, ifelse((is.na(MHQ1.Depressed.Ever) | MHQ1.Depressed.Ever == 0) & 
				              (((!is.na(MHQ1.SRDepression) & MHQ1.SRDepression == 1) | (!is.na(MHQ1.InterviewDepression) & MHQ1.InterviewDepression == 1)) |
					       MHQ1.CIDI.MDD.Screen == 1 |
					       (!is.na(MHQ1.PHQ9.Severity) & MHQ1.PHQ9.Severity > 5)), 1,
				       ifelse(!is.na(MHQ1.Depressed.Ever) & MHQ1.Depressed.Ever == 1, 0, NA)))

### Recurrent depression - if bipolar disorder I, excluded from depression diagnosis below

Full_Data_MHQ2$MHQ1.Recurrent.Depression<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Depressed.Ever) | is.na(`20442-0.0`), NA,
				    ifelse(MHQ1.Depressed.Ever == 1 &
				           !is.na(`20442-0.0`) & (`20442-0.0` > 1 | `20442-0.0` == -999), 1, 0)))

Full_Data_MHQ2$MHQ1.Single.Depression<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Depressed.Ever) | is.na(`20442-0.0`), NA,
				 ifelse(MHQ1.Depressed.Ever == 1 & MHQ1.Recurrent.Depression == 0, 1, 0)))

#####BPAD#####

### Bipolar Diagnosis as from Smith et al (2013)

Full_Data_MHQ2$MHQ1.SmithBipolar<-with(Full_Data_MHQ2, ifelse(is.na(`20126-0.0`), NA,
			    ifelse(!is.na(`20126-0.0`) & `20126-0.0` < 3 & `20126-0.0` > 0, 1, 0)))

Full_Data_MHQ2$MHQ1.SmithMood<-with(Full_Data_MHQ2, ifelse(is.na(`20126-0.0`), NA,
		       	 ifelse(!is.na(`20126-0.0`) & `20126-0.0` > 0, 1, 0)))

### Possible Type I / Type II

Full_Data_MHQ2$MHQ1.Total.Manifestations<-0

Full_Data_MHQ2$MHQ1.Total.Manifestations<-with(Full_Data_MHQ2, ifelse(!is.na(`20548-0.1`) & `20548-0.1` > 0, MHQ1.Total.Manifestations + 1, MHQ1.Total.Manifestations))
Full_Data_MHQ2$MHQ1.Total.Manifestations<-with(Full_Data_MHQ2, ifelse(!is.na(`20548-0.2`) & `20548-0.2` > 0, MHQ1.Total.Manifestations + 1, MHQ1.Total.Manifestations))
Full_Data_MHQ2$MHQ1.Total.Manifestations<-with(Full_Data_MHQ2, ifelse(!is.na(`20548-0.3`) & `20548-0.3` > 0, MHQ1.Total.Manifestations + 1, MHQ1.Total.Manifestations))
Full_Data_MHQ2$MHQ1.Total.Manifestations<-with(Full_Data_MHQ2, ifelse(!is.na(`20548-0.4`) & `20548-0.4` > 0, MHQ1.Total.Manifestations + 1, MHQ1.Total.Manifestations))
Full_Data_MHQ2$MHQ1.Total.Manifestations<-with(Full_Data_MHQ2, ifelse(!is.na(`20548-0.5`) & `20548-0.5` > 0, MHQ1.Total.Manifestations + 1, MHQ1.Total.Manifestations))
Full_Data_MHQ2$MHQ1.Total.Manifestations<-with(Full_Data_MHQ2, ifelse(!is.na(`20548-0.6`) & `20548-0.6` > 0, MHQ1.Total.Manifestations + 1, MHQ1.Total.Manifestations))
Full_Data_MHQ2$MHQ1.Total.Manifestations<-with(Full_Data_MHQ2, ifelse(!is.na(`20548-0.7`) & `20548-0.7` > 0, MHQ1.Total.Manifestations + 1, MHQ1.Total.Manifestations))
Full_Data_MHQ2$MHQ1.Total.Manifestations<-with(Full_Data_MHQ2, ifelse(!is.na(`20548-0.8`) & `20548-0.8` > 0, MHQ1.Total.Manifestations + 1, MHQ1.Total.Manifestations))

### Wider defined bipolar: mania plus three manifestations, or irritability plus four manifestations, for a week or more

Full_Data_MHQ2$MHQ1.Wider.Bipolar.Definition<-with(Full_Data_MHQ2, ifelse(((is.na(`20501-0.0`) | `20501-0.0` < 0) &
				 	        (is.na(`20502-0.0`) | `20502-0.0` < 0)), NA,
				        ifelse(((`20501-0.0` == 1 &
				       	        Full_Data_MHQ2$MHQ1.Total.Manifestations > 2) |
				               (`20502-0.0` == 1 &
				                Full_Data_MHQ2$MHQ1.Total.Manifestations > 3)) &
				       	      !is.na(`20492-0.0`) & `20492-0.0` == 3, 1, 
				        ifelse((!is.na(MHQ1.SRManiaBIP) & MHQ1.SRManiaBIP == 0) & (is.na(MHQ1.SmithBipolar) | (!is.na(MHQ1.SmithBipolar) & MHQ1.SmithBipolar == 0)), 0, NA))))

### Type I

Full_Data_MHQ2$MHQ1.BPDI<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Wider.Bipolar.Definition), NA,
		    ifelse(MHQ1.Wider.Bipolar.Definition == 1 &
			  (!is.na(`20493-0.0`) & `20493-0.0` == 1) &
			  (!is.na(MHQ1.Depressed.Ever) & MHQ1.Depressed.Ever == 1), 1, 0)))

### If BIP Type 1, set depression diagnoses to NA

Full_Data_MHQ2$MHQ1.Recurrent.Depression.With.BPD<-Full_Data_MHQ2$MHQ1.Recurrent.Depression

Full_Data_MHQ2$MHQ1.Recurrent.Depression<-with(Full_Data_MHQ2, ifelse(MHQ1.BPDI == 1, NA, MHQ1.Recurrent.Depression))


Full_Data_MHQ2$MHQ1.Single.Depression.With.BPD<-Full_Data_MHQ2$MHQ1.Single.Depression

Full_Data_MHQ2$MHQ1.Single.Depression<-with(Full_Data_MHQ2, ifelse(MHQ1.BPDI == 1, NA, MHQ1.Single.Depression))

### Type II

Full_Data_MHQ2$MHQ1.BPDII<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Wider.Bipolar.Definition), NA,
		     ifelse(MHQ1.Wider.Bipolar.Definition == 1 &
			   (!is.na(`20493-0.0`) & `20493-0.0` == 0) &
			   (!is.na(MHQ1.Depressed.Ever) & MHQ1.Depressed.Ever == 1), 1, 0)))

#####Anxiety#####

###GAD-CIDI - Count of somatic symptoms on CIDI 

Full_Data_MHQ2$MHQ1.GAD.CIDI.Somatic<-with(Full_Data_MHQ2, (!is.na(`20426-0.0`) & `20426-0.0` > 0) +
			       	(!is.na(`20423-0.0`) & `20423-0.0` > 0) +
			       	(!is.na(`20429-0.0`) & `20429-0.0` > 0) +
			       	(!is.na(`20419-0.0`) & `20419-0.0` > 0) +
			       	(!is.na(`20422-0.0`) & `20422-0.0` > 0) +
			       	(!is.na(`20417-0.0`) & `20417-0.0` > 0) +
			       	(!is.na(`20427-0.0`) & `20427-0.0` > 0))

###GAD-7 - Score

Full_Data_MHQ2$MHQ1.GAD7.Severity<-with(Full_Data_MHQ2, ifelse(`20506-0.0` < 0 | is.na(`20506-0.0`), 0, as.numeric(`20506-0.0`)-1) +
			     ifelse(`20509-0.0` < 0 | is.na(`20509-0.0`), 0, as.numeric(`20509-0.0`)-1) +
			     ifelse(`20520-0.0` < 0 | is.na(`20520-0.0`), 0, as.numeric(`20520-0.0`)-1) +
			     ifelse(`20515-0.0` < 0 | is.na(`20515-0.0`), 0, as.numeric(`20515-0.0`)-1) +
			     ifelse(`20516-0.0` < 0 | is.na(`20516-0.0`), 0, as.numeric(`20516-0.0`)-1) +
			     ifelse(`20505-0.0` < 0 | is.na(`20505-0.0`), 0, as.numeric(`20505-0.0`)-1) +
			     ifelse(`20512-0.0` < 0 | is.na(`20512-0.0`), 0, as.numeric(`20512-0.0`)-1))

## Set all missing to NA

Full_Data_MHQ2$MHQ1.GAD7.Severity<-with(Full_Data_MHQ2, ifelse((`20506-0.0` < 0 | is.na(`20506-0.0`)) &
                                    (`20509-0.0` < 0 | is.na(`20509-0.0`)) &
                                    (`20520-0.0` < 0 | is.na(`20520-0.0`)) &
                                    (`20515-0.0` < 0 | is.na(`20515-0.0`)) &
                                    (`20516-0.0` < 0 | is.na(`20516-0.0`)) &
                                    (`20505-0.0` < 0 | is.na(`20505-0.0`)) &
                                    (`20512-0.0` < 0 | is.na(`20512-0.0`)), NA, MHQ1.GAD7.Severity))

###Generalised Anxiety Disorder Ever

Full_Data_MHQ2$MHQ1.GAD.Ever<-with(Full_Data_MHQ2, ifelse((is.na(`20421-0.0`) | `20421-0.0` < 0), NA,
			ifelse((!is.na(`20421-0.0`) & `20421-0.0`  == 0) & 
				MHQ1.GAD7.Severity < 5, 0,
			ifelse((!is.na(`20421-0.0`) & `20421-0.0`  == 1) &
			       (!is.na(`20420-0.0`) & (`20420-0.0` >= 6 | `20420-0.0` == -999)) &
			       (!is.na(`20538-0.0`) & `20538-0.0` == 1) &
			      ((!is.na(`20425-0.0`) & `20425-0.0` == 1) |
			       (!is.na(`20542-0.0`) & `20542-0.0` == 1)) &
			      ((!is.na(`20543-0.0`) & `20543-0.0` == 2) |
			       (!is.na(`20540-0.0`) & `20540-0.0` == 1)) &
			      ((!is.na(`20541-0.0`) & `20541-0.0` == 1) |
			       (!is.na(`20539-0.0`) & `20539-0.0` == 3) |
			       (!is.na(`20537-0.0`) & `20537-0.0` == 3)) &
			       MHQ1.GAD.CIDI.Somatic >= 3 &
			       (!is.na(`20418-0.0`) & `20418-0.0` >= 2), 1, NA))))

###Generalised Anxiety Disorder Current

Full_Data_MHQ2$MHQ1.GAD.Current<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.GAD.Ever) | is.na(MHQ1.GAD7.Severity), NA,
			   ifelse(MHQ1.GAD.Ever == 1 & MHQ1.GAD7.Severity > 9, 1, 0)))

#####Alcohol#####

### AUDIT Score

Full_Data_MHQ2$MHQ1.AUDIT.Score<-0
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20414-0.0`) | `20414-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + as.numeric(`20414-0.0`)))
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20403-0.0`) | `20403-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + as.numeric(`20403-0.0`) - 1))
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20416-0.0`) | `20416-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + as.numeric(`20416-0.0`) - 1))
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20409-0.0`) | `20409-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + as.numeric(`20409-0.0`) - 1))
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20408-0.0`) | `20408-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + as.numeric(`20408-0.0`) - 1))
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20411-0.0`) | `20411-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + (2*as.numeric(`20411-0.0`))))
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20405-0.0`) | `20405-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + (2*as.numeric(`20405-0.0`))))
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20413-0.0`) | `20413-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + as.numeric(`20413-0.0`) - 1))
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20407-0.0`) | `20407-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + as.numeric(`20407-0.0`) - 1))
Full_Data_MHQ2$MHQ1.AUDIT.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20412-0.0`) | `20412-0.0` < 0, MHQ1.AUDIT.Score, MHQ1.AUDIT.Score + as.numeric(`20412-0.0`) - 1))

### Alcohol Use Disorder

Full_Data_MHQ2$MHQ1.Alcohol.Use.Disorder<-with(Full_Data_MHQ2, ifelse(MHQ1.AUDIT.Score > 7, 1,
				    ifelse(!is.na(`20404-0.0`) & `20404-0.0` == 1, NA, 
				    ifelse((!is.na(`20414-0.0`) & `20414-0.0` == 0) |  
				    	   (!is.na(`20403-0.0`) & `20403-0.0` == 1 &
				    	    !is.na(`20416-0.0`) & `20416-0.0` == 1 &
				    	   (is.na(`2664-0.0`) | 
					    (!is.na(`2664-0.0`) & `2664-0.0` < 0) | 
					    (!is.na(`2664-0.0`) & `2664-0.0` > 3))), 0, NA))))

#####Cannabis#####

Full_Data_MHQ2$MHQ1.Cannabis.Ever<-with(Full_Data_MHQ2, ifelse(is.na(`20453-0.0`) | `20453-0.0` < 0, NA,
			     ifelse(!is.na(`20453-0.0`) & `20453-0.0` > 0, 1, 0)))

Full_Data_MHQ2$MHQ1.Cannabis.Daily<-with(Full_Data_MHQ2, ifelse(is.na(`20454-0.0`), NA,
			      ifelse(!is.na(`20454-0.0`) & `20454-0.0` == 4, 1, 0)))

#####Addictions Screen#####

###Addiction Ever

Full_Data_MHQ2$MHQ1.Addiction.Ever.SelfReport<-with(Full_Data_MHQ2, ifelse(is.na(`20401-0.0`) | `20401-0.0`  < 0, NA, `20401-0.0`))

Full_Data_MHQ2$MHQ1.Addiction.Ever<-with(Full_Data_MHQ2, ifelse((is.na(`20401-0.0`) | `20401-0.0`  < 0) &
			             (is.na(MHQ1.Cannabis.Daily) | MHQ1.Cannabis.Daily < 0), NA, 
			      ifelse(!is.na(`20401-0.0`) & `20401-0.0` == 0 & 
			             MHQ1.AUDIT.Score < 16 & 
				     ((!is.na(MHQ1.Cannabis.Ever) & MHQ1.Cannabis.Ever == 0) | (!is.na(MHQ1.Cannabis.Daily) & MHQ1.Cannabis.Daily == 0)), 0, 
			      ifelse(!is.na(`20401-0.0`) & `20401-0.0` == 1, 1, NA))))

Full_Data_MHQ2$MHQ1.Substance.Addiction.Ever<-with(Full_Data_MHQ2, ifelse((is.na(`20406-0.0`) | `20406-0.0` < 0) &  
				   	       (is.na(`20456-0.0`) | `20456-0.0` < 0) &
				   	       (is.na(`20503-0.0`) | `20503-0.0` < 0), NA, 
				        ifelse(`20406-0.0` == 1 | `20456-0.0` == 1 | `20503-0.0` == 1, 1, 0)))

Full_Data_MHQ2$MHQ1.Alcohol.Dependence.Ever<-with(Full_Data_MHQ2, ifelse((is.na(`20404-0.0`) | `20404-0.0`  < 0), NA, `20404-0.0`))

###Addiction Current

Full_Data_MHQ2$MHQ1.Addiction.Current<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Addiction.Ever) |
			                (((is.na(`20415-0.0`) | `20415-0.0` < 0)) &
					 ((is.na(`20504-0.0`) | `20504-0.0` < 0)) &
					 ((is.na(`20457-0.0`) | `20457-0.0` < 0)) &
					 ((is.na(`20432-0.0`) | `20432-0.0` < 0))), NA,
				 ifelse(MHQ1.Addiction.Ever == 1 &
				       ((!is.na(`20415-0.0`) & `20415-0.0` == 1) |
				        (!is.na(`20504-0.0`) & `20504-0.0` == 1) |
					(!is.na(`20457-0.0`) & `20457-0.0` == 1) |
					(!is.na(`20432-0.0`) & `20432-0.0` == 1)), 1, 0)))

#####Unusual Experiences#####

###Unusual.Experience Ever Hallucinations

Full_Data_MHQ2$MHQ1.Unusual.Experience.Ever.Hallucinations<-with(Full_Data_MHQ2, ifelse((is.na(`20471-0.0`) | `20471-0.0` < 0) &
					            	       (is.na(`20463-0.0`) | `20463-0.0` < 0), NA,
					     		ifelse((!is.na(`20471-0.0`) & `20471-0.0` == 1) |
					            	       (!is.na(`20463-0.0`) & `20463-0.0` == 1), 1, 0)))

###Unusual.Experience.Ever.Delusions

Full_Data_MHQ2$MHQ1.Unusual.Experience.Ever.Delusions<-with(Full_Data_MHQ2, ifelse((is.na(`20474-0.0`) | `20474-0.0` < 0) &
					       	   	  (is.na(`20468-0.0`) | `20468-0.0` < 0), NA,
						   ifelse((!is.na(`20474-0.0`) & `20474-0.0` == 1) |
					       	   	  (!is.na(`20468-0.0`) & `20468-0.0` == 1), 1, 0)))

###Unusual.Experience.Ever

Full_Data_MHQ2$MHQ1.Unusual.Experience.Ever<-with(Full_Data_MHQ2, ifelse((!is.na(MHQ1.Unusual.Experience.Ever.Hallucinations) & MHQ1.Unusual.Experience.Ever.Hallucinations == 1) | 
					        (!is.na(MHQ1.Unusual.Experience.Ever.Delusions) & MHQ1.Unusual.Experience.Ever.Delusions == 1), 1, 
					 ifelse(!is.na(MHQ1.SRPsychosisAny) & MHQ1.SRPsychosisAny == 0, 0, NA)))
###Unusual.Experience.Recent

Full_Data_MHQ2$MHQ1.Unusual.Experience.Recent<-with(Full_Data_MHQ2, ifelse((is.na(`20467-0.0`) | `20467-0.0` < 0), NA,
					   ifelse(`20467-0.0` > 1, 1, 0)))

#####Trauma#####

###Trauma Childhood

Full_Data_MHQ2$MHQ1.Trauma.Childhood<-with(Full_Data_MHQ2, ifelse((is.na(`20488-0.0`) | `20488-0.0` < 0) |
				       (is.na(`20487-0.0`) | `20487-0.0` < 0) |
				       (is.na(`20490-0.0`) | `20490-0.0` < 0) |
				       (is.na(`20491-0.0`) | `20491-0.0` < 0) |
				       (is.na(`20489-0.0`) | `20489-0.0` < 0), NA,
				ifelse(`20488-0.0` > 0 |
				       `20487-0.0` > 0 |
				       `20490-0.0` > 0 | 
				       (4-as.numeric(`20491-0.0`)) > 0 |
				       (4-as.numeric(`20489-0.0`)) > 1, 1, 0)))

###Trauma Adult

Full_Data_MHQ2$MHQ1.Trauma.Adult<-with(Full_Data_MHQ2, ifelse((is.na(`20523-0.0`) | `20523-0.0` < 0) |
				   (is.na(`20521-0.0`) | `20521-0.0` < 0) |
				   (is.na(`20524-0.0`) | `20524-0.0` < 0) |
				   (is.na(`20522-0.0`) | `20522-0.0` < 0) |
				   (is.na(`20525-0.0`) | `20525-0.0` < 0), NA,
			    ifelse(`20523-0.0` > 0 |
				   `20521-0.0` > 0 |
				   `20524-0.0` > 0 |
				   (4-as.numeric(`20522-0.0`)) > 1 |
				   (4-as.numeric(`20525-0.0`)) > 0, 1, 0)))

###Trauma Catastrophic

Full_Data_MHQ2$MHQ1.Trauma.Catastrophic<-with(Full_Data_MHQ2, ifelse((is.na(`20527-0.0`) | `20527-0.0` < 0) &
				          (is.na(`20526-0.0`) | `20526-0.0` < 0) &
					  (is.na(`20528-0.0`) | `20528-0.0` < 0) &
					  (is.na(`20529-0.0`) | `20529-0.0` < 0) &
					  (is.na(`20531-0.0`) | `20531-0.0` < 0) &
					  (is.na(`20530-0.0`) | `20530-0.0` < 0), NA,
				   ifelse((!is.na(`20527-0.0`) & `20527-0.0` > 0) |
				          (!is.na(`20526-0.0`) & `20526-0.0` > 0) |
					  (!is.na(`20528-0.0`) & `20528-0.0` > 0) |
					  (!is.na(`20529-0.0`) & `20529-0.0` > 0) |
					  (!is.na(`20531-0.0`) & `20531-0.0` > 0) |
					  (!is.na(`20530-0.0`) & `20530-0.0` > 0), 1, 0)))

#####PTSD#####

###PCL-6 - Trouble concentrating item is borrowed from PHQ9, scored 1-4, compare 1-5 for other items

Full_Data_MHQ2$MHQ1.PCL.Score<-0

Full_Data_MHQ2$MHQ1.PCL.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20497-0.0`) | `20497-0.0` < 0, MHQ1.PCL.Score, as.numeric(`20497-0.0`) + 1 + MHQ1.PCL.Score))
Full_Data_MHQ2$MHQ1.PCL.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20498-0.0`) | `20498-0.0` < 0, MHQ1.PCL.Score, as.numeric(`20498-0.0`) + 1 + MHQ1.PCL.Score))
Full_Data_MHQ2$MHQ1.PCL.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20495-0.0`) | `20495-0.0` < 0, MHQ1.PCL.Score, as.numeric(`20495-0.0`) + 1 + MHQ1.PCL.Score))
Full_Data_MHQ2$MHQ1.PCL.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20496-0.0`) | `20496-0.0` < 0, MHQ1.PCL.Score, as.numeric(`20496-0.0`) + 1 + MHQ1.PCL.Score))
Full_Data_MHQ2$MHQ1.PCL.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20494-0.0`) | `20494-0.0` < 0, MHQ1.PCL.Score, as.numeric(`20494-0.0`) + 1 + MHQ1.PCL.Score))
Full_Data_MHQ2$MHQ1.PCL.Score<-with(Full_Data_MHQ2, ifelse(is.na(`20508-0.0`) | `20508-0.0` < 0, MHQ1.PCL.Score, as.numeric(`20508-0.0`) + MHQ1.PCL.Score))

Full_Data_MHQ2$MHQ1.PTSD<-with(Full_Data_MHQ2, ifelse((is.na(`20497-0.0`) | `20497-0.0` < 0) |
			   (is.na(`20498-0.0`) | `20498-0.0` < 0) |
			   (is.na(`20495-0.0`) | `20495-0.0` < 0) |
			   (is.na(`20508-0.0`) | `20508-0.0` < 0), NA, 
		     ifelse(MHQ1.PCL.Score > 13, 1, 0)))

#####Self-Harm#####

### Self Harm Ever

Full_Data_MHQ2$MHQ1.MHQ2.SelfHarmEver<-with(Full_Data_MHQ2, ifelse((is.na(`20480-0.0`) | `20480-0.0` < 0), NA, `20480-0.0`))

### Life Not Worth Living and Suicide Attempt

Full_Data_MHQ2$MHQ1.Not.Worth.Living<-with(Full_Data_MHQ2, ifelse(is.na(`20479-0.0`), NA,
				ifelse(!is.na(`20479-0.0`) & `20479-0.0` > 0, 1, 0)))

Full_Data_MHQ2$MHQ1.Self.Harm.Suicide.Attempt<-with(Full_Data_MHQ2, ifelse((is.na(`20479-0.0`) | `20479-0.0` < 0) |
					        (is.na(`20483-0.0`) | `20483-0.0` < 0), NA,
					 ifelse(`20479-0.0` > 0 &
					        `20483-0.0` == 1, 1, 0)))

#####Wellbeing#####

Full_Data_MHQ2$MHQ1.WellbeingScore<-with(Full_Data_MHQ2, ifelse(is.na(`20458-0.0`) | `20458-0.0` < 0 | is.na(`20459-0.0`) | `20459-0.0` < 0 | is.na(`20460-0.0`) | `20460-0.0` < 0, NA, 
			             ((7-as.numeric(`20458-0.0`)) + (7-as.numeric(`20459-0.0`)) + as.numeric(`20460-0.0`))))
 
#####CombinedSelfReportConditions#####

Full_Data_MHQ2$MHQ1.SRConditionsSum<-0
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRSchizophrenia == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum)) 
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRPsychosisOther == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRDepression == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRManiaBIP == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRGADandOthers == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRPanicAttacks == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRAgoraphobia == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRSocPhobia == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SROtherPhobia == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SROCD == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRPersonalityDisorder == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRAnorexiaNervosa == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRBulimiaNervosa == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRBingeEating == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRASD == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(MHQ1.SRADHD == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(!is.na(MHQ1.Alcohol.Dependence.Ever) & MHQ1.Alcohol.Dependence.Ever == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))
Full_Data_MHQ2$MHQ1.SRConditionsSum<-with(Full_Data_MHQ2, ifelse(!is.na(MHQ1.Addiction.Ever) & MHQ1.Addiction.Ever == 1, MHQ1.SRConditionsSum + 1, MHQ1.SRConditionsSum))

Full_Data_MHQ2$MHQ1.NoSRConditions<-with(Full_Data_MHQ2,ifelse(MHQ1.SRConditionsSum == 0, 1, 0))

Full_Data_MHQ2$MHQ1.MultipleSRConditions<-with(Full_Data_MHQ2,ifelse(MHQ1.SRConditionsSum > 1, 1, 0))

#####Depression Comorbidity Codes#####

Full_Data_MHQ2$MHQ1.NoComorbidity<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Wider.Bipolar.Definition) & is.na(MHQ1.GAD.Ever) & is.na(MHQ1.Alcohol.Use.Disorder) & is.na(MHQ1.Unusual.Experience.Ever), NA,
			     ifelse((!is.na(MHQ1.Wider.Bipolar.Definition) & MHQ1.Wider.Bipolar.Definition == 1) | 
			     	    (!is.na(MHQ1.GAD.Ever) & MHQ1.GAD.Ever == 1) |
				    (!is.na(MHQ1.Alcohol.Use.Disorder) & MHQ1.Alcohol.Use.Disorder == 1) | 
				    (!is.na(MHQ1.Unusual.Experience.Ever) & MHQ1.Unusual.Experience.Ever == 1), 0, 1)))

Full_Data_MHQ2$MHQ1.AnyComorbidity<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Wider.Bipolar.Definition) & is.na(MHQ1.GAD.Ever) & is.na(MHQ1.Alcohol.Use.Disorder) & is.na(MHQ1.Unusual.Experience.Ever), NA,
			      ifelse(MHQ1.NoComorbidity == 1, 0, 1)))

Full_Data_MHQ2$MHQ1.MultipleComorbidity<-with(Full_Data_MHQ2, ifelse(is.na(MHQ1.Wider.Bipolar.Definition) & is.na(MHQ1.GAD.Ever) & is.na(MHQ1.Alcohol.Use.Disorder) & is.na(MHQ1.Unusual.Experience.Ever), NA,
				   ifelse(MHQ1.NoComorbidity == 1, 0,
			     	   ifelse(((!is.na(MHQ1.Wider.Bipolar.Definition) & MHQ1.Wider.Bipolar.Definition == 1) & 
			     	    	  ((!is.na(MHQ1.GAD.Ever) & MHQ1.GAD.Ever == 1) |
				           (!is.na(MHQ1.Alcohol.Use.Disorder) & MHQ1.Alcohol.Use.Disorder == 1) | 
				           (!is.na(MHQ1.Unusual.Experience.Ever) & MHQ1.Unusual.Experience.Ever == 1))) | 
					  ((!is.na(MHQ1.GAD.Ever) & MHQ1.GAD.Ever == 1) & 
				          ((!is.na(MHQ1.Alcohol.Use.Disorder) & MHQ1.Alcohol.Use.Disorder == 1) | 
				           (!is.na(MHQ1.Unusual.Experience.Ever) & MHQ1.Unusual.Experience.Ever == 1))) | 
					  ((!is.na(MHQ1.Alcohol.Use.Disorder) & MHQ1.Alcohol.Use.Disorder == 1) & 
					  (!is.na(MHQ1.Unusual.Experience.Ever) & MHQ1.Unusual.Experience.Ever == 1)), 1, 0))))

#####MH Screen######

## Score
## 1 - Case of any kind
## 0 - Not case on any disorder - no to mental distress and professional help, NA on problems diagnosed

Full_Data_MHQ2$MHQ1.MH.Screen<-with(Full_Data_MHQ2, ifelse(((is.na(`20500-0.0`) | `20500-0.0` < 0) |
 			 	 (is.na(`20499-0.0`) | `20499-0.0` < 0)) &
				 (!is.na(`20544-0.1`) & `20544-0.1` < 0), NA,
			 ifelse(`20500-0.0` == 1 |
			        `20499-0.0` == 1 |
				(!is.na(`20544-0.1`) &
				 `20544-0.1` > 0), 1, 0)))

##If case {any} -> case, NOT control

Full_Data_MHQ2$MHQ1.MH.Screen<-with(Full_Data_MHQ2, ifelse((!is.na(MHQ1.Depressed.Ever) & MHQ1.Depressed.Ever == 1) |
				(!is.na(MHQ1.Wider.Bipolar.Definition) & MHQ1.Wider.Bipolar.Definition == 1) |
				(!is.na(MHQ1.GAD.Ever) & MHQ1.GAD.Ever == 1) |
				(!is.na(MHQ1.Addiction.Ever) & MHQ1.Addiction.Ever == 1) |
				(!is.na(MHQ1.Unusual.Experience.Ever) & MHQ1.Unusual.Experience.Ever == 1) |
				(!is.na(MHQ1.PTSD) & MHQ1.PTSD == 1) |
				(!is.na(MHQ1.MHQ2.SelfHarmEver) & MHQ1.MHQ2.SelfHarmEver == 1), 1, MHQ1.MH.Screen))

Full_Data_MHQ2$MHQ1.MH.Questionnaires<-with(Full_Data_MHQ2, ifelse((!is.na(MHQ1.Depressed.Ever) & MHQ1.Depressed.Ever == 1) |
				 	(!is.na(MHQ1.Wider.Bipolar.Definition) & MHQ1.Wider.Bipolar.Definition == 1) |
					(!is.na(MHQ1.GAD.Ever) & MHQ1.GAD.Ever == 1) |
					(!is.na(MHQ1.Alcohol.Use.Disorder) & MHQ1.Alcohol.Use.Disorder == 1) |
					(!is.na(MHQ1.Unusual.Experience.Ever) & MHQ1.Unusual.Experience.Ever == 1) |
					(!is.na(MHQ1.PTSD) & MHQ1.PTSD == 1) |
					(!is.na(MHQ1.MHQ2.SelfHarmEver) & MHQ1.MHQ2.SelfHarmEver == 1), 1, 0))

Full_Data_MHQ2$MHQ1.MH.Questionnaires.Short<-with(Full_Data_MHQ2, ifelse((!is.na(MHQ1.Depressed.Ever) & MHQ1.Depressed.Ever == 1) |
				 	      (!is.na(MHQ1.GAD.Ever) & MHQ1.GAD.Ever == 1) |
					      (!is.na(MHQ1.Unusual.Experience.Ever) & MHQ1.Unusual.Experience.Ever == 1) |
					      (!is.na(MHQ1.Addiction.Ever) & MHQ1.Addiction.Ever == 1), 1, 0))

