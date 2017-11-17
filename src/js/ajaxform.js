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
                dataType: 'json'
                , data: { pageId: afConfig.pageId }
                , url: afConfig.actionUrl
                , beforeSerialize: function (form, options) {
                    form.find(':submit').each(function () {
                        if (!form.find('input[type="hidden"][name="' + $(this).attr('name') + '"]').length) {
                            $(form).append(
                                $('<input type="hidden">').attr({
                                    name: $(this).attr('name'),
                                    value: $(this).attr('value')
                                })
                            );
                        }
                    })

                    form.find('[name="nomail"]').val('');
                }
                , beforeSubmit: function (fields, form) {
                    if (typeof (afValidated) != 'undefined' && afValidated == false) {
                        return false;
                    }
                    form.find('.uk-form-danger').html('');
                    form.find('.uk-form-danger').removeClass('uk-form-danger');
                    form.find('input,textarea,select,button').attr('disabled', true);
                    return true;
                }
                , success: function (response, status, xhr, form) {
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
                    }
                    else {
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
    }
    , error: function (message, sticky) {
        if (message) {
            timeout = sticky ? 0 : 5000;
            UIkit.notification({
                message: message,
                status: 'danger',
                timeout: timeout
            });
        }
    }
    , info: function (message, sticky) {
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
