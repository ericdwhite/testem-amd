define(['underscore'], function(){
	var Mapper = {}

	Mapper.double = function(numbers){
		return _.map(numbers, function(number){
			return number*2
		})
	}

	return Mapper
})
