angular.module('onlinestore', [])
.controller('home', function($scope, $http) {
    $http.get('http://localhost:9090/product').
        then(function(response) {
            $scope.product = response.data;
        });
});
