let app = angular.module('myApp', []);

app.controller('myController', function($scope, $http) {
    // Adatok inicializálása
    $scope.teszt = "fut";
    console.log($scope.teszt);
    $scope.brands = [];
    $scope.phoneModels = [];
    $scope.types = [];
    
    // Adatok lekérése a Laravel API-ból
    //az angulár $http szolgáltatása a háttérben lévő API-kat tudja meghívni
    $http.get('api/brands').then(function(response) {
        $scope.brands = response.data;
        console.log($scope.brands);
    });
//a $watch function figyeli a változók változásait
    $scope.$watch('selectedBrand', function(choosedBrand, oldBrand) {
        //figyelni kell nem e történik újabb kiválasztás
        if (choosedBrand !== oldBrand) {
            // Brand választás esetén lekérjük a hozzá tartozó modelleket
            $http.get('api/get-phone-models/' + choosedBrand).then(function(response) {
                $scope.phoneModels = response.data;
                console.log($scope.phoneModels);
            });
        }
    });

    $scope.$watch('selectedModel', function(newModel, oldModel) {
        if (newModel !== oldModel) {
            // Model választás esetén lekérjük a hozzá tartozó típusokat
            $http.get('api/get-types/' + newModel).then(function(response) {
                $scope.types = response.data;
                console.log($scope.types);
            });
        }
    });

    let typeId;

$scope.$watch('selectedType', function(newType, oldType) {
    if (newType !== oldType) {
        typeId = newType;
        $http({
            method: 'GET',
            url: 'api/get-type-parts/' + typeId
        }).then(
            function successCallback(response) {
                if (response.data && response.data.typeParts && response.data.typeParts.length > 0) {
                    $scope.typeParts = response.data.typeParts;
                    console.log($scope.typeParts);
        
                    let lastTypePart = $scope.typeParts[$scope.typeParts.length - 1];
                    console.log(lastTypePart);
        
                    // Ellenőrizzük, hogy $scope.selectedTypePartInfo nem null és nem undefined
                    if (lastTypePart && lastTypePart.repair && lastTypePart.price) {
                        $scope.selectedTypePartInfo = lastTypePart.repair + ' - ' + lastTypePart.price;
                        //$scope.serviceTime = lastTypePart.repair;
                        document.getElementById("serviceFee").innerHTML = "Szükséges javítási idő: " + lastTypePart.repair + "<br>" + "Fizetendő szervíz díj: " + lastTypePart.price + " Ft";
                        console.log($scope.selectedTypePartInfo);
                    } else {
                        console.error('A lastTypePart vagy annak tulajdonságai null vagy undefined.');
                    }
                } else {
                    $scope.typeParts = [];
                    $scope.selectedTypePartInfo = "Nincsenek elérhető típusrészek.";
                    console.error('A típusrészek listája üres vagy undefined.');
                }
            },
            function errorCallback(error) {
                $scope.typeParts = [];
                $scope.selectedTypePartInfo = "";
                
                console.error('Hiba történt a lekérdezés során:', error);
            }
        );
        
        
    }
});

    
    
    




    $scope.sendEmail = function() {
        // Itt küldheted el az e-mailt a kiválasztott elemekkel
        console.log('Selected Brand:', $scope.selectedBrand);
        console.log('Selected Model:', $scope.selectedModel);
        console.log('Selected Type:', $scope.selectedType);
        
        // Ide írd meg az e-mail küldés logikáját
    };
});
