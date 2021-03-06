/*
Assistant
*/
/datum/job/citizen
	title = "Citizen"
	flag = CITIZEN
	department_flag = CIVILIAN
	faction = "City"
	total_positions = 100
	spawn_positions = 100
	supervisors = "no one, it's a free country"
	selection_color = "#dddddd"
	access = list("All")			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	outfit = /datum/outfit/job/citizen
	antag_rep = 7


/datum/job/assistant/get_access()
	if(CONFIG_GET(flag/assistants_have_maint_access) || !CONFIG_GET(flag/jobs_have_minimal_access)) //Config has assistant maint access set
		. = ..()
		. |= list()
	else
		return ..()

/datum/outfit/job/citizen
	name = "Citizen"
	jobtype = /datum/job/citizen

/datum/outfit/job/citizen/pre_equip(mob/living/carbon/human/H)
	..()
	if (CONFIG_GET(flag/grey_assistants))
		uniform = /obj/item/clothing/under/color/grey
	else
		uniform = /obj/item/clothing/under/color/random
