###Author: JRIColeman, following algorithms defined by KDavis
### v3. Corrected for errors with exercise frequency and AUDIT questionnaire scoring
###Date: V1 080317-091917; V3 100619 
###Script: Score all parts of the MH Questionnaire.

###################################################################################################################
############################        GLOSSARY OF CODES - ALL FIELDS REQUIRED       #################################
###################################################################################################################
### UK Biobank Code     Descriptive                                                                             ###
### f.eid	        ID										        ###
### f.21003.0		Age.when.attended.assessment.centre							###
### f.53.0		Date.of.attending.assessment.centre							###
### f.21000.0		Ethnic.background									###
### f.1647.0		Country.of.birth.UK.elsewhere								###
### f.189.0.0 		Townsend.deprivation.index.at.recruitment						###
### f.6138		Qualifications										###
### f.20024.0.0		Job.code.deduced									###
### f.132.0		Job.code										###
### f.680.0		Own.or.rent.house									###
### f.709.0		Number.in.household									###
### f.738.0		Average.household.income								###
### f.6141.0		Relationship.of.others.in.the.household.to.the.participant				###
### f.20116.0.0		Smoking.status										###
### f.884.0		Number.of.days.week.of.moderate.physical.activity					###
### f.2188.0		Longstanding.illness.disability.or.infirmity						###
### f.2443.0		Diabetes.diagnosed.by.doctor								###
### f.2453.0		Cancer.diagnosed.by.doctor								###
### f.6150.0		Vascular.heart.problems.diagnosed.by.doctor						###
### f.6152.0		Blood.clot.DVT.bronchitis.emphysema.asthma.rhinitis.eczema.allergy.diagnosed.by.doctor 	###
### f.20127.0		Neuroticism.score									###
### f.2110.0		Able.to.confide									  	###
### f.2020.0		Loneliness.isolation								   	###
### f.1031.0		Frequency.of.visits.from.family.friends							###
### f.6160.0		Leisure.social.activities								###
### f.2050.0		Frequency.of.depressed.mood.in.last.2.weeks						###
### f.20002.0		Noncancer.illness.code.selfreported							###
### f.41202.0		Diagnoses.main.ICD10								   	###
### f.41204.0		Diagnoses.secondary.ICD10								###
### f.20003.0		Treatment.medication.code								###
### f.20126.0		Bipolar.and.depression.status								###
### f.20400.0.0		Date.of.completing.mental.health.questionnaire						###
### f.2664.0		Reason.for.reducing.amount.of.alcohol.drunk						###
### f.20499.0.0		Ever.sought.or.received.professional.help.for.mental.distress				###
### f.20500.0.0		Ever.suffered.mental.distress.preventing.usual.activities				###
### f.20544.0		Mental.health.problems.ever.diagnosed.by.a.professional 				###
### f.20446.0.0		Ever.had.prolonged.feelings.of.sadness.or.depression					###
### f.20441.0.0		Ever.had.prolonged.loss.of.interest.in.normal.activities				###
### f.20547.0.0		Activities.undertaken.to.treat.depression						###
### f.20433.0.0		Age.at.first.episode.of.depression							###
### f.20434.0.0		Age.at.last.episode.of.depression							###
### f.20445.0.0		Depression.possibly.related.to.childbirth						###
### f.20447.0.0		Depression.possibly.related.to.stressful.or.traumatic.event				###
### f.20532.0.0		Did.your.sleep.change									###
### f.20435.0.0		Difficulty.concentrating.during.worst.depression					###
### f.20438.0.0		Duration.of.worst.depression								###
### f.20449.0.0		Feelings.of.tiredness.during.worst.episode.of.depression				###
### f.20450.0.0		Feelings.of.worthlessness.during.worst.period.of.depression				###
### f.20436.0.0		Fraction.of.day.affected.during.worst.episode.of.depression				###
### f.20439.0.0		Frequency.of.depressed.days.during.worst.episode.of.depression				###
### f.20440.0.0		Impact.on.normal.roles.during.worst.period.of.depression				###
### f.20442.0.0		Lifetime.number.of.depressed.periods							###
### f.20448.0.0		Professional.informed.about.depression							###
### f.20518.0.0		Recent.changes.in.speed.amount.of.moving.or.speaking					###
### f.20510.0.0		Recent.feelings.of.depression								###
### f.20507.0.0		Recent.feelings.of.inadequacy								###
### f.20519.0.0		Recent.feelings.of.tiredness.or.low.energy						###
### f.20514.0.0		Recent.lack.of.interest.or.pleasure.in.doing.things					###
### f.20511.0.0		Recent.poor.appetite.or.overeating							###
### f.20513.0.0		Recent.thoughts.of.suicide.or.self.harm							###
### f.20508.0.0		Recent.trouble.concentrating.on.things							###
### f.20534.0.0		Sleeping.too.much									###
### f.20546.0.0		Substances.taken.for.depression								###
### f.20437.0.0		Thoughts.of.death.during.worst.depression						###
### f.20533.0.0		Trouble.falling.asleep									###
### f.20517.0.0		Trouble.falling.or.staying.asleep.or.sleeping.too.much					###
### f.20535.0.0		Waking.too.early									###
### f.20536.0.0		Weight.change.during.worst.episode.of.depression					###
### f.20502.0.0		Ever.had.period.extreme.irritability							###
### f.20501.0.0		Ever.had.period.of.mania.excitability							###
### f.20492.0.0		Longest.period.of.mania.or.irritability							###
### f.20548.0.0		Manifestations.of.mania.or.irritability							###
### f.20493.0.0		Severity.of.problems.due.to.mania.or.irritability					###
### f.20550.0.0		Activities.undertaken.to.treat.anxiety							###
### f.20419.0.0		Difficulty.concentrating.during.worst.period.of.anxiety					###
### f.20541.0.0		Difficulty.stopping.worrying.during.worst.period.of.anxiety				###
### f.20429.0.0		Easily.tired.during.worst.period.of.anxiety						###
### f.20421.0.0		Ever.felt.worried.tense.or.anxious.for.most.of.a.month.or.longer			###
### f.20425.0.0		Ever.worried.more.than.most.people.would.in.similar.situation				###
### f.20537.0.0		Frequency.of.difficulty.controlling.worry.during.worst.period.of.anxiety		###
### f.20539.0.0		Frequency.of.inability.to.stop.worrying.during.worst.period.of.anxiety			###
### f.20427.0.0		Frequent.trouble.falling.or.staying.asleep.during.worst.period.of.anxiety		###
### f.20418.0.0		Impact.on.normal.roles.during.worst.period.of.anxiety					###
### f.20423.0.0		Keyed.up.or.on.edge.during.worst.period.of.anxiety					###
### f.20420.0.0		Longest.period.spent.worried.or.anxious							###
### f.20422.0.0		More.irritable.than.usual.during.worst.period.of.anxiety				###
### f.20540.0.0		Multiple.worries.during.worst.period.of.anxiety						###
### f.20543.0.0		Number.of.things.worried.about.during.worst.period.of.anxiety				###
### f.20428.0.0		Professional.informed.about.anxiety							###
### f.20505.0.0		Recent.easy.annoyance.or.irritability							###
### f.20512.0.0		Recent.feelings.of.foreboding								###
### f.20506.0.0		Recent.feelings.of.nervousness.or.anxiety						###
### f.20509.0.0		Recent.inability.to.stop.or.control.worrying						###
### f.20516.0.0		Recent.restlessness									###
### f.20515.0.0		Recent.trouble.relaxing									###
### f.20520.0.0		Recent.worrying.too.much.about.different.things						###
### f.20426.0.0		Restless.during.period.of.worst.anxiety							###
### f.20542.0.0		Stronger.worrying.than.other.people.during.period.of.worst.anxiety			###
### f.20549.0.0		Substances.taken.for.anxiety								###
### f.20417.0.0		Tense.sore.or.aching.muscles.during.worst.period.of.anxiety				###
### f.20538.0.0		Worried.most.days.during.period.of.worst.anxiety					###
### f.20552.0.0		Behavioural.and.miscellaneous.addictions						###
### f.20431.0.0		Ever.addicted.to.a.behaviour.or.miscellanous						###
### f.20406.0.0		Ever.addicted.to.alcohol								###
### f.20401.0.0		Ever.addicted.to.any.substance.or.behaviour						###
### f.20456.0.0		Ever.addicted.to.illicit.or.recreational.drugs						###
### f.20503.0.0		Ever.addicted.to.prescription.or.over.the.counter.medication				###
### f.20404.0.0		Ever.physically.dependent.on.alcohol							###
### f.20457.0.0		Illicit.or.recreational.drugs.addiction.or.dependence.ongoing				###
### f.20504.0.0		Prescription.or.over.the.counter.medication.addiction.or.dependence.ongoing		###
### f.20551.0.0		Medical.substance.addictions								###
### f.20415.0.0		Ongoing.addiction.to.alcohol								###
### f.20432.0.0		Ongoing.behavioural.or.miscellanous.addiction						###
### f.20414.0.0		Frequency.of.drinking.alcohol								###
### f.20403.0.0		Amount.of.alcohol.drunk.on.a.typical.drinking.day					###
### f.20416.0.0		Frequency.of.consuming.six.or.more.units.of.alcohol					###
### f.20413.0.0		Frequency.of.inability.to.cease.drinking.in.last.year					###
### f.20407.0.0		Frequency.of.failure.to.fulfil.normal.expectations.due.to.drinking.alcohol.in.last.year	###
### f.20412.0.0		Frequency.of.needing.morning.drink.of.alcohol.after.heavy.drinking.session.in.last.year	###
### f.20409.0.0		Frequency.of.feeling.guilt.or.remorse.after.drinking.alcohol.in.last.year		###
### f.20408.0.0		Frequency.of.memory.loss.due.to.drinking.alcohol.in.last.year				###
### f.20411.0.0		Ever.been.injured.or.injured.someone.else.through.drinking.alcohol			###
### f.20405.0.0		Ever.had.known.person.concerned.about.or.recommend.reduction.of.alcohol.consumption	###
### f.20410.0.0		Age.when.known.person.last.commented.about.drinking.habits				###
### f.20455.0.0		Age.when.last.took.cannabis								###
### f.20453.0.0		Ever.taken.cannabis									###
### f.20454.0.0		Maximum.frequency.of.taking.cannabis							###
### f.20461.0.0		Age.when.first.had.unusual.or.psychotic.experience					###
### f.20462.0.0		Distress.caused.by.unusual.or.psychotic.experiences					###
### f.20468.0.0		Ever.believed.in.an.unreal.conspiracy.against.self					###
### f.20474.0.0		Ever.believed.in.unreal.communications.or.signs						###
### f.20463.0.0		Ever.heard.an.unreal.voice								###
### f.20466.0.0		Ever.prescribed.a.medication.for.unusual.or.psychotic.experiences			###
### f.20471.0.0		Ever.seen.an.unreal.vision								###
### f.20477.0.0		Ever.talked.to.a.health.professional.about.unusual.or.psychotic.experiences		###
### f.20467.0.0		Frequency.of.unusual.or.psychotic.experiences.in.past.year				###
### f.20470.0.0		Number.of.times.believed.in.an.unreal.conspiracy.against.self				###
### f.20476.0.0		Number.of.times.believed.in.unreal.communications.or.signs				###
### f.20465.0.0		Number.of.times.heard.an.unreal.voice							###
### f.20473.0.0		Number.of.times.seen.an.unreal.vision							###
### f.20489.0.0		Felt.loved.as.a.child									###
### f.20488.0.0		Physically.abused.by.family.as.a.child							###
### f.20487.0.0		Felt.hated.by.family.member.as.a.child							###
### f.20490.0.0		Sexually.molested.as.a.child								###
### f.20491.0.0		Someone.to.take.to.doctor.when.needed.as.a.child					###
### f.20522.0.0		Been.in.a.confiding.relationship.as.an.adult						###
### f.20523.0.0		Physical.violence.by.partner.or.ex.partner.as.an.adult					###
### f.20521.0.0		Belittlement.by.partner.or.ex.partner.as.an.adult					###
### f.20524.0.0		Sexual.interference.by.partner.or.ex.partner.without.consent.as.an.adult		###
### f.20525.0.0		Able.to.pay.rent.mortgage.as.an.adult							###
### f.20531.0.0		Victim.of.sexual.assault								###
### f.20529.0.0		Victim.of.physically.violent.crime							###
### f.20526.0.0		Been.in.serious.accident.believed.to.be.life.threatening				###
### f.20530.0.0		Witnessed.sudden.violent.death								###
### f.20528.0.0		Diagnosed.with.life.threatening.illness							###
### f.20527.0.0		Been.involved.in.combat.or.exposed.to.war.zone						###
### f.20497.0.0		Repeated.disturbing.thoughts.of.stressful.experience.in.past.month			###
### f.20498.0.0		Felt.very.upset.when.reminded.of.stressful.experience.in.past.month			###
### f.20495.0.0		Avoided.activities.or.situations.because.of.previous.stressful.experience.in.past.month	###
### f.20496.0.0		Felt.distant.from.other.people.in.past.month						###
### f.20494.0.0		Felt.irritable.or.had.angry.outbursts.in.past.month					###
### f.20479.0.0		Ever.thought.that.life.not.worth.living							###
### f.20485.0.0		Ever.contemplated.self.harm								###
### f.20486.0.0		Contemplated.self.harm.in.past.year							###
### f.20482.0.0		Number.of.times.self.harmed								###
### f.20481.0.0		Self.harmed.in.past.year								###
### f.20480.0.0		Self.harmed										###
### f.20553.0.0		Methods.of.self.harm.used								###
### f.20484.0.0		Attempted.suicide.in.past.year								###
### f.20483.0.0		Attempted.suicide									###
### f.20554.0.0		Actions.taken.following.self.harm							###
### f.20459.0.0		General.happiness.with.own.health							###
### f.20458.0.0		General.happiness									###
### f.31.0.0		Sex											###
### f.20460.0.0		Belief.that.own.life.is.meaningful							###
### f.6142.0          	Current.employment.status                                                               ###
###################################################################################################################
###################################################################################################################

###Check command line arguments are present

args<-commandArgs(trailingOnly=TRUE)

if(length(args)==0){
    stop("Please provide an input file containing all fields listed in the script (full path)", call.=FALSE)
}

### Load dependencies

library(data.table)
library(Hmisc)
library(stringi)

### Load data

MHQ_Full<-fread(args[1], data.table=F)

#####Demographics#####

### Calculate age at MHQ as age at baseline + (diff in days between baseline and MHQ divided by 365.25)

MHQ_Full$Age.At.MHQ<-as.numeric(with(MHQ_Full, ifelse(is.na(f.20400.0.0),f.21003.0.0 + ceiling(difftime(median(na.omit(as.Date(MHQ_Full$f.20400.0.0))), as.Date(f.53.0.0), units="days")/365.25),f.21003.0.0 + ceiling(difftime(as.Date(f.20400.0.0), as.Date(f.53.0.0), units="days")/365.25))))


### Group age into sets of five years

MHQ_Full$Age.Group<-ordered(with(MHQ_Full, ifelse(is.na(Age.At.MHQ), NA,
				 	   ifelse(Age.At.MHQ >= 45 & Age.At.MHQ  <= 54, "45to54",
			 	 	   ifelse(Age.At.MHQ >= 55 & Age.At.MHQ  <= 64, "55to64",
				 	   ifelse(Age.At.MHQ >= 65 & Age.At.MHQ  <= 74, "65to74",
			 	 	   ifelse(Age.At.MHQ >= 75, "75Plus", NA)))))),
				 	   levels=c("45to54", "55to64", "65to74", "75Plus"))

### Define Gender field

MHQ_Full$Gender<-with(MHQ_Full, ifelse(is.na(f.31.0.0) | f.31.0.0 < 0, NA,
		      		ifelse(!is.na(f.31.0.0), f.31.0.0, NA))) 

### Define Ethnicity and Migrant status (0 = born in Britain, 1 = born elsewhere) fields

MHQ_Full$Ethnicity<-ordered(with(MHQ_Full, ifelse(is.na(f.21000.0.0) | f.21000.0.0 < 0, NA,
              		 	 	   ifelse(!is.na(f.21000.0.0) & f.21000.0.0 > 1000 & f.21000.0.0 < 1999, "White",
              		 	 	   ifelse(!is.na(f.21000.0.0) & f.21000.0.0 > 2000 & f.21000.0.0 < 2999, "Mixed",
              		 	 	   ifelse(!is.na(f.21000.0.0) & f.21000.0.0 > 3000 & f.21000.0.0 < 3999, "Asian",
              		 	 	   ifelse(!is.na(f.21000.0.0) & f.21000.0.0 > 4000 & f.21000.0.0 < 4999, "Black",
              		 	 	   ifelse(!is.na(f.21000.0.0) & f.21000.0.0 == 5, "Chinese",
              		 	 	   ifelse(!is.na(f.21000.0.0) & f.21000.0.0 == 6, "Other",NA)))))))),
			 	 	   levels=c("White","Black","Asian","Chinese","Mixed","Other"))

MHQ_Full$Migrant.Status<-with(MHQ_Full, ifelse(is.na(f.1647.0.0) | f.1647.0.0 < 0, NA,
			      		ifelse(f.1647.0.0 == 5 | f.1647.0.0 == 6, 1, 0)))

### Group TDI into tertiles

MHQ_Full$TDI.Tertiles<-ordered(with(MHQ_Full, ifelse(is.na(f.189.0.0), NA,
				    	      ifelse(f.189.0.0 >= 2, "Most",
				    	      ifelse(f.189.0.0 < 2 & f.189.0.0 > -2, "Average",
				    	      ifelse(f.189.0.0 <= -2, "Least", NA))))),
				    	      levels=c("Most","Average","Least"))

### Highest qualifications, with other qualifications as a separate factor and non-A level quals collapsed to a single factor

MHQ_Full$Highest.Qualification<-ordered(with(MHQ_Full, ifelse(is.na(f.6138.0.0) | (!is.na(f.6138.0.0) & f.6138.0.0 == -3), NA,
					     	       ifelse(!is.na(f.6138.0.0) & f.6138.0.0 == -7, "NoneOfTheAbove",
					     	       ifelse(!is.na(f.6138.0.0) & f.6138.0.0 == 1, "Degree",
					     	       ifelse(!is.na(f.6138.0.0) & f.6138.0.0 == 2, "ALevel",
					     	       ifelse(!is.na(f.6138.0.0) & f.6138.0.0 <= 5, "GCSE",
					     	       ifelse(!is.na(f.6138.0.0) & f.6138.0.0 == 6, "Other", NA))))))),
					     	       levels=c("NoneOfTheAbove", "Other", "GCSE", "ALevel", "Degree"))

### Job encoding - "other" from f.132.0.0 are classified in f.20024.0.0

MHQ_Full$SOC.Job.Code<-ordered(with(MHQ_Full, ifelse(!is.na(f.132.0.0) & f.132.0.0 > 1000000 & f.132.0.0 < 1999999, "Manager",
				    	      ifelse(!is.na(f.132.0.0) & f.132.0.0 > 2000000 & f.132.0.0 < 2999999, "Professional",
				    	      ifelse(!is.na(f.132.0.0) & f.132.0.0 > 3000000 & f.132.0.0 < 3999999, "AssociateProfessional",
				    	      ifelse(!is.na(f.132.0.0) & f.132.0.0 > 4000000 & f.132.0.0 < 4999999, "Administrative",
				    	      ifelse(!is.na(f.132.0.0) & f.132.0.0 > 5000000 & f.132.0.0 < 5999999, "Skilled",
				    	      ifelse(!is.na(f.132.0.0) & f.132.0.0 > 6000000 & f.132.0.0 < 6999999, "PersonalService",
				    	      ifelse(!is.na(f.132.0.0) & f.132.0.0 > 7000000 & f.132.0.0 < 7999999, "Sales",
				    	      ifelse(!is.na(f.132.0.0) & f.132.0.0 > 8000000 & f.132.0.0 < 8999999, "ProcessPlantMachine",
				    	      ifelse(!is.na(f.132.0.0) & f.132.0.0 > 9000000 & f.132.0.0 < 9999999, "Elementary",
				    	      ifelse(!is.na(f.20024.0.0) & f.20024.0.0 > 1000 & f.20024.0.0 < 1999, "Manager",
				    	      ifelse(!is.na(f.20024.0.0) & f.20024.0.0 > 2000 & f.20024.0.0 < 2999, "Professional",
				    	      ifelse(!is.na(f.20024.0.0) & f.20024.0.0 > 3000 & f.20024.0.0 < 3999, "AssociateProfessional",
				    	      ifelse(!is.na(f.20024.0.0) & f.20024.0.0 > 4000 & f.20024.0.0 < 4999, "Administrative",
				    	      ifelse(!is.na(f.20024.0.0) & f.20024.0.0 > 5000 & f.20024.0.0 < 5999, "Skilled",
				    	      ifelse(!is.na(f.20024.0.0) & f.20024.0.0 > 6000 & f.20024.0.0 < 6999, "PersonalService",
				    	      ifelse(!is.na(f.20024.0.0) & f.20024.0.0 > 7000 & f.20024.0.0 < 7999, "Sales",
				    	      ifelse(!is.na(f.20024.0.0) & f.20024.0.0 > 8000 & f.20024.0.0 < 8999, "ProcessPlantMachine",
				    	      ifelse(!is.na(f.20024.0.0) & f.20024.0.0 > 9000 & f.20024.0.0 < 9999, "Elementary", NA))))))))))))))))))),
				    	      levels=c("Manager","Professional","AssociateProfessional","Administrative","Skilled","PersonalService","Sales","ProcessPlantMachine","Elementary"))

MHQ_Full$SOC.Job.Code.Broad<-ordered(with(MHQ_Full, ifelse(is.na(SOC.Job.Code), NA, 
					  	    ifelse(SOC.Job.Code == "Manager" | SOC.Job.Code == "Professional" | SOC.Job.Code == "AssociateProfessional" | SOC.Job.Code == "Administrative", "Managerial.administrative.professional",
					  	    ifelse(SOC.Job.Code == "Skilled" | SOC.Job.Code == "PersonalService" | SOC.Job.Code == "Sales", "Intermediate",
					  	    ifelse(SOC.Job.Code == "ProcessPlantMachine" | SOC.Job.Code == "Elementary", "Routine.manual", NA))))),
					  	    levels=c("Managerial.administrative.professional","Intermediate","Routine.manual"))

### House ownership - collapse complex and none of the above to "other"

MHQ_Full$House.Ownership<-ordered(with(MHQ_Full, ifelse(!is.na(f.680.0.0) & f.680.0.0 == 1, "OwnOutright",
				       		  ifelse(!is.na(f.680.0.0) & f.680.0.0 == 2, "OwnMortgage",
				       		  ifelse(!is.na(f.680.0.0) & f.680.0.0 == 3, "RentSocial",
				       		  ifelse(!is.na(f.680.0.0) & f.680.0.0 == 4, "RentPrivate",
				       		  ifelse(!is.na(f.680.0.0) & f.680.0.0 > 4 & f.680.0.0 == -7, "Other", NA)))))),
				       		  levels=c("OwnOutright", "OwnMortgage", "RentSocial", "RentPrivate", "Other"))

### Average Household Income

MHQ_Full$Income<-ordered(with(MHQ_Full, ifelse(!is.na(f.738.0.0) & f.738.0.0 == 1, "LessThan18K",
		       	      		 ifelse(!is.na(f.738.0.0) & f.738.0.0 == 2, "18Kto30K",
			      		 ifelse(!is.na(f.738.0.0) & f.738.0.0 == 3, "30Kto52K",
			      		 ifelse(!is.na(f.738.0.0) & f.738.0.0 == 4, "52Kto100K",
			      		 ifelse(!is.na(f.738.0.0) & f.738.0.0 == 5, "MoreThan100K",
			      		 ifelse(!is.na(f.738.0.0) & f.738.0.0 < 0, "DontKnowRefuse", NA))))))),
			      		 levels=c("LessThan18K", "18Kto30K", "30Kto52K", "52Kto100K", "MoreThan100K", "DontKnowRefuse"))

### Living with partner

MHQ_Full$Cohabiting<-with(MHQ_Full, ifelse(is.na(f.6141.0.0) | !is.na(f.6141.0.0) & f.6141.0.0 < 0, NA,
			  	     ifelse(!is.na(f.6141.0.0) & f.6141.0.0 == 1, 1, 0)))

### Living alone

#MHQ_Full$Living.Alone<-with(MHQ_Full, ifelse(is.na(f.709.0.0) | !is.na(f.709.0.0) & f.709.0.0 < 0, NA,
#			    	      ifelse(!is.na(f.709.0.0) & f.709.0.0 == 1, 1, 0)))

MHQ_Full$Living.Alone<-with(MHQ_Full, ifelse(is.na(f.6141.0.0), 1, 0))

### Smoker status (rename as factor)

MHQ_Full$Smoker<-ordered(with(MHQ_Full, ifelse(!is.na(f.20116.0.0) & f.20116.0.0 == 2, "Current",
			      ifelse(!is.na(f.20116.0.0) & f.20116.0.0 == 1, "Former",
			      ifelse(!is.na(f.20116.0.0) & f.20116.0.0 == 0, "Never",
			      ifelse(!is.na(f.20116.0.0) & f.20116.0.0 == -3, "PreferNotToAnswer",NA))))),
			      levels=c("Current", "Former", "Never", "PreferNotToAnswer"))

### Physical activity daily

MHQ_Full$Moderate.Physical.Activity<-with(MHQ_Full, ifelse(is.na(f.884.0.0) | f.884.0.0 < 0, NA,
					  	    ifelse(!is.na(f.884.0.0) & f.884.0.0 > 2, 0, 1)))

### Longstanding illness

MHQ_Full$Longstanding.Illness<-with(MHQ_Full, ifelse(is.na(f.2188.0.0) | f.2188.0.0 < 0, NA, f.2188.0.0))

### Diabetes

MHQ_Full$Diabetes<-with(MHQ_Full, ifelse(is.na(f.2443.0.0) | f.2443.0.0 < 0, NA, f.2443.0.0))

### Cancer

MHQ_Full$Cancer<-with(MHQ_Full, ifelse(is.na(f.2453.0.0) | f.2453.0.0 < 0, NA, f.2453.0.0))

### CVD

MHQ_Full$CVD<-with(MHQ_Full, ifelse(!is.na(f.6150.0.0) & f.6150.0.0 == -7, 0,
		   	     ifelse(!is.na(f.6150.0.0) & f.6150.0.0 > 0, 1, NA)))

### Respiratory

MHQ_Full$Respiratory<-with(MHQ_Full, ifelse(!is.na(f.6152.0.0) & f.6152.0.0 == -7, 0,
		   	   	     ifelse(!is.na(f.6152.0.0) & f.6152.0.0 > 0, 1, NA)))

### Recent depresion at baseline - NA if don't answer, 0 if report "not at all", 1 if other report

MHQ_Full$Depressed.At.Baseline<-with(MHQ_Full, ifelse(!is.na(f.2050.0.0) & f.2050.0.0 == 1, 0,
				     	       ifelse(!is.na(f.2050.0.0) & f.2050.0.0 > 1, 1, NA)))

### Neuroticism

MHQ_Full$Neuroticism<-MHQ_Full$f.20127.0

### Loneliness

MHQ_Full$Loneliness<-with(MHQ_Full, ifelse(is.na(f.2020.0.0) | f.2020.0.0 < 0 | is.na(f.2110.0.0) | f.2110.0.0 < 0, NA,
			  	    ifelse(f.2020.0.0 == 1 & f.2110.0.0 == 0, 1, 0)))

### Social.Isolation

MHQ_Full$Social.Isolation<-with(MHQ_Full, ifelse(is.na(Living.Alone) |
				       	  	 is.na(f.1031.0.0) | f.1031.0.0 < 0 |
				       		 is.na(f.6160.0.0) | f.6160.0.0 == -3, NA,
				          ifelse((Living.Alone == 1 & 
					          (f.1031.0.0 > 4 | f.6160.0.0 == -7)) |
						  f.1031.0.0 > 4 & f.6160.0.0 == -7, 1, 0))) 


#####Create MHQ dataset with only respondants

MHQ<-MHQ_Full[!is.na(MHQ_Full$f.20499.0.0), ]

#####Physician Diagnosed Disorders#####

MHQ$SRSocPhobia<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
  			   ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 1) |
		                  (!is.na(f.20544.0.2) & f.20544.0.2 == 1) |
		                  (!is.na(f.20544.0.3) & f.20544.0.3 == 1) |
		                  (!is.na(f.20544.0.4) & f.20544.0.4 == 1) |
		                  (!is.na(f.20544.0.5) & f.20544.0.5 == 1) |
		                  (!is.na(f.20544.0.6) & f.20544.0.6 == 1) |
		                  (!is.na(f.20544.0.7) & f.20544.0.7 == 1) |
		                  (!is.na(f.20544.0.8) & f.20544.0.8 == 1) |
		                  (!is.na(f.20544.0.9) & f.20544.0.9 == 1) |
		                  (!is.na(f.20544.0.10) & f.20544.0.10 == 1) |
		                  (!is.na(f.20544.0.11) & f.20544.0.11 == 1) |
		                  (!is.na(f.20544.0.12) & f.20544.0.12 == 1) |
		                  (!is.na(f.20544.0.13) & f.20544.0.13 == 1) |
		                  (!is.na(f.20544.0.14) & f.20544.0.14 == 1) |
		                  (!is.na(f.20544.0.15) & f.20544.0.15 == 1) |
		                  (!is.na(f.20544.0.16) & f.20544.0.16 == 1), 1, 0)))

MHQ$SRSchizophrenia<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			       ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 2) |
		                      (!is.na(f.20544.0.2) & f.20544.0.2 == 2) |
		                      (!is.na(f.20544.0.3) & f.20544.0.3 == 2) |
		                      (!is.na(f.20544.0.4) & f.20544.0.4 == 2) |
		                      (!is.na(f.20544.0.5) & f.20544.0.5 == 2) |
		                      (!is.na(f.20544.0.6) & f.20544.0.6 == 2) |
		                      (!is.na(f.20544.0.7) & f.20544.0.7 == 2) |
		                      (!is.na(f.20544.0.8) & f.20544.0.8 == 2) |
		                      (!is.na(f.20544.0.9) & f.20544.0.9 == 2) |
		                      (!is.na(f.20544.0.10) & f.20544.0.10 == 2) |
		                      (!is.na(f.20544.0.11) & f.20544.0.11 == 2) |
		                      (!is.na(f.20544.0.12) & f.20544.0.12 == 2) |
		                      (!is.na(f.20544.0.13) & f.20544.0.13 == 2) |
		                      (!is.na(f.20544.0.14) & f.20544.0.14 == 2) |
		                      (!is.na(f.20544.0.15) & f.20544.0.15 == 2) |
		                      (!is.na(f.20544.0.16) & f.20544.0.16 == 2), 1, 0)))

MHQ$SRPsychosisOther<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			        ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 3) |
		                       (!is.na(f.20544.0.2) & f.20544.0.2 == 3) |
		                       (!is.na(f.20544.0.3) & f.20544.0.3 == 3) |
		                       (!is.na(f.20544.0.4) & f.20544.0.4 == 3) |
		                       (!is.na(f.20544.0.5) & f.20544.0.5 == 3) |
		                       (!is.na(f.20544.0.6) & f.20544.0.6 == 3) |
		                       (!is.na(f.20544.0.7) & f.20544.0.7 == 3) |
		                       (!is.na(f.20544.0.8) & f.20544.0.8 == 3) |
		                       (!is.na(f.20544.0.9) & f.20544.0.9 == 3) |
		                       (!is.na(f.20544.0.10) & f.20544.0.10 == 3) |
		                       (!is.na(f.20544.0.11) & f.20544.0.11 == 3) |
		                       (!is.na(f.20544.0.12) & f.20544.0.12 == 3) |
		                       (!is.na(f.20544.0.13) & f.20544.0.13 == 3) |
		                       (!is.na(f.20544.0.14) & f.20544.0.14 == 3) |
		                       (!is.na(f.20544.0.15) & f.20544.0.15 == 3) |
		                       (!is.na(f.20544.0.16) & f.20544.0.16 == 3), 1, 0)))

MHQ$SRPsychosisAny<-with(MHQ, ifelse(is.na(f.20499.0.0), NA,
					 ifelse((!is.na(SRSchizophrenia) & SRSchizophrenia == 1) | (!is.na(SRPsychosisOther) & SRPsychosisOther == 1), 1, 0)))


MHQ$SRPersonalityDisorder<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
				     ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 4) |
		                            (!is.na(f.20544.0.2) & f.20544.0.2 == 4) |
		      		            (!is.na(f.20544.0.3) & f.20544.0.3 == 4) |
		      		            (!is.na(f.20544.0.4) & f.20544.0.4 == 4) |
		      		            (!is.na(f.20544.0.5) & f.20544.0.5 == 4) |
		      		            (!is.na(f.20544.0.6) & f.20544.0.6 == 4) |
		      		            (!is.na(f.20544.0.7) & f.20544.0.7 == 4) |
		      		            (!is.na(f.20544.0.8) & f.20544.0.8 == 4) |
		      		            (!is.na(f.20544.0.9) & f.20544.0.9 == 4) |
		      		            (!is.na(f.20544.0.10) & f.20544.0.10 == 4) |
		      		            (!is.na(f.20544.0.11) & f.20544.0.11 == 4) |
		      		            (!is.na(f.20544.0.12) & f.20544.0.12 == 4) |
		      		            (!is.na(f.20544.0.13) & f.20544.0.13 == 4) |
		      		            (!is.na(f.20544.0.14) & f.20544.0.14 == 4) |
		      		            (!is.na(f.20544.0.15) & f.20544.0.15 == 4) |
		      		            (!is.na(f.20544.0.16) & f.20544.0.16 == 4), 1, 0)))

MHQ$SROtherPhobia<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			     ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 5) |
		      	            (!is.na(f.20544.0.2) & f.20544.0.2 == 5) |
		      	            (!is.na(f.20544.0.3) & f.20544.0.3 == 5) |
		      	            (!is.na(f.20544.0.4) & f.20544.0.4 == 5) |
		    	            (!is.na(f.20544.0.5) & f.20544.0.5 == 5) |
		      	            (!is.na(f.20544.0.6) & f.20544.0.6 == 5) |
		      	            (!is.na(f.20544.0.7) & f.20544.0.7 == 5) |
		      	            (!is.na(f.20544.0.8) & f.20544.0.8 == 5) |
		      	            (!is.na(f.20544.0.9) & f.20544.0.9 == 5) |
		      	            (!is.na(f.20544.0.10) & f.20544.0.10 == 5) |
		      	            (!is.na(f.20544.0.11) & f.20544.0.11 == 5) |
		      	            (!is.na(f.20544.0.12) & f.20544.0.12 == 5) |
		      	            (!is.na(f.20544.0.13) & f.20544.0.13 == 5) |
		      	            (!is.na(f.20544.0.14) & f.20544.0.14 == 5) |
		      	            (!is.na(f.20544.0.15) & f.20544.0.15 == 5) |
		      	            (!is.na(f.20544.0.16) & f.20544.0.16 == 5), 1, 0)))

MHQ$SRPanicAttacks<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			      ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 6) |
		                     (!is.na(f.20544.0.2) & f.20544.0.2 == 6) |
		                     (!is.na(f.20544.0.3) & f.20544.0.3 == 6) |
		                     (!is.na(f.20544.0.4) & f.20544.0.4 == 6) |
		                     (!is.na(f.20544.0.5) & f.20544.0.5 == 6) |
		                     (!is.na(f.20544.0.6) & f.20544.0.6 == 6) |
		                     (!is.na(f.20544.0.7) & f.20544.0.7 == 6) |
		                     (!is.na(f.20544.0.8) & f.20544.0.8 == 6) |
		                     (!is.na(f.20544.0.9) & f.20544.0.9 == 6) |
		                     (!is.na(f.20544.0.10) & f.20544.0.10 == 6) |
		                     (!is.na(f.20544.0.11) & f.20544.0.11 == 6) |
		                     (!is.na(f.20544.0.12) & f.20544.0.12 == 6) |
		                     (!is.na(f.20544.0.13) & f.20544.0.13 == 6) |
		                     (!is.na(f.20544.0.14) & f.20544.0.14 == 6) |
		                     (!is.na(f.20544.0.15) & f.20544.0.15 == 6) |
		                     (!is.na(f.20544.0.16) & f.20544.0.16 == 6), 1, 0)))

MHQ$SROCD<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
		     ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 7) |
		            (!is.na(f.20544.0.2) & f.20544.0.2 == 7) |
		            (!is.na(f.20544.0.3) & f.20544.0.3 == 7) |
		            (!is.na(f.20544.0.4) & f.20544.0.4 == 7) |
		            (!is.na(f.20544.0.5) & f.20544.0.5 == 7) |
		            (!is.na(f.20544.0.6) & f.20544.0.6 == 7) |
		            (!is.na(f.20544.0.7) & f.20544.0.7 == 7) |
		            (!is.na(f.20544.0.8) & f.20544.0.8 == 7) |
		            (!is.na(f.20544.0.9) & f.20544.0.9 == 7) |
		            (!is.na(f.20544.0.10) & f.20544.0.10 == 7) |
		            (!is.na(f.20544.0.11) & f.20544.0.11 == 7) |
		            (!is.na(f.20544.0.12) & f.20544.0.12 == 7) |
		            (!is.na(f.20544.0.13) & f.20544.0.13 == 7) |
		            (!is.na(f.20544.0.14) & f.20544.0.14 == 7) |
		            (!is.na(f.20544.0.15) & f.20544.0.15 == 7) |
		            (!is.na(f.20544.0.16) & f.20544.0.16 == 7), 1, 0)))

MHQ$SRManiaBIP<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			  ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 10) |
		                 (!is.na(f.20544.0.2) & f.20544.0.2 == 10) |
		                 (!is.na(f.20544.0.3) & f.20544.0.3 == 10) |
		                 (!is.na(f.20544.0.4) & f.20544.0.4 == 10) |
		                 (!is.na(f.20544.0.5) & f.20544.0.5 == 10) |
		                 (!is.na(f.20544.0.6) & f.20544.0.6 == 10) |
		                 (!is.na(f.20544.0.7) & f.20544.0.7 == 10) |
		                 (!is.na(f.20544.0.8) & f.20544.0.8 == 10) |
		                 (!is.na(f.20544.0.9) & f.20544.0.9 == 10) |
		                 (!is.na(f.20544.0.10) & f.20544.0.10 == 10) |
		                 (!is.na(f.20544.0.11) & f.20544.0.11 == 10) |
		                 (!is.na(f.20544.0.12) & f.20544.0.12 == 10) |
		                 (!is.na(f.20544.0.13) & f.20544.0.13 == 10) |
		                 (!is.na(f.20544.0.14) & f.20544.0.14 == 10) |
		                 (!is.na(f.20544.0.15) & f.20544.0.15 == 10) |
		                 (!is.na(f.20544.0.16) & f.20544.0.16 == 10), 1, 0)))

MHQ$SRDepression<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			    ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 11) |
		                   (!is.na(f.20544.0.2) & f.20544.0.2 == 11) |
		                   (!is.na(f.20544.0.3) & f.20544.0.3 == 11) |
		                   (!is.na(f.20544.0.4) & f.20544.0.4 == 11) |
		                   (!is.na(f.20544.0.5) & f.20544.0.5 == 11) |
		                   (!is.na(f.20544.0.6) & f.20544.0.6 == 11) |
		                   (!is.na(f.20544.0.7) & f.20544.0.7 == 11) |
		                   (!is.na(f.20544.0.8) & f.20544.0.8 == 11) |
		                   (!is.na(f.20544.0.9) & f.20544.0.9 == 11) |
		                   (!is.na(f.20544.0.10) & f.20544.0.10 == 11) |
		                   (!is.na(f.20544.0.11) & f.20544.0.11 == 11) |
		                   (!is.na(f.20544.0.12) & f.20544.0.12 == 11) |
		                   (!is.na(f.20544.0.13) & f.20544.0.13 == 11) |
		                   (!is.na(f.20544.0.14) & f.20544.0.14 == 11) |
		                   (!is.na(f.20544.0.15) & f.20544.0.15 == 11) |
		                   (!is.na(f.20544.0.16) & f.20544.0.16 == 11), 1, 0)))

MHQ$SRMood<-with(MHQ, ifelse(is.na(f.20499.0.0), NA,
		      ifelse(!is.na(SRManiaBIP) & SRManiaBIP == 1 |
		      	     !is.na(SRDepression) & SRDepression == 1, 1, 0)))

MHQ$SRBulimiaNervosa<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			        ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 12) |
		                       (!is.na(f.20544.0.2) & f.20544.0.2 == 12) |
		                       (!is.na(f.20544.0.3) & f.20544.0.3 == 12) |
		                       (!is.na(f.20544.0.4) & f.20544.0.4 == 12) |
		                       (!is.na(f.20544.0.5) & f.20544.0.5 == 12) |
		                       (!is.na(f.20544.0.6) & f.20544.0.6 == 12) |
		                       (!is.na(f.20544.0.7) & f.20544.0.7 == 12) |
		                       (!is.na(f.20544.0.8) & f.20544.0.8 == 12) |
		                       (!is.na(f.20544.0.9) & f.20544.0.9 == 12) |
		                       (!is.na(f.20544.0.10) & f.20544.0.10 == 12) |
		                       (!is.na(f.20544.0.11) & f.20544.0.11 == 12) |
		                       (!is.na(f.20544.0.12) & f.20544.0.12 == 12) |
		                       (!is.na(f.20544.0.13) & f.20544.0.13 == 12) |
		                       (!is.na(f.20544.0.14) & f.20544.0.14 == 12) |
		                       (!is.na(f.20544.0.15) & f.20544.0.15 == 12) |
		                       (!is.na(f.20544.0.16) & f.20544.0.16 == 12), 1, 0)))

MHQ$SRBingeEating<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			     ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 13) |
		                    (!is.na(f.20544.0.2) & f.20544.0.2 == 13) |
		                    (!is.na(f.20544.0.3) & f.20544.0.3 == 13) |
		                    (!is.na(f.20544.0.4) & f.20544.0.4 == 13) |
		                    (!is.na(f.20544.0.5) & f.20544.0.5 == 13) |
		                    (!is.na(f.20544.0.6) & f.20544.0.6 == 13) |
		                    (!is.na(f.20544.0.7) & f.20544.0.7 == 13) |
		                    (!is.na(f.20544.0.8) & f.20544.0.8 == 13) |
		                    (!is.na(f.20544.0.9) & f.20544.0.9 == 13) |
		                    (!is.na(f.20544.0.10) & f.20544.0.10 == 13) |
		                    (!is.na(f.20544.0.11) & f.20544.0.11 == 13) |
		                    (!is.na(f.20544.0.12) & f.20544.0.12 == 13) |
		                    (!is.na(f.20544.0.13) & f.20544.0.13 == 13) |
		                    (!is.na(f.20544.0.14) & f.20544.0.14 == 13) |
		                    (!is.na(f.20544.0.15) & f.20544.0.15 == 13) |
		                    (!is.na(f.20544.0.16) & f.20544.0.16 == 13), 1, 0)))

MHQ$SRASD<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
		     ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 14) |
		            (!is.na(f.20544.0.2) & f.20544.0.2 == 14) |
		            (!is.na(f.20544.0.3) & f.20544.0.3 == 14) |
		            (!is.na(f.20544.0.4) & f.20544.0.4 == 14) |
		            (!is.na(f.20544.0.5) & f.20544.0.5 == 14) |
		            (!is.na(f.20544.0.6) & f.20544.0.6 == 14) |
		            (!is.na(f.20544.0.7) & f.20544.0.7 == 14) |
		            (!is.na(f.20544.0.8) & f.20544.0.8 == 14) |
		            (!is.na(f.20544.0.9) & f.20544.0.9 == 14) |
		            (!is.na(f.20544.0.10) & f.20544.0.10 == 14) |
		            (!is.na(f.20544.0.11) & f.20544.0.11 == 14) |
		            (!is.na(f.20544.0.12) & f.20544.0.12 == 14) |
		            (!is.na(f.20544.0.13) & f.20544.0.13 == 14) |
		            (!is.na(f.20544.0.14) & f.20544.0.14 == 14) |
		            (!is.na(f.20544.0.15) & f.20544.0.15 == 14) |
		            (!is.na(f.20544.0.16) & f.20544.0.16 == 14), 1, 0)))

MHQ$SRGADandOthers<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			      ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 15) |
		                     (!is.na(f.20544.0.2) & f.20544.0.2 == 15) |
		                     (!is.na(f.20544.0.3) & f.20544.0.3 == 15) |
		                     (!is.na(f.20544.0.4) & f.20544.0.4 == 15) |
		                     (!is.na(f.20544.0.5) & f.20544.0.5 == 15) |
		                     (!is.na(f.20544.0.6) & f.20544.0.6 == 15) |
		                     (!is.na(f.20544.0.7) & f.20544.0.7 == 15) |
		                     (!is.na(f.20544.0.8) & f.20544.0.8 == 15) |
		                     (!is.na(f.20544.0.9) & f.20544.0.9 == 15) |
		                     (!is.na(f.20544.0.10) & f.20544.0.10 == 15) |
		                     (!is.na(f.20544.0.11) & f.20544.0.11 == 15) |
		                     (!is.na(f.20544.0.12) & f.20544.0.12 == 15) |
		                     (!is.na(f.20544.0.13) & f.20544.0.13 == 15) |
		                     (!is.na(f.20544.0.14) & f.20544.0.14 == 15) |
		                     (!is.na(f.20544.0.15) & f.20544.0.15 == 15) |
		                     (!is.na(f.20544.0.16) & f.20544.0.16 == 15), 1, 0)))

MHQ$SRAnorexiaNervosa<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			         ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 16) |
		                        (!is.na(f.20544.0.2) & f.20544.0.2 == 16) |
		                        (!is.na(f.20544.0.3) & f.20544.0.3 == 16) |
		                        (!is.na(f.20544.0.4) & f.20544.0.4 == 16) |
		                        (!is.na(f.20544.0.5) & f.20544.0.5 == 16) |
		                        (!is.na(f.20544.0.6) & f.20544.0.6 == 16) |
		                        (!is.na(f.20544.0.7) & f.20544.0.7 == 16) |
		                        (!is.na(f.20544.0.8) & f.20544.0.8 == 16) |
		                        (!is.na(f.20544.0.9) & f.20544.0.9 == 16) |
		                        (!is.na(f.20544.0.10) & f.20544.0.10 == 16) |
		                        (!is.na(f.20544.0.11) & f.20544.0.11 == 16) |
		                        (!is.na(f.20544.0.12) & f.20544.0.12 == 16) |
		                        (!is.na(f.20544.0.13) & f.20544.0.13 == 16) |
		                        (!is.na(f.20544.0.14) & f.20544.0.14 == 16) |
		                        (!is.na(f.20544.0.15) & f.20544.0.15 == 16) |
		                        (!is.na(f.20544.0.16) & f.20544.0.16 == 16), 1, 0)))

MHQ$SREatingDisorderAny<-with(MHQ, ifelse(is.na(f.20499.0.0), NA,
				   ifelse((!is.na(SRAnorexiaNervosa) & SRAnorexiaNervosa == 1) | 
			         	  (!is.na(SRBulimiaNervosa) & SRBulimiaNervosa == 1) |
			         	  (!is.na(SRBingeEating) & SRBingeEating == 1), 1, 0)))

MHQ$SRAgoraphobia<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
			     ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 17) |
		                    (!is.na(f.20544.0.2) & f.20544.0.2 == 17) |
		                    (!is.na(f.20544.0.3) & f.20544.0.3 == 17) |
		                    (!is.na(f.20544.0.4) & f.20544.0.4 == 17) |
		                    (!is.na(f.20544.0.5) & f.20544.0.5 == 17) |
		                    (!is.na(f.20544.0.6) & f.20544.0.6 == 17) |
		                    (!is.na(f.20544.0.7) & f.20544.0.7 == 17) |
		                    (!is.na(f.20544.0.8) & f.20544.0.8 == 17) |
		                    (!is.na(f.20544.0.9) & f.20544.0.9 == 17) |
		                    (!is.na(f.20544.0.10) & f.20544.0.10 == 17) |
		                    (!is.na(f.20544.0.11) & f.20544.0.11 == 17) |
		                    (!is.na(f.20544.0.12) & f.20544.0.12 == 17) |
		                    (!is.na(f.20544.0.13) & f.20544.0.13 == 17) |
		                    (!is.na(f.20544.0.14) & f.20544.0.14 == 17) |
		                    (!is.na(f.20544.0.15) & f.20544.0.15 == 17) |
		                    (!is.na(f.20544.0.16) & f.20544.0.16 == 17), 1, 0)))

MHQ$SRAnxietyAny<-with(MHQ, ifelse(is.na(f.20499.0.0), NA,
			    ifelse((!is.na(SRSocPhobia) & SRSocPhobia == 1) | 
			           (!is.na(SRGADandOthers) & SRGADandOthers == 1) |
			           (!is.na(SRPanicAttacks) & SRPanicAttacks == 1) |
			           (!is.na(SRAgoraphobia) & SRAgoraphobia == 1) |
			           (!is.na(SROtherPhobia) & SROtherPhobia == 1) |
			           (!is.na(SROCD) & SROCD == 1), 1, 0)))

MHQ$SRADHD<-with(MHQ, ifelse(is.na(f.20499.0.0), NA, 
		      ifelse((!is.na(f.20544.0.1) & f.20544.0.1 == 18) |
		             (!is.na(f.20544.0.2) & f.20544.0.2 == 18) |
		             (!is.na(f.20544.0.3) & f.20544.0.3 == 18) |
		             (!is.na(f.20544.0.4) & f.20544.0.4 == 18) |
		             (!is.na(f.20544.0.5) & f.20544.0.5 == 18) |
		             (!is.na(f.20544.0.6) & f.20544.0.6 == 18) |
		             (!is.na(f.20544.0.7) & f.20544.0.7 == 18) |
		             (!is.na(f.20544.0.8) & f.20544.0.8 == 18) |
		             (!is.na(f.20544.0.9) & f.20544.0.9 == 18) |
		             (!is.na(f.20544.0.10) & f.20544.0.10 == 18) |
		             (!is.na(f.20544.0.11) & f.20544.0.11 == 18) |
		             (!is.na(f.20544.0.12) & f.20544.0.12 == 18) |
		             (!is.na(f.20544.0.13) & f.20544.0.13 == 18) |
		             (!is.na(f.20544.0.14) & f.20544.0.14 == 18) |
		             (!is.na(f.20544.0.15) & f.20544.0.15 == 18) |
		             (!is.na(f.20544.0.16) & f.20544.0.16 == 18), 1, 0)))


#####Interview Diagnoses At Baseline######

InterviewDepression<-apply(MHQ[,grep("f.20002.0", colnames(MHQ))], 1, function(row) "1286" %in% row)

MHQ$InterviewDepression[c(InterviewDepression)]<-1

####HES Inpatient Diagnoses######

ICDFields<-c("F300","F308","F311","F314","F317","F320","F323","F32","F332","F338","F341","F380","F39","F301","F309","F312","F315","F318","F321","F328","F330","F333","F339","F348","F381","F302","F310","F313","F316","F319","F322","F329","F331","F334","F340","F349","F388")


HESMood<-apply(MHQ[,grep("f.4120", colnames(MHQ))], 1, function(row) ICDFields %in% row)

HESMood_Combined<-numeric()

for(indiv in 1:dim(MHQ)[1]){
    HESMood_Combined[indiv]<-ifelse(sum(HESMood[(((indiv-1)*length(ICDFields))+1):(indiv*length(ICDFields))]) == 0, 0, 1)
}

MHQ$HESMood[c(HESMood_Combined==1)]<-1

#####Drug-derived Diagnoses######

## List of codes for antidepressants

antidepcodes<-c("1140879616","1140921600","1140879540","1140867878","1140916282","1140909806","1140867888","1141152732","1141180212","1140879634","1140867876","1140882236",
                "1141190158","1141200564","1140867726","1140879620","1140867818","1140879630","1140879628","1141151946","1140867948","1140867624","1140867756","1140867884",
                "1141151978","1141152736","1141201834","1140867690","1140867640","1140867920","1140867850","1140879544","1141200570","1140867934","1140867758","1140867914",
                "1140867820","1141151982","1140882244","1140879556","1140867852","1140867860","1140917460","1140867938","1140867856","1140867922","1140910820","1140882312",
                "1140867944","1140867784","1140867812","1140867668","1140867940")

DrugDepression<-apply(MHQ[,grep("f.20003.0", colnames(MHQ))], 1, function(row) antidepcodes %in% row)

DrugDepression_Combined<-numeric()

for(indiv in 1:dim(MHQ)[1]){
    DrugDepression_Combined[indiv]<-ifelse(sum(DrugDepression[(((indiv-1)*length(antidepcodes))+1):(indiv*length(antidepcodes))]) == 0, 0, 1)
}

MHQ$DrugDepression[DrugDepression_Combined==1]<-1

###Smith Depression Diagnosis 2013

MHQ$SmithDepression<-with(MHQ, ifelse(is.na(f.20126.0.0), NA,
			       ifelse(!is.na(f.20126.0.0) & f.20126.0.0 > 2, 1, 0)))

#####Depression######

#####Recent depression: PHQ-9######

MHQ$PHQ9.No.Info<-with(MHQ,ifelse((is.na(f.20514.0.0) | f.20514.0.0 < 0) &
                                  (is.na(f.20510.0.0) | f.20510.0.0 < 0),1,0))

MHQ$PHQ9.Screen<-with(MHQ,ifelse(((!is.na(f.20514.0.0) & f.20514.0.0 >= 2) |
				  (!is.na(f.20510.0.0) & f.20510.0.0 >= 2)) &
				 (!is.na(PHQ9.No.Info) & PHQ9.No.Info == 0),1,0))
MHQ$PHQ9.Items<-0

MHQ$PHQ9.Items<-with(MHQ, ifelse(!is.na(f.20514.0.0) & f.20514.0.0 >= 3, PHQ9.Items + 1, PHQ9.Items))
MHQ$PHQ9.Items<-with(MHQ, ifelse(!is.na(f.20507.0.0) & f.20507.0.0 >= 3, PHQ9.Items + 1, PHQ9.Items))
MHQ$PHQ9.Items<-with(MHQ, ifelse(!is.na(f.20510.0.0) & f.20510.0.0 >= 3, PHQ9.Items + 1, PHQ9.Items))
MHQ$PHQ9.Items<-with(MHQ, ifelse(!is.na(f.20508.0.0) & f.20508.0.0 >= 3, PHQ9.Items + 1, PHQ9.Items))
MHQ$PHQ9.Items<-with(MHQ, ifelse(!is.na(f.20517.0.0) & f.20517.0.0 >= 3, PHQ9.Items + 1, PHQ9.Items))
MHQ$PHQ9.Items<-with(MHQ, ifelse(!is.na(f.20518.0.0) & f.20518.0.0 >= 3, PHQ9.Items + 1, PHQ9.Items))
MHQ$PHQ9.Items<-with(MHQ, ifelse(!is.na(f.20519.0.0) & f.20519.0.0 >= 3, PHQ9.Items + 1, PHQ9.Items))
MHQ$PHQ9.Items<-with(MHQ, ifelse(!is.na(f.20511.0.0) & f.20511.0.0 >= 3, PHQ9.Items + 1, PHQ9.Items))
MHQ$PHQ9.Items<-with(MHQ, ifelse(!is.na(f.20513.0.0) & f.20513.0.0 >= 2, PHQ9.Items + 1, PHQ9.Items))


MHQ$PHQ9.Severity<-with(MHQ, ifelse(f.20514.0.0 < 0 | is.na(f.20514.0.0), 0, f.20514.0.0-1) +
			     ifelse(f.20507.0.0 < 0 | is.na(f.20507.0.0), 0, f.20507.0.0-1) +
			     ifelse(f.20510.0.0 < 0 | is.na(f.20510.0.0), 0, f.20510.0.0-1) +
			     ifelse(f.20508.0.0 < 0 | is.na(f.20508.0.0), 0, f.20508.0.0-1) +
			     ifelse(f.20517.0.0 < 0 | is.na(f.20517.0.0), 0, f.20517.0.0-1) +
			     ifelse(f.20518.0.0 < 0 | is.na(f.20518.0.0), 0, f.20518.0.0-1) +
			     ifelse(f.20519.0.0 < 0 | is.na(f.20519.0.0), 0, f.20519.0.0-1) +
			     ifelse(f.20513.0.0 < 0 | is.na(f.20513.0.0), 0, f.20513.0.0-1) +
			     ifelse(f.20511.0.0 < 0 | is.na(f.20511.0.0), 0, f.20511.0.0-1))

#####Lifetime depression:  CIDI-MDD######

MHQ$CIDI.MDD.No.Info<-with(MHQ,ifelse(((is.na(f.20446.0.0) | f.20446.0.0 < 0) &
				       (is.na(f.20441.0.0) | f.20441.0.0 < 0 )), 1, 0))

MHQ$CIDI.MDD.Screen<-with(MHQ,ifelse(((!is.na(f.20446.0.0) & f.20446.0.0 == 1) |
			              (!is.na(f.20441.0.0) & f.20441.0.0 == 1)) &
				     (!is.na(f.20436.0.0) & f.20436.0.0 > 2) &
				     (!is.na(f.20439.0.0) & f.20439.0.0 > 1) &
				     (!is.na(f.20440.0.0) & f.20440.0.0 > 1), 1, 0))

MHQ$CIDI.MDD.Response<-0

MHQ$CIDI.MDD.Response<-with(MHQ, ifelse(!is.na(f.20446.0.0) & f.20446.0.0 > 0, CIDI.MDD.Response + 1, CIDI.MDD.Response))
MHQ$CIDI.MDD.Response<-with(MHQ, ifelse(!is.na(f.20441.0.0) & f.20441.0.0 > 0, CIDI.MDD.Response + 1, CIDI.MDD.Response))
MHQ$CIDI.MDD.Response<-with(MHQ, ifelse(!is.na(f.20449.0.0) & f.20449.0.0 > 0, CIDI.MDD.Response + 1, CIDI.MDD.Response))
MHQ$CIDI.MDD.Response<-with(MHQ, ifelse(!is.na(f.20536.0.0) & f.20536.0.0 > 0, CIDI.MDD.Response + 1, CIDI.MDD.Response))
MHQ$CIDI.MDD.Response<-with(MHQ, ifelse(!is.na(f.20532.0.0) & f.20532.0.0 > 0, CIDI.MDD.Response + 1, CIDI.MDD.Response))
MHQ$CIDI.MDD.Response<-with(MHQ, ifelse(!is.na(f.20435.0.0) & f.20435.0.0 > 0, CIDI.MDD.Response + 1, CIDI.MDD.Response))
MHQ$CIDI.MDD.Response<-with(MHQ, ifelse(!is.na(f.20450.0.0) & f.20450.0.0 > 0, CIDI.MDD.Response + 1, CIDI.MDD.Response))
MHQ$CIDI.MDD.Response<-with(MHQ, ifelse(!is.na(f.20437.0.0) & f.20437.0.0 > 0, CIDI.MDD.Response + 1, CIDI.MDD.Response))

MHQ$CIDI.MDD.Severity<-with(MHQ, ifelse(f.20446.0.0 < 0 | is.na(f.20446.0.0), 0, f.20446.0.0) +
				 ifelse(f.20441.0.0 < 0 | is.na(f.20441.0.0), 0, f.20441.0.0) +
				 ifelse(f.20449.0.0 < 0 | is.na(f.20449.0.0), 0, f.20449.0.0) +
				 ifelse(f.20536.0.0 < 1 | is.na(f.20536.0.0), 0, 1) +
				 ifelse(f.20532.0.0 < 0 | is.na(f.20532.0.0), 0, f.20532.0.0) +
				 ifelse(f.20435.0.0 < 0 | is.na(f.20435.0.0), 0, f.20435.0.0) +
				 ifelse(f.20450.0.0 < 0 | is.na(f.20450.0.0), 0, f.20450.0.0) +
				 ifelse(f.20437.0.0 < 0 | is.na(f.20437.0.0), 0, f.20437.0.0))

#####Depression Diagnoses#####

### Depressed ever is equivalent to screening for caseness on the CIDI

MHQ$Depressed.Ever<-with(MHQ, ifelse(CIDI.MDD.No.Info == 1, NA,
			      ifelse(CIDI.MDD.Screen == 1 & (!is.na(CIDI.MDD.Response) & CIDI.MDD.Response > 4), 1, 
			      ifelse(CIDI.MDD.Screen == 0 & 
			             (!is.na(PHQ9.Severity) & PHQ9.Severity < 5) & 
				     (is.na(SRDepression) | (!is.na(SRDepression) & SRDepression == 0)) &
				     (is.na(InterviewDepression) | (!is.na(InterviewDepression) & InterviewDepression == 0)), 0, NA))))

### Depressed ever severe has all non-core symptoms and "a lot" of impairment on the CIDI

MHQ$Depressed.Ever.Severe<-with(MHQ, ifelse(is.na(Depressed.Ever), NA,
				     ifelse(Depressed.Ever == 0, 0,
				     ifelse(Depressed.Ever == 1 &
				           (!is.na(CIDI.MDD.Severity) & CIDI.MDD.Severity == 8) &
					   (!is.na(f.20440.0.0) & f.20440.0.0 == 3), 1, 0))))

### Depression current is PHQ9 and CIDI case

MHQ$Depressed.Current<-with(MHQ, ifelse(is.na(Depressed.Ever) | PHQ9.No.Info == 1, NA,
				 ifelse(Depressed.Ever == 0 | (!is.na(PHQ9.Severity) & PHQ9.Severity < 5), 0,
				 ifelse(Depressed.Ever == 1 & (!is.na(PHQ9.Screen) & PHQ9.Screen == 1) &
				        (!is.na(PHQ9.Items) & PHQ9.Items > 4), 1, 0))))

### Depression current severe includes severity of PHQ9

MHQ$Depressed.Current.Severe<-with(MHQ, ifelse(is.na(Depressed.Ever) | PHQ9.No.Info == 1, NA,
					ifelse(Depressed.Ever == 0 | (!is.na(PHQ9.Severity) & PHQ9.Severity < 5), 0,
					ifelse(Depressed.Ever == 1 & (!is.na(PHQ9.Screen) & PHQ9.Screen == 1) &
					       (!is.na(PHQ9.Items) & PHQ9.Items > 4) & (!is.na(PHQ9.Severity) & PHQ9.Severity > 15), 1, 0))))

### Subthreshold Depression

MHQ$Subthreshold.Depression<-with(MHQ, ifelse((is.na(Depressed.Ever) | Depressed.Ever == 0) & 
				              (((!is.na(SRDepression) & SRDepression == 1) | (!is.na(InterviewDepression) & InterviewDepression == 1)) |
					       CIDI.MDD.Screen == 1 |
					       (!is.na(PHQ9.Severity) & PHQ9.Severity > 5)), 1,
				       ifelse(!is.na(Depressed.Ever) & Depressed.Ever == 1, 0, NA)))

### Recurrent depression - if bipolar disorder I, excluded from depression diagnosis below

MHQ$Recurrent.Depression<-with(MHQ, ifelse(is.na(Depressed.Ever) | is.na(f.20442.0.0), NA,
				    ifelse(Depressed.Ever == 1 &
				           !is.na(f.20442.0.0) & (f.20442.0.0 > 1 | f.20442.0.0 == -999), 1, 0)))

MHQ$Single.Depression<-with(MHQ, ifelse(is.na(Depressed.Ever) | is.na(f.20442.0.0), NA,
				 ifelse(Depressed.Ever == 1 & Recurrent.Depression == 0, 1, 0)))

#####BPAD#####

### Bipolar Diagnosis as from Smith et al (2013)

MHQ$SmithBipolar<-with(MHQ, ifelse(is.na(f.20126.0.0), NA,
			    ifelse(!is.na(f.20126.0.0) & f.20126.0.0 < 3 & f.20126.0.0 > 0, 1, 0)))

MHQ$SmithMood<-with(MHQ, ifelse(is.na(f.20126.0.0), NA,
		       	 ifelse(!is.na(f.20126.0.0) & f.20126.0.0 > 0, 1, 0)))

### Possible Type I / Type II

MHQ$Total.Manifestations<-0

MHQ$Total.Manifestations<-with(MHQ, ifelse(!is.na(f.20548.0.1) & f.20548.0.1 > 0, Total.Manifestations + 1, Total.Manifestations))
MHQ$Total.Manifestations<-with(MHQ, ifelse(!is.na(f.20548.0.2) & f.20548.0.2 > 0, Total.Manifestations + 1, Total.Manifestations))
MHQ$Total.Manifestations<-with(MHQ, ifelse(!is.na(f.20548.0.3) & f.20548.0.3 > 0, Total.Manifestations + 1, Total.Manifestations))
MHQ$Total.Manifestations<-with(MHQ, ifelse(!is.na(f.20548.0.4) & f.20548.0.4 > 0, Total.Manifestations + 1, Total.Manifestations))
MHQ$Total.Manifestations<-with(MHQ, ifelse(!is.na(f.20548.0.5) & f.20548.0.5 > 0, Total.Manifestations + 1, Total.Manifestations))
MHQ$Total.Manifestations<-with(MHQ, ifelse(!is.na(f.20548.0.6) & f.20548.0.6 > 0, Total.Manifestations + 1, Total.Manifestations))
MHQ$Total.Manifestations<-with(MHQ, ifelse(!is.na(f.20548.0.7) & f.20548.0.7 > 0, Total.Manifestations + 1, Total.Manifestations))
MHQ$Total.Manifestations<-with(MHQ, ifelse(!is.na(f.20548.0.8) & f.20548.0.8 > 0, Total.Manifestations + 1, Total.Manifestations))

### Wider defined bipolar: mania plus three manifestations, or irritability plus four manifestations, for a week or more


MHQ$Wider.Bipolar.Definition<-with(MHQ, ifelse(((is.na(f.20501.0.0) | f.20501.0.0 < 0) &
				 	        (is.na(f.20502.0.0) | f.20502.0.0 < 0)), NA,
				        ifelse(((f.20501.0.0 == 1 &
				       	        MHQ$Total.Manifestations > 2) |
				               (f.20502.0.0 == 1 &
				                MHQ$Total.Manifestations > 3)) &
				       	      !is.na(f.20492.0.0) & f.20492.0.0 == 3, 1, 
				        ifelse((!is.na(SRManiaBIP) & SRManiaBIP == 0) & (is.na(SmithBipolar) | (!is.na(SmithBipolar) & SmithBipolar == 0)), 0, NA))))

### Type I

MHQ$BPDI<-with(MHQ, ifelse(is.na(Wider.Bipolar.Definition), NA,
		    ifelse(Wider.Bipolar.Definition == 1 &
			  (!is.na(f.20493.0.0) & f.20493.0.0 == 1) &
			  (!is.na(Depressed.Ever) & Depressed.Ever == 1), 1, 0)))

### If BIP Type 1, set depression diagnoses to NA

MHQ$Recurrent.Depression.With.BPD<-MHQ$Recurrent.Depression

MHQ$Recurrent.Depression<-with(MHQ, ifelse(BPDI == 1, NA, Recurrent.Depression))


MHQ$Single.Depression.With.BPD<-MHQ$Single.Depression

MHQ$Single.Depression<-with(MHQ, ifelse(BPDI == 1, NA, Single.Depression))

### Type II

MHQ$BPDII<-with(MHQ, ifelse(is.na(Wider.Bipolar.Definition), NA,
		     ifelse(Wider.Bipolar.Definition == 1 &
			   (!is.na(f.20493.0.0) & f.20493.0.0 == 0) &
			   (!is.na(Depressed.Ever) & Depressed.Ever == 1), 1, 0)))

#####Anxiety#####

###GAD-CIDI - Count of somatic symptoms on CIDI 

MHQ$GAD.CIDI.Somatic<-with(MHQ, (!is.na(f.20426.0.0) & f.20426.0.0 > 0) +
			       	(!is.na(f.20423.0.0) & f.20423.0.0 > 0) +
			       	(!is.na(f.20429.0.0) & f.20429.0.0 > 0) +
			       	(!is.na(f.20419.0.0) & f.20419.0.0 > 0) +
			       	(!is.na(f.20422.0.0) & f.20422.0.0 > 0) +
			       	(!is.na(f.20417.0.0) & f.20417.0.0 > 0) +
			       	(!is.na(f.20427.0.0) & f.20427.0.0 > 0))

###GAD-7 - Score

MHQ$GAD7.Severity<-with(MHQ, ifelse(f.20506.0.0 < 0 | is.na(f.20506.0.0), 0, f.20506.0.0-1) +
			     ifelse(f.20509.0.0 < 0 | is.na(f.20509.0.0), 0, f.20509.0.0-1) +
			     ifelse(f.20520.0.0 < 0 | is.na(f.20520.0.0), 0, f.20520.0.0-1) +
			     ifelse(f.20515.0.0 < 0 | is.na(f.20515.0.0), 0, f.20515.0.0-1) +
			     ifelse(f.20516.0.0 < 0 | is.na(f.20516.0.0), 0, f.20516.0.0-1) +
			     ifelse(f.20505.0.0 < 0 | is.na(f.20505.0.0), 0, f.20505.0.0-1) +
			     ifelse(f.20512.0.0 < 0 | is.na(f.20512.0.0), 0, f.20512.0.0-1))

## Set all missing to NA

MHQ$GAD7.Severity<-with(MHQ, ifelse((f.20506.0.0 < 0 | is.na(f.20506.0.0)) &
                                    (f.20509.0.0 < 0 | is.na(f.20509.0.0)) &
                                    (f.20520.0.0 < 0 | is.na(f.20520.0.0)) &
                                    (f.20515.0.0 < 0 | is.na(f.20515.0.0)) &
                                    (f.20516.0.0 < 0 | is.na(f.20516.0.0)) &
                                    (f.20505.0.0 < 0 | is.na(f.20505.0.0)) &
                                    (f.20512.0.0 < 0 | is.na(f.20512.0.0)), NA, GAD7.Severity))

###Generalised Anxiety Disorder Ever

MHQ$GAD.Ever<-with(MHQ, ifelse((is.na(f.20421.0.0) | f.20421.0.0 < 0), NA,
			ifelse((!is.na(f.20421.0.0) & f.20421.0.0  == 0) & 
				GAD7.Severity < 5, 0,
			ifelse((!is.na(f.20421.0.0) & f.20421.0.0  == 1) &
			       (!is.na(f.20420.0.0) & (f.20420.0.0 >= 6 | f.20420.0.0 == -999)) &
			       (!is.na(f.20538.0.0) & f.20538.0.0 == 1) &
			      ((!is.na(f.20425.0.0) & f.20425.0.0 == 1) |
			       (!is.na(f.20542.0.0) & f.20542.0.0 == 1)) &
			      ((!is.na(f.20543.0.0) & f.20543.0.0 == 2) |
			       (!is.na(f.20540.0.0) & f.20540.0.0 == 1)) &
			      ((!is.na(f.20541.0.0) & f.20541.0.0 == 1) |
			       (!is.na(f.20539.0.0) & f.20539.0.0 == 3) |
			       (!is.na(f.20537.0.0) & f.20537.0.0 == 3)) &
			       GAD.CIDI.Somatic >= 3 &
			       (!is.na(f.20418.0.0) & f.20418.0.0 >= 2), 1, NA))))

###Generalised Anxiety Disorder Current

MHQ$GAD.Current<-with(MHQ, ifelse(is.na(GAD.Ever) | is.na(GAD7.Severity), NA,
			   ifelse(GAD.Ever == 1 & GAD7.Severity > 9, 1, 0)))

#####Alcohol#####

### AUDIT Score

MHQ$AUDIT.Score<-0
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20414.0.0) | f.20414.0.0 < 0, AUDIT.Score, AUDIT.Score + f.20414.0.0))
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20403.0.0) | f.20403.0.0 < 0, AUDIT.Score, AUDIT.Score + f.20403.0.0 - 1))
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20416.0.0) | f.20416.0.0 < 0, AUDIT.Score, AUDIT.Score + f.20416.0.0 - 1))
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20409.0.0) | f.20409.0.0 < 0, AUDIT.Score, AUDIT.Score + f.20409.0.0 - 1))
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20408.0.0) | f.20408.0.0 < 0, AUDIT.Score, AUDIT.Score + f.20408.0.0 - 1))
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20411.0.0) | f.20411.0.0 < 0, AUDIT.Score, AUDIT.Score + (2*f.20411.0.0)))
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20405.0.0) | f.20405.0.0 < 0, AUDIT.Score, AUDIT.Score + (2*f.20405.0.0)))
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20413.0.0) | f.20413.0.0 < 0, AUDIT.Score, AUDIT.Score + f.20413.0.0 - 1))
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20407.0.0) | f.20407.0.0 < 0, AUDIT.Score, AUDIT.Score + f.20407.0.0 - 1))
MHQ$AUDIT.Score<-with(MHQ, ifelse(is.na(f.20412.0.0) | f.20412.0.0 < 0, AUDIT.Score, AUDIT.Score + f.20412.0.0 - 1))

### Alcohol Use Disorder

MHQ$Alcohol.Use.Disorder<-with(MHQ, ifelse(AUDIT.Score > 7, 1,
				    ifelse(!is.na(f.20404.0.0) & f.20404.0.0 == 1, NA, 
				    ifelse((!is.na(f.20414.0.0) & f.20414.0.0 == 0) |  
				    	   (!is.na(f.20403.0.0) & f.20403.0.0 == 1 &
				    	    !is.na(f.20416.0.0) & f.20416.0.0 == 1 &
				    	   (is.na(f.2664.0.0) | 
					    (!is.na(f.2664.0.0) & f.2664.0.0 < 0) | 
					    (!is.na(f.2664.0.0) & f.2664.0.0 > 3))), 0, NA))))

#####Cannabis#####

MHQ$Cannabis.Ever<-with(MHQ, ifelse(is.na(f.20453.0.0) | f.20453.0.0 < 0, NA,
			     ifelse(!is.na(f.20453.0.0) & f.20453.0.0 > 0, 1, 0)))

MHQ$Cannabis.Daily<-with(MHQ, ifelse(is.na(f.20454.0.0) | f.20454.0.0 < 0, NA,
			      ifelse(!is.na(f.20454.0.0) & f.20454.0.0 == 4, 1, 0)))

#####Addictions Screen#####

###Addiction Ever

MHQ$Addiction.Ever.SelfReport<-with(MHQ, ifelse(is.na(f.20401.0.0) | f.20401.0.0  < 0, NA, f.20401.0.0))

MHQ$Addiction.Ever<-with(MHQ, ifelse((is.na(f.20401.0.0) | f.20401.0.0  < 0) &
			             (is.na(Cannabis.Daily) | Cannabis.Daily < 0), NA, 
			      ifelse(!is.na(f.20401.0.0) & f.20401.0.0 == 0 & 
			             AUDIT.Score < 16 & 
				     ((!is.na(Cannabis.Ever) & Cannabis.Ever == 0) | (!is.na(Cannabis.Daily) & Cannabis.Daily == 0)), 0, 
			      ifelse(!is.na(f.20401.0.0) & f.20401.0.0 == 1, 1, NA))))

MHQ$Substance.Addiction.Ever<-with(MHQ, ifelse((is.na(f.20406.0.0) | f.20406.0.0 < 0) &  
				   	       (is.na(f.20456.0.0) | f.20456.0.0 < 0) &
				   	       (is.na(f.20503.0.0) | f.20503.0.0 < 0), NA, 
				        ifelse(f.20406.0.0 == 1 | f.20456.0.0 == 1 | f.20503.0.0 == 1, 1, 0)))

MHQ$Alcohol.Dependence.Ever<-with(MHQ, ifelse((is.na(f.20404.0.0) | f.20404.0.0  < 0), NA, f.20404.0.0))

###Addiction Current

MHQ$Addiction.Current<-with(MHQ, ifelse(is.na(Addiction.Ever) |
			                (((is.na(f.20415.0.0) | f.20415.0.0 < 0)) &
					 ((is.na(f.20504.0.0) | f.20504.0.0 < 0)) &
					 ((is.na(f.20457.0.0) | f.20457.0.0 < 0)) &
					 ((is.na(f.20432.0.0) | f.20432.0.0 < 0))), NA,
				 ifelse(Addiction.Ever == 1 &
				       ((!is.na(f.20415.0.0) & f.20415.0.0 == 1) |
				        (!is.na(f.20504.0.0) & f.20504.0.0 == 1) |
					(!is.na(f.20457.0.0) & f.20457.0.0 == 1) |
					(!is.na(f.20432.0.0) & f.20432.0.0 == 1)), 1, 0)))

#####Unusual Experiences#####

###Unusual.Experience Ever Hallucinations

MHQ$Unusual.Experience.Ever.Hallucinations<-with(MHQ, ifelse((is.na(f.20471.0.0) | f.20471.0.0 < 0) &
					            	       (is.na(f.20463.0.0) | f.20463.0.0 < 0), NA,
					     		ifelse((!is.na(f.20471.0.0) & f.20471.0.0 == 1) |
					            	       (!is.na(f.20463.0.0) & f.20463.0.0 == 1), 1, 0)))

###Unusual.Experience.Ever.Delusions

MHQ$Unusual.Experience.Ever.Delusions<-with(MHQ, ifelse((is.na(f.20474.0.0) | f.20474.0.0 < 0) &
					       	   	  (is.na(f.20468.0.0) | f.20468.0.0 < 0), NA,
						   ifelse((!is.na(f.20474.0.0) & f.20474.0.0 == 1) |
					       	   	  (!is.na(f.20468.0.0) & f.20468.0.0 == 1), 1, 0)))

###Unusual.Experience.Ever

MHQ$Unusual.Experience.Ever<-with(MHQ, ifelse((!is.na(Unusual.Experience.Ever.Hallucinations) & Unusual.Experience.Ever.Hallucinations == 1) | 
					        (!is.na(Unusual.Experience.Ever.Delusions) & Unusual.Experience.Ever.Delusions == 1), 1, 
					 ifelse(!is.na(SRPsychosisAny) & SRPsychosisAny == 0, 0, NA)))
###Unusual.Experience.Recent

MHQ$Unusual.Experience.Recent<-with(MHQ, ifelse((is.na(f.20467.0.0) | f.20467.0.0 < 0), NA,
					   ifelse(f.20467.0.0 > 1, 1, 0)))

#####Trauma#####

###Trauma Childhood

MHQ$Trauma.Childhood<-with(MHQ, ifelse((is.na(f.20488.0.0) | f.20488.0.0 < 0) |
				       (is.na(f.20487.0.0) | f.20487.0.0 < 0) |
				       (is.na(f.20490.0.0) | f.20490.0.0 < 0) |
				       (is.na(f.20491.0.0) | f.20491.0.0 < 0) |
				       (is.na(f.20489.0.0) | f.20489.0.0 < 0), NA,
				ifelse(f.20488.0.0 > 0 |
				       f.20487.0.0 > 0 |
				       f.20490.0.0 > 0 | 
				       (4-f.20491.0.0) > 0 |
				       (4-f.20489.0.0) > 1, 1, 0)))

###Trauma Adult

MHQ$Trauma.Adult<-with(MHQ, ifelse((is.na(f.20523.0.0) | f.20523.0.0 < 0) |
				   (is.na(f.20521.0.0) | f.20521.0.0 < 0) |
				   (is.na(f.20524.0.0) | f.20524.0.0 < 0) |
				   (is.na(f.20522.0.0) | f.20522.0.0 < 0) |
				   (is.na(f.20525.0.0) | f.20525.0.0 < 0), NA,
			    ifelse(f.20523.0.0 > 0 |
				   f.20521.0.0 > 0 |
				   f.20524.0.0 > 0 |
				   (4-f.20522.0.0) > 1 |
				   (4-f.20525.0.0) > 0, 1, 0)))

###Trauma Catastrophic

MHQ$Trauma.Catastrophic<-with(MHQ, ifelse((is.na(f.20527.0.0) | f.20527.0.0 < 0) &
				          (is.na(f.20526.0.0) | f.20526.0.0 < 0) &
					  (is.na(f.20528.0.0) | f.20528.0.0 < 0) &
					  (is.na(f.20529.0.0) | f.20529.0.0 < 0) &
					  (is.na(f.20531.0.0) | f.20531.0.0 < 0) &
					  (is.na(f.20530.0.0) | f.20530.0.0 < 0), NA,
				   ifelse((!is.na(f.20527.0.0) & f.20527.0.0 > 0) |
				          (!is.na(f.20526.0.0) & f.20526.0.0 > 0) |
					  (!is.na(f.20528.0.0) & f.20528.0.0 > 0) |
					  (!is.na(f.20529.0.0) & f.20529.0.0 > 0) |
					  (!is.na(f.20531.0.0) & f.20531.0.0 > 0) |
					  (!is.na(f.20530.0.0) & f.20530.0.0 > 0), 1, 0)))

#####PTSD#####

###PCL-6 - Trouble concentrating item is borrowed from PHQ9, scored 1-4, compare 1-5 for other items

MHQ$PCL.Score<-0

MHQ$PCL.Score<-with(MHQ, ifelse(is.na(f.20497.0.0) | f.20497.0.0 < 0, PCL.Score, f.20497.0.0 + 1 + PCL.Score))
MHQ$PCL.Score<-with(MHQ, ifelse(is.na(f.20498.0.0) | f.20498.0.0 < 0, PCL.Score, f.20498.0.0 + 1 + PCL.Score))
MHQ$PCL.Score<-with(MHQ, ifelse(is.na(f.20495.0.0) | f.20495.0.0 < 0, PCL.Score, f.20495.0.0 + 1 + PCL.Score))
MHQ$PCL.Score<-with(MHQ, ifelse(is.na(f.20496.0.0) | f.20496.0.0 < 0, PCL.Score, f.20496.0.0 + 1 + PCL.Score))
MHQ$PCL.Score<-with(MHQ, ifelse(is.na(f.20494.0.0) | f.20494.0.0 < 0, PCL.Score, f.20494.0.0 + 1 + PCL.Score))
MHQ$PCL.Score<-with(MHQ, ifelse(is.na(f.20508.0.0) | f.20508.0.0 < 0, PCL.Score, f.20508.0.0 + PCL.Score))

MHQ$PTSD<-with(MHQ, ifelse((is.na(f.20497.0.0) | f.20497.0.0 < 0) |
			   (is.na(f.20498.0.0) | f.20498.0.0 < 0) |
			   (is.na(f.20495.0.0) | f.20495.0.0 < 0) |
			   (is.na(f.20508.0.0) | f.20508.0.0 < 0), NA, 
		     ifelse(PCL.Score > 13, 1, 0)))

#####Self-Harm#####

### Self Harm Ever

MHQ$Self.Harm.Ever<-with(MHQ, ifelse((is.na(f.20480.0.0) | f.20480.0.0 < 0), NA, f.20480.0.0))

### Life Not Worth Living and Suicide Attempt

MHQ$Not.Worth.Living<-with(MHQ, ifelse(is.na(f.20479.0.0), NA,
				ifelse(!is.na(f.20479.0.0) & f.20479.0.0 > 0, 1, 0)))

MHQ$Self.Harm.Suicide.Attempt<-with(MHQ, ifelse((is.na(f.20479.0.0) | f.20479.0.0 < 0) |
					        (is.na(f.20483.0.0) | f.20483.0.0 < 0), NA,
					 ifelse(f.20479.0.0 > 0 &
					        f.20483.0.0 == 1, 1, 0)))

#####Wellbeing#####

MHQ$WellbeingScore<-with(MHQ, ifelse(is.na(f.20458.0.0) | f.20458.0.0 < 0 | is.na(f.20459.0.0) | f.20459.0.0 < 0 | is.na(f.20460.0.0) | f.20460.0.0 < 0, NA, 
			             ((7-f.20458.0.0) + (7-f.20459.0.0) + f.20460.0.0)))
 
#####CombinedSelfReportConditions#####

MHQ$SRConditionsSum<-0
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRSchizophrenia == 1, SRConditionsSum + 1, SRConditionsSum)) 
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRPsychosisOther == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRDepression == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRManiaBIP == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRGADandOthers == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRPanicAttacks == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRAgoraphobia == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRSocPhobia == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SROtherPhobia == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SROCD == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRPersonalityDisorder == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRAnorexiaNervosa == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRBulimiaNervosa == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRBingeEating == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRASD == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(SRADHD == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(!is.na(Alcohol.Dependence.Ever) & Alcohol.Dependence.Ever == 1, SRConditionsSum + 1, SRConditionsSum))
MHQ$SRConditionsSum<-with(MHQ, ifelse(!is.na(Addiction.Ever) & Addiction.Ever == 1, SRConditionsSum + 1, SRConditionsSum))

MHQ$NoSRConditions<-with(MHQ,ifelse(SRConditionsSum == 0, 1, 0))

MHQ$MultipleSRConditions<-with(MHQ,ifelse(SRConditionsSum > 1, 1, 0))

#####Depression Comorbidity Codes#####

MHQ$NoComorbidity<-with(MHQ, ifelse(is.na(Wider.Bipolar.Definition) & is.na(GAD.Ever) & is.na(Alcohol.Use.Disorder) & is.na(Unusual.Experience.Ever), NA,
			     ifelse((!is.na(Wider.Bipolar.Definition) & Wider.Bipolar.Definition == 1) | 
			     	    (!is.na(GAD.Ever) & GAD.Ever == 1) |
				    (!is.na(Alcohol.Use.Disorder) & Alcohol.Use.Disorder == 1) | 
				    (!is.na(Unusual.Experience.Ever) & Unusual.Experience.Ever == 1), 0, 1)))

MHQ$AnyComorbidity<-with(MHQ, ifelse(is.na(Wider.Bipolar.Definition) & is.na(GAD.Ever) & is.na(Alcohol.Use.Disorder) & is.na(Unusual.Experience.Ever), NA,
			      ifelse(NoComorbidity == 1, 0, 1)))

MHQ$MultipleComorbidity<-with(MHQ, ifelse(is.na(Wider.Bipolar.Definition) & is.na(GAD.Ever) & is.na(Alcohol.Use.Disorder) & is.na(Unusual.Experience.Ever), NA,
				   ifelse(NoComorbidity == 1, 0,
			     	   ifelse(((!is.na(Wider.Bipolar.Definition) & Wider.Bipolar.Definition == 1) & 
			     	    	  ((!is.na(GAD.Ever) & GAD.Ever == 1) |
				           (!is.na(Alcohol.Use.Disorder) & Alcohol.Use.Disorder == 1) | 
				           (!is.na(Unusual.Experience.Ever) & Unusual.Experience.Ever == 1))) | 
					  ((!is.na(GAD.Ever) & GAD.Ever == 1) & 
				          ((!is.na(Alcohol.Use.Disorder) & Alcohol.Use.Disorder == 1) | 
				           (!is.na(Unusual.Experience.Ever) & Unusual.Experience.Ever == 1))) | 
					  ((!is.na(Alcohol.Use.Disorder) & Alcohol.Use.Disorder == 1) & 
					  (!is.na(Unusual.Experience.Ever) & Unusual.Experience.Ever == 1)), 1, 0))))

#####MH Screen######

## Score
## 1 - Case of any kind
## 0 - Not case on any disorder - no to mental distress and professional help, NA on problems diagnosed

MHQ$MH.Screen<-with(MHQ, ifelse(((is.na(f.20500.0.0) | f.20500.0.0 < 0) |
 			 	 (is.na(f.20499.0.0) | f.20499.0.0 < 0)) &
				 (!is.na(f.20544.0.1) & f.20544.0.1 < 0), NA,
			 ifelse(f.20500.0.0 == 1 |
			        f.20499.0.0 == 1 |
				(!is.na(f.20544.0.1) &
				 f.20544.0.1 > 0), 1, 0)))

##If case {any} -> case, NOT control

MHQ$MH.Screen<-with(MHQ, ifelse((!is.na(Depressed.Ever) & Depressed.Ever == 1) |
				(!is.na(Wider.Bipolar.Definition) & Wider.Bipolar.Definition == 1) |
				(!is.na(GAD.Ever) & GAD.Ever == 1) |
				(!is.na(Addiction.Ever) & Addiction.Ever == 1) |
				(!is.na(Unusual.Experience.Ever) & Unusual.Experience.Ever == 1) |
				(!is.na(PTSD) & PTSD == 1) |
				(!is.na(Self.Harm.Ever) & Self.Harm.Ever == 1), 1, MH.Screen))

MHQ$MH.Questionnaires<-with(MHQ, ifelse((!is.na(Depressed.Ever) & Depressed.Ever == 1) |
				 	(!is.na(Wider.Bipolar.Definition) & Wider.Bipolar.Definition == 1) |
					(!is.na(GAD.Ever) & GAD.Ever == 1) |
					(!is.na(Alcohol.Use.Disorder) & Alcohol.Use.Disorder == 1) |
					(!is.na(Unusual.Experience.Ever) & Unusual.Experience.Ever == 1) |
					(!is.na(PTSD) & PTSD == 1) |
					(!is.na(Self.Harm.Ever) & Self.Harm.Ever == 1), 1, 0))

MHQ$MH.Questionnaires.Short<-with(MHQ, ifelse((!is.na(Depressed.Ever) & Depressed.Ever == 1) |
				 	      (!is.na(GAD.Ever) & GAD.Ever == 1) |
					      (!is.na(Unusual.Experience.Ever) & Unusual.Experience.Ever == 1) |
					      (!is.na(Addiction.Ever) & Addiction.Ever == 1), 1, 0))

##Split MHQ by gender for tables

MHQ_Female<-MHQ[MHQ$Gender == 0, ]
MHQ_Male<-MHQ[MHQ$Gender == 1, ]

#####Output######

### Table 2 - Demographics

sink("MHQ_Table2_Demographics.txt")
cat("MHQ Participants\n")
print(summary(~Age.Group + Gender + Ethnicity + Migrant.Status + TDI.Tertiles + Highest.Qualification + SOC.Job.Code.Broad + House.Ownership + Income + Cohabiting + Smoker + Longstanding.Illness + Diabetes + Cancer + Depressed.At.Baseline, data=MHQ, fun=table, na.include=TRUE))
cat("All Participants\n")
print(summary(~Age.Group + Gender + Ethnicity + Migrant.Status + TDI.Tertiles + Highest.Qualification + SOC.Job.Code.Broad + House.Ownership + Income + Cohabiting + Smoker + Longstanding.Illness + Diabetes + Cancer + Depressed.At.Baseline, data=MHQ_Full, fun=table, na.include=TRUE))
sink()

### Table 3 - Self-reported mental health

sink("MHQ_Table3_SelfReportedMH.txt")
print(summary(~ SRPsychosisAny + SRSchizophrenia + SRPsychosisOther + SRDepression + SRManiaBIP + SRGADandOthers + SRPanicAttacks + SRAgoraphobia + SRSocPhobia + SROtherPhobia + SROCD + SRPersonalityDisorder + SREatingDisorderAny + SRAnorexiaNervosa + SRBulimiaNervosa + SRBingeEating + SRASD + SRADHD + Alcohol.Dependence.Ever + Addiction.Ever.SelfReport + Substance.Addiction.Ever + NoSRConditions + MultipleSRConditions, data=MHQ, fun=table, na.include=TRUE))
sink()

### Table 4 - Questionnaires split by sex

sink("MHQ_Table4_GenderSplitMH.txt")
print(summary(Gender ~ Depressed.Ever + Wider.Bipolar.Definition + GAD.Ever + Unusual.Experience.Ever + Self.Harm.Ever + Alcohol.Use.Disorder + PTSD + MH.Questionnaires, data=MHQ, fun=table, na.include=TRUE))
sink()

### Table 5 - Crosstabs of derived MH conditions

sink("MHQ_Table5_Crosstab_MH_Conditions.txt")
print(summary(Depressed.Ever ~ Depressed.Ever + Wider.Bipolar.Definition + GAD.Ever + Unusual.Experience.Ever + Self.Harm.Ever + Alcohol.Use.Disorder + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(summary(Wider.Bipolar.Definition ~ Depressed.Ever + Wider.Bipolar.Definition + GAD.Ever + Unusual.Experience.Ever + Self.Harm.Ever + Alcohol.Use.Disorder + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(summary(GAD.Ever ~ Depressed.Ever + Wider.Bipolar.Definition + GAD.Ever + Unusual.Experience.Ever + Self.Harm.Ever + Alcohol.Use.Disorder + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(summary(Unusual.Experience.Ever ~ Depressed.Ever + Wider.Bipolar.Definition + GAD.Ever + Unusual.Experience.Ever + Self.Harm.Ever + Alcohol.Use.Disorder + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(summary(Self.Harm.Ever ~ Depressed.Ever + Wider.Bipolar.Definition + GAD.Ever + Unusual.Experience.Ever + Self.Harm.Ever + Alcohol.Use.Disorder + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(summary(Alcohol.Use.Disorder ~ Depressed.Ever + Wider.Bipolar.Definition + GAD.Ever + Unusual.Experience.Ever + Self.Harm.Ever + Alcohol.Use.Disorder, data=MHQ, fun=table, na.include=TRUE))
print(with(MHQ,ftable(Alcohol.Use.Disorder,PTSD, useNA="a", exclude=NULL)))
print(summary(PTSD ~ Depressed.Ever + Wider.Bipolar.Definition + GAD.Ever + Unusual.Experience.Ever + Self.Harm.Ever + Alcohol.Use.Disorder + PTSD, data=MHQ, fun=table, na.include=TRUE))
sink()


### Table 6 - Demographics versus questionnaires

sink("MHQ_Table6_Demographics_Questionnaires.txt")
print(summary(MH.Questionnaires.Short ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Trauma.Catastrophic + Loneliness +  Smoker + Cannabis.Ever + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - MH Screen == 0: Mean, SD\n")
print(mean(MHQ[MHQ$MH.Questionnaires.Short == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$MH.Questionnaires.Short == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - MH Screen == 1: Mean, SD\n")
print(mean(MHQ[MHQ$MH.Questionnaires.Short == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$MH.Questionnaires.Short == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ, ftable(MH.Questionnaires.Short, Cannabis.Daily, useNA="a", exclude=NULL)))
print(with(MHQ, ftable(MH.Questionnaires.Short, Social.Isolation, useNA="a", exclude=NULL)))
print(summary(Depressed.Ever ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Trauma.Catastrophic + Loneliness +  Smoker + Cannabis.Ever + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - Depressed.Ever == 0: Mean, SD\n")
print(mean(MHQ[MHQ$Depressed.Ever == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - Depressed.Ever == 1: Mean, SD\n")
print(mean(MHQ[MHQ$Depressed.Ever == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ, ftable(Depressed.Ever, Cannabis.Daily, useNA="a", exclude=NULL)))
print(with(MHQ, ftable(Depressed.Ever, Social.Isolation, useNA="a", exclude=NULL)))
print(summary(GAD.Ever ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Trauma.Catastrophic + Loneliness +  Smoker + Cannabis.Ever + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - GAD.Ever == 0: Mean, SD\n")
print(mean(MHQ[MHQ$GAD.Ever == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$GAD.Ever == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - GAD.Ever == 1: Mean, SD\n")
print(mean(MHQ[MHQ$GAD.Ever == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$GAD.Ever == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ, ftable(GAD.Ever, Cannabis.Daily, useNA="a", exclude=NULL)))
print(with(MHQ, ftable(GAD.Ever, Social.Isolation, useNA="a", exclude=NULL)))
print(summary(Unusual.Experience.Ever ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Trauma.Catastrophic + Loneliness +  Smoker + Cannabis.Ever + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - Unusual.Experience.Ever == 0: Mean, SD\n")
print(mean(MHQ[MHQ$Unusual.Experience.Ever == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Unusual.Experience.Ever == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - Unusual.Experience.Ever == 1: Mean, SD\n")
print(mean(MHQ[MHQ$Unusual.Experience.Ever == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Unusual.Experience.Ever == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ, ftable(Unusual.Experience.Ever, Cannabis.Daily, useNA="a", exclude=NULL)))
print(with(MHQ, ftable(Unusual.Experience.Ever, Social.Isolation, useNA="a", exclude=NULL)))
print(summary(Addiction.Ever ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Loneliness +  Smoker + Cannabis.Ever + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - Addiction.Ever == 0: Mean, SD\n")
print(mean(MHQ[MHQ$Addiction.Ever == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Addiction.Ever == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - Addiction.Ever == 1: Mean, SD\n")
print(mean(MHQ[MHQ$Addiction.Ever == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Addiction.Ever == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ,ftable(Addiction.Ever, Trauma.Catastrophic, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(Addiction.Ever, Cannabis.Daily, useNA="a", exclude=NULL)))
print(with(MHQ, ftable(Addiction.Ever, Social.Isolation, useNA="a", exclude=NULL)))
sink()


### TableS1 - Demographics versus depression

sink("MHQ_TableS1_Demographics_Depression.txt")
print(summary(Depressed.Ever ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Trauma.Catastrophic + Loneliness + Smoker + Cannabis.Ever + Cannabis.Daily + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - Depressed.Ever == 0: Mean, SD\n")
print(mean(MHQ[MHQ$Depressed.Ever == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - Depressed.Ever == 1: Mean, SD\n")
print(mean(MHQ[MHQ$Depressed.Ever == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ,ftable(Depressed.Ever, Social.Isolation, useNA="a", exclude=NULL)))
print(summary(Subthreshold.Depression ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Trauma.Catastrophic + Loneliness + Smoker + Cannabis.Ever + Cannabis.Daily + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - Subthreshold.Depression == 0: Mean, SD\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - Subthreshold.Depression == 1: Mean, SD\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ,ftable(Subthreshold.Depression, Social.Isolation, useNA="a", exclude=NULL)))
print(summary(Single.Depression ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Trauma.Catastrophic + Loneliness + Smoker + Cannabis.Ever + Cannabis.Daily + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - Single.Depression == 0: Mean, SD\n")
print(mean(MHQ[MHQ$Single.Depression == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - Single.Depression == 1: Mean, SD\n")
print(mean(MHQ[MHQ$Single.Depression == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ,ftable(Single.Depression, Social.Isolation, useNA="a", exclude=NULL)))
print(summary(Recurrent.Depression ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Trauma.Catastrophic + Loneliness + Smoker + Cannabis.Ever + Cannabis.Daily + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - Recurrent.Depression == 0: Mean, SD\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - Recurrent.Depression == 1: Mean, SD\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ,ftable(Recurrent.Depression, Social.Isolation, useNA="a", exclude=NULL)))
print(summary(BPDI ~ Age.Group + Gender + Ethnicity + TDI.Tertiles + Highest.Qualification + House.Ownership + Trauma.Childhood + Trauma.Adult + Loneliness + Cannabis.Ever + Cannabis.Daily + Moderate.Physical.Activity + Longstanding.Illness, data=MHQ, fun=table, na.include=TRUE))
cat("Neuroticism - BPDI == 0: Mean, SD\n")
print(mean(MHQ[MHQ$BPDI == 0, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 0, ]$Neuroticism, na.rm=T))
cat("Neuroticism - BPDI == 1: Mean, SD\n")
print(mean(MHQ[MHQ$BPDI == 1, ]$Neuroticism, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 1, ]$Neuroticism, na.rm=T))
print(with(MHQ,ftable(BPDI, Trauma.Catastrophic, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(BPDI, Smoker, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(BPDI, Social.Isolation, useNA="a", exclude=NULL)))
sink()

### Table S2 - Depression versus comorbidities (categorical)

sink("MHQ_TableS2_Depression_Comorbidities_Categorical.txt")
print(summary(Depressed.Ever ~ Wider.Bipolar.Definition + GAD.Ever + Alcohol.Use.Disorder + Unusual.Experience.Ever + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(with(MHQ,ftable(Depressed.Ever, NoComorbidity, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(Depressed.Ever, MultipleComorbidity, useNA="a", exclude=NULL)))
print(summary(Subthreshold.Depression ~ Wider.Bipolar.Definition + GAD.Ever + Alcohol.Use.Disorder + Unusual.Experience.Ever + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(with(MHQ,ftable(Subthreshold.Depression, NoComorbidity, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(Subthreshold.Depression, MultipleComorbidity, useNA="a", exclude=NULL)))
print(summary(Single.Depression ~ GAD.Ever + Alcohol.Use.Disorder + Unusual.Experience.Ever + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(with(MHQ,ftable(Single.Depression, Wider.Bipolar.Definition, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(Single.Depression, NoComorbidity, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(Single.Depression, MultipleComorbidity, useNA="a", exclude=NULL)))
print(summary(Recurrent.Depression ~ GAD.Ever + Alcohol.Use.Disorder + Unusual.Experience.Ever + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(with(MHQ,ftable(Recurrent.Depression, Wider.Bipolar.Definition, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(Recurrent.Depression, NoComorbidity, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(Recurrent.Depression, MultipleComorbidity, useNA="a", exclude=NULL)))
print(summary(BPDI ~ GAD.Ever + Alcohol.Use.Disorder + Unusual.Experience.Ever + PTSD, data=MHQ, fun=table, na.include=TRUE))
print(with(MHQ,ftable(BPDI, Wider.Bipolar.Definition, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(BPDI, NoComorbidity, useNA="a", exclude=NULL)))
print(with(MHQ,ftable(BPDI, MultipleComorbidity, useNA="a", exclude=NULL)))
sink()

### Table S3 - Depression versus comorbidities (continuous)

sink("MHQ_TableS3_Depression_Comorbidities_Continuous.txt")
cat("PHQ9 - Depressed.Ever == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Depressed.Ever == 0, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 0, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$Depressed.Ever == 0, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Depressed.Ever == 0, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("PHQ9 - Depressed.Ever == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Depressed.Ever == 1, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 1, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$Depressed.Ever == 1, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Depressed.Ever == 1, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - Depressed.Ever == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Depressed.Ever == 0, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 0, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$Depressed.Ever == 0, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Depressed.Ever == 0, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - Depressed.Ever == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Depressed.Ever == 1, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 1, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$Depressed.Ever == 1, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Depressed.Ever == 1, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("AUDIT - Depressed.Ever == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Depressed.Ever == 0, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 0, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$Depressed.Ever == 0, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Depressed.Ever == 0, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("AUDIT - Depressed.Ever == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Depressed.Ever == 1, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 1, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$Depressed.Ever == 1, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Depressed.Ever == 1, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("Wellbeing - Depressed.Ever == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Depressed.Ever == 0, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 0, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$Depressed.Ever == 0, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Depressed.Ever == 0, ]$WellbeingScore), probs=seq(0,1,0.25)))
cat("Wellbeing - Depressed.Ever == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Depressed.Ever == 1, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$Depressed.Ever == 1, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$Depressed.Ever == 1, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Depressed.Ever == 1, ]$WellbeingScore), probs=seq(0,1,0.25)))
cat("PHQ9 - Subthreshold.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 0, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 0, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$Subthreshold.Depression == 0, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Subthreshold.Depression == 0, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("PHQ9 - Subthreshold.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 1, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 1, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$Subthreshold.Depression == 1, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Subthreshold.Depression == 1, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - Subthreshold.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 0, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 0, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$Subthreshold.Depression == 0, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Subthreshold.Depression == 0, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - Subthreshold.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 1, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 1, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$Subthreshold.Depression == 1, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Subthreshold.Depression == 1, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("AUDIT - Subthreshold.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 0, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 0, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$Subthreshold.Depression == 0, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Subthreshold.Depression == 0, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("AUDIT - Subthreshold.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 1, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 1, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$Subthreshold.Depression == 1, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Subthreshold.Depression == 1, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("Wellbeing - Subthreshold.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 0, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 0, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$Subthreshold.Depression == 0, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Subthreshold.Depression == 0, ]$WellbeingScore), probs=seq(0,1,0.25)))
cat("Wellbeing - Subthreshold.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Subthreshold.Depression == 1, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$Subthreshold.Depression == 1, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$Subthreshold.Depression == 1, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Subthreshold.Depression == 1, ]$WellbeingScore), probs=seq(0,1,0.25)))
cat("PHQ9 - Single.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Single.Depression == 0, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 0, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$Single.Depression == 0, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Single.Depression == 0, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("PHQ9 - Single.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Single.Depression == 1, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 1, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$Single.Depression == 1, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Single.Depression == 1, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - Single.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Single.Depression == 0, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 0, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$Single.Depression == 0, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Single.Depression == 0, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - Single.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Single.Depression == 1, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 1, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$Single.Depression == 1, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Single.Depression == 1, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("AUDIT - Single.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Single.Depression == 0, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 0, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$Single.Depression == 0, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Single.Depression == 0, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("AUDIT - Single.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Single.Depression == 1, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 1, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$Single.Depression == 1, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Single.Depression == 1, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("Wellbeing - Single.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Single.Depression == 0, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 0, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$Single.Depression == 0, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Single.Depression == 0, ]$WellbeingScore), probs=seq(0,1,0.25)))
cat("Wellbeing - Single.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Single.Depression == 1, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$Single.Depression == 1, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$Single.Depression == 1, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Single.Depression == 1, ]$WellbeingScore), probs=seq(0,1,0.25)))
cat("PHQ9 - Recurrent.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 0, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 0, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$Recurrent.Depression == 0, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Recurrent.Depression == 0, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("PHQ9 - Recurrent.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 1, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 1, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$Recurrent.Depression == 1, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Recurrent.Depression == 1, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - Recurrent.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 0, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 0, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$Recurrent.Depression == 0, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Recurrent.Depression == 0, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - Recurrent.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 1, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 1, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$Recurrent.Depression == 1, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Recurrent.Depression == 1, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("AUDIT - Recurrent.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 0, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 0, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$Recurrent.Depression == 0, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Recurrent.Depression == 0, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("AUDIT - Recurrent.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 1, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 1, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$Recurrent.Depression == 1, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Recurrent.Depression == 1, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("Wellbeing - Recurrent.Depression == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 0, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 0, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$Recurrent.Depression == 0, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Recurrent.Depression == 0, ]$WellbeingScore), probs=seq(0,1,0.25)))
cat("Wellbeing - Recurrent.Depression == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$Recurrent.Depression == 1, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$Recurrent.Depression == 1, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$Recurrent.Depression == 1, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$Recurrent.Depression == 1, ]$WellbeingScore), probs=seq(0,1,0.25)))
cat("PHQ9 - BPDI == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$BPDI == 0, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 0, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$BPDI == 0, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$BPDI == 0, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("PHQ9 - BPDI == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$BPDI == 1, ]$PHQ9.Severity, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 1, ]$PHQ9.Severity, na.rm=T))
print(median(MHQ[MHQ$BPDI == 1, ]$PHQ9.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$BPDI == 1, ]$PHQ9.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - BPDI == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$BPDI == 0, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 0, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$BPDI == 0, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$BPDI == 0, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("GAD7 - BPDI == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$BPDI == 1, ]$GAD7.Severity, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 1, ]$GAD7.Severity, na.rm=T))
print(median(MHQ[MHQ$BPDI == 1, ]$GAD7.Severity, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$BPDI == 1, ]$GAD7.Severity), probs=seq(0,1,0.25)))
cat("AUDIT - BPDI == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$BPDI == 0, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 0, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$BPDI == 0, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$BPDI == 0, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("AUDIT - BPDI == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$BPDI == 1, ]$AUDIT.Score, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 1, ]$AUDIT.Score, na.rm=T))
print(median(MHQ[MHQ$BPDI == 1, ]$AUDIT.Score, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$BPDI == 1, ]$AUDIT.Score), probs=seq(0,1,0.25)))
cat("Wellbeing - BPDI == 0: Mean, SD, Median\n")
print(mean(MHQ[MHQ$BPDI == 0, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 0, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$BPDI == 0, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$BPDI == 0, ]$WellbeingScore), probs=seq(0,1,0.25)))
cat("Wellbeing - BPDI == 1: Mean, SD, Median\n")
print(mean(MHQ[MHQ$BPDI == 1, ]$WellbeingScore, na.rm=T))
print(sd(MHQ[MHQ$BPDI == 1, ]$WellbeingScore, na.rm=T))
print(median(MHQ[MHQ$BPDI == 1, ]$WellbeingScore, na.rm=T))
print(quantile(na.omit(MHQ[MHQ$BPDI == 1, ]$WellbeingScore), probs=seq(0,1,0.25)))
sink()

##Output data

write.table(MHQ, "Process_MH_Questionnaire_Output.txt", row.names=F, col.name=T, quote=T)

save.image("Process_MH_Questionnaire_Output.Rdata")