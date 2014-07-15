(function (angular) {

    'use strict';

    /**
     * Converts a string into a boolean value if the lowercase string equals a
     * true-like value.
     * @param {string} input
     * @returns {boolean}
     */
    var resolveBoolean = function (input) {
        if (input && typeof input === 'string') {
            input = input.toLowerCase();
            var truthValues = ['true', 'yes', '1'];
            for (var i = 0; i < truthValues.length; i++) {
                if (truthValues[i] === input) {
                    return true;
                }
            }
        }
        return false;
    };

    var defaults = {
        size: 200,
        strokeWidth: 20,
        stroke: 'black',
        background: null
    };

    var app = angular.module('angular-progress-arc', []);
    app.directive('progressArc', function () {
        return {
            restrict: 'E',
            scope: {
                size:             '@', // Size of element in pixels.
                strokeWidth:      '@', // Width of progress arc stroke.
                stroke:           '@', // Color/appearance of stroke.
                counterClockwise: '@', // Boolean value indicating
                progress:         '&', // Expression evaluating to float [0.0, 1.0]
                background:  '@'  // Color of the background ring. Defaults to null.
            },
            compile: function (element, attr) {

                // Resolve default values.
                angular.forEach(defaults, function (value, key) {
                    if (!attr[key]) {
                        attr[key] = value;
                    }
                });

                return function (scope, element, attr) {
                    // Firefox has a bug where it doesn't handle rotations and stroke dashes correctly.
                    // https://bugzilla.mozilla.org/show_bug.cgi?id=949661
                    scope.offset = /firefox/i.test(navigator.userAgent) ? -89.9 : -90;
                    var updateRadius = function () {
                        scope.strokeWidthCapped = Math.min(scope.strokeWidth, scope.size / 2);
                        scope.radius = (scope.size - scope.strokeWidthCapped) / 2 - 1;
                        scope.circumference = 2 * Math.PI * scope.radius;
                    };
                    scope.$watchCollection('[size, strokeWidth]', updateRadius);
                    scope.$watch('counterClockwise', function () {
                        if (typeof scope.counterClockwise !== 'boolean') {
                            scope.counterClockwise = resolveBoolean(scope.counterClockwise);
                        }
                    });
                    updateRadius();
                };
            },
            template:
                '<svg ng-attr-width="{{ size }}" ng-attr-height="{{ size }}">' +
                    '<circle fill="none" ' +
                        'ng-if="background" ' +
                        'ng-attr-cx="{{ size / 2 }}" ' +
                        'ng-attr-cy="{{ size / 2 }}" ' +
                        'ng-attr-r="{{ radius }}" ' +
                        'ng-attr-stroke="{{ background }}" ' +
                        'ng-attr-stroke-width="{{ strokeWidthCapped }}"' +
                        '></circle>' +
                    '<circle fill="none" ' +
                        'ng-attr-cx="{{ size / 2 }}" ' +
                        'ng-attr-cy="{{ size / 2 }}" ' +
                        'ng-attr-r="{{ radius }}" ' +
                        'ng-attr-stroke="{{ stroke }}" ' +
                        'ng-attr-stroke-width="{{ strokeWidthCapped }}"' +
                        'ng-attr-stroke-dasharray="{{ circumference }}"' +
                        'ng-attr-stroke-dashoffset="{{ (counterClockwise ? -1 : 1 ) * (1 - progress()) * circumference }}"' +
                        'ng-attr-transform="rotate({{ offset }}, {{ size / 2 }}, {{ size / 2 }})"' +
                        '></circle>' +
                '</svg>'
        };
    });

})(window.angular);
