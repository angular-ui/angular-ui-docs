$.ajax('modules.json').then(function(modules){
	var deferreds = [];
	$.each(modules, function(i, module){
		deferreds.push($.getScript('https://github.com/'+module.repo+'/raw/master/src/'+module.name+'.js'));
	});
	$.when(deferreds).done(function(){
		setTimeout(function(){
			var dependencies = $.map(modules, function(o) { return o.module; });
			angular.module('Docs', dependencies).run(function($rootScope){
				$rootScope.modules = modules;
			});
			angular.bootstrap(document, ['Docs']);
		}, 1000);
	});
}, function(error){
	alert('There was a problem loading the modules');
});