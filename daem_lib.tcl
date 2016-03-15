;#Tcl function library

;################################################
;# constant definitions
;################################################



;################################################
;# general
;################################################a


proc get_ns_ifaces {gap ns_name} {
	set ns_fd [dict get $gap netns_p $ns_name]
	return [ns_ifaces [ns_get_ifaces $ns_fd]]
}

proc check_netns_p {gap} {
	upvar #0 $gap global_app_p
	if {[dict exists $global_app_p netns_p]} {
		return [dict keys [dict get $global_app_p netns_p]]
	}
	;# netns_p not filled yet
	dict set global_app_p netns_p [ns_get_netns_p]
	return [dict keys [dict get $global_app_p netns_p]]
}



