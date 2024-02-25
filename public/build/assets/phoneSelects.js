let app = angular.module('myApp', []);

app.controller('myController', function($scope, $http) {
    // Adatok inicializálása
    $scope.brands = [];
    $scope.phoneModels = [];
    $scope.types = [];
    $scope.typeParts = [];

    // Adatok lekérése a Laravel API-ból
    $http.get('api/brands').then(function(response) {
        $scope.brands = response.data;
    });

    $scope.$watch('selectedBrand', function(choosedBrand, oldBrand) {
        if (choosedBrand !== oldBrand) {
            fetchPhoneModels(choosedBrand);
            console.log('Selected Brand id:', $scope.selectedBrand);
        }
    });

    $scope.$watch('selectedModel', function(newModel, oldModel) {
        if (newModel !== oldModel) {
            fetchTypes(newModel);
            console.log('Selected Model id:', $scope.selectedModel);
        }
    });

    $scope.$watch('selectedType', function(newType, oldType) {
        if (newType !== oldType) {
            fetchTypeParts(newType);
            console.log('Selected Type id:', $scope.selectedType);
        }
    });


    function fetchPhoneModels(brandId) {
        $http.get('api/get-phone-models/' + brandId).then(function(response) {
            $scope.phoneModels = response.data;
            console.log("Választható model: ", $scope.phoneModels);
        });
    }

    function fetchTypes(modelId) {
        $http.get('api/get-types/' + modelId).then(function(response) {
            $scope.types = response.data;
            console.log("Választható tipus: ", $scope.types);
        });
    }

    function fetchTypeParts(typeId) {
        $http.get('api/get-type-parts/' + typeId).then(function(response) {
            if (response.data && response.data.typeParts && response.data.typeParts.length > 0) {
                $scope.typeParts = response.data.typeParts;
                console.log("Választható szerviz: ", $scope.typeParts);
                
            } else {
                $scope.typeParts = [];
                $scope.selectedTypePartInfo = "Nincsenek elérhető típusrészek.";
            }
        }, function errorCallback(error) {
            $scope.typeParts = [];
            $scope.selectedTypePartInfo = "";
            console.error('Hiba történt a lekérdezés során:', error);
        });
    }

    $scope.$watch('selectedTypePart', function(newVal, oldVal) {
        if (newVal !== oldVal) {
            updateSelectedTypePartInfo();
        }
    });
    function updateSelectedTypePartInfo() {
        console.log($scope.typeParts); //ez jó itt még itt vannak az adatok
        let lastTypePart = $scope.typeParts.find(typePart => typePart.type_part_id === $scope.selectedTypePart);
        console.log(lastTypePart); //ez itt undefinied
    
        if (lastTypePart && lastTypePart.repair && lastTypePart.price) {
            $scope.selectedTypePartInfo = lastTypePart.type_part_name + ': ' + lastTypePart.repair + ' - ' + lastTypePart.price;
            console.log("Kiválasztott szerviz: ", $scope.selectedTypePartInfo);
            document.getElementById("serviceFee").innerHTML = $scope.selectedTypePartInfo;
        } else {
            console.error('A lastTypePart vagy annak tulajdonságai null vagy undefined.');
        }
    }
    
    

    $scope.sendEmail = function() {
        $scope.selectedTypePartInfo;
        console.log("E-mailben küldendő adatok: ", $scope.selectedTypePartInfo);
    };
    $http({
        method: 'POST',  
        url: 'api/set-selected-type-part-info',
        data: { selectedTypePartInfo: 'Az adatok, amiket elküldesz' }
    }).then(
        function successCallback(response) {
            // Sikeres válasz esetén
        },
        function errorCallback(error) {
            // Hiba esetén
        }
    );
});
