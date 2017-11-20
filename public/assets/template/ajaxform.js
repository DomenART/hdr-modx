/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 219);
/******/ })
/************************************************************************/
/******/ ({

/***/ 219:
/***/ (function(module, exports) {

var AjaxForm = {

    initialize: function (afConfig) {
        if (!jQuery().ajaxForm) {
            document.write('<script src="' + afConfig.assetsUrl + 'js/lib/jquery.form.min.js"><\/script>');
        }

        /*$(document).ready(function() {
        	$.jGrowl.defaults.closerTemplate = '<div>[ '+afConfig.closeMessage+' ]</div>';
        });*/

        $(document).on('submit', afConfig.formSelector, function (e) {
            $(this).ajaxSubmit({
                dataType: 'json',
                data: { pageId: afConfig.pageId },
                url: afConfig.actionUrl,
                beforeSerialize: function (form, options) {
                    form.find(':submit').each(function () {
                        if (!form.find('input[type="hidden"][name="' + $(this).attr('name') + '"]').length) {
                            $(form).append($('<input type="hidden">').attr({
                                name: $(this).attr('name'),
                                value: $(this).attr('value')
                            }));
                        }
                    });

                    form.find('[name="nomail"]').val('');
                },
                beforeSubmit: function (fields, form) {
                    if (typeof afValidated != 'undefined' && afValidated == false) {
                        return false;
                    }
                    form.find('.uk-form-danger').html('');
                    form.find('.uk-form-danger').removeClass('uk-form-danger');
                    form.find('input,textarea,select,button').attr('disabled', true);
                    return true;
                },
                success: function (response, status, xhr, form) {
                    form.find('input,textarea,select,button').attr('disabled', false);
                    response.form = form;
                    $(document).trigger('af_complete', response);
                    if (!response.success) {
                        AjaxForm.Message.error(response.message);
                        if (response.data) {
                            var key, value;
                            for (key in response.data) {
                                if (response.data.hasOwnProperty(key)) {
                                    value = response.data[key];
                                    form.find('.error_' + key).html(value).addClass('uk-form-danger');
                                    form.find('[name="' + key + '"]').addClass('uk-form-danger');
                                }
                            }
                        }
                    } else {
                        AjaxForm.Message.success(response.message);
                        form.find('.uk-form-danger').removeClass('uk-form-danger');
                        form[0].reset();
                    }
                }
            });
            e.preventDefault();
            return false;
        });

        /*$(document).on('reset', afConfig.formSelector, function(e) {
        	$(this).find('.error').html('');
        	AjaxForm.Message.close();
        });*/
    }

};

AjaxForm.Message = {
    success: function (message, sticky) {
        if (message) {
            timeout = sticky ? 0 : 5000;
            UIkit.notification({
                message: message,
                status: 'success',
                timeout: timeout
            });
        }
    },
    error: function (message, sticky) {
        if (message) {
            timeout = sticky ? 0 : 5000;
            UIkit.notification({
                message: message,
                status: 'danger',
                timeout: timeout
            });
        }
    },
    info: function (message, sticky) {
        if (message) {
            timeout = sticky ? 0 : 5000;
            UIkit.notification({
                message: message,
                status: 'info',
                timeout: timeout
            });
        }
    }
    /*,close: function() {
    	UIkit.notify('close');
    }*/
};

/***/ })

/******/ });