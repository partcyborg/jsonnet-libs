// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/drone/drone-yaml/yaml

package yaml

#Cron: {
	version?: string    @go(Version)
	kind?:    string    @go(Kind)
	type?:    string    @go(Type)
	name?:    string    @go(Name)
	spec?:    #CronSpec @go(Spec)
}

#CronSpec: {
	schedule?:   string          @go(Schedule)
	branch?:     string          @go(Branch)
	deployment?: #CronDeployment @go(Deploy)
}

#CronDeployment: {
	target?: string @go(Target)
}