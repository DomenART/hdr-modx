<h4 id="comment-new-link">
    <a href="#" class="btn btn-default">{'ticket_comment_create' | lexicon}</a>
</h4>
<div class="comment-form-container">
    <div class="comment-form__header">
        Добавить комментарий
    </div>
    <div id="comment-form-placeholder">
        <form id="comment-form" action="" method="post" class="comment-form">
            <div id="comment-preview-placeholder"></div>
            <input type="hidden" name="thread" value="{$thread}"/>
            <input type="hidden" name="parent" value="0"/>
            <input type="hidden" name="id" value="0"/>

            <div class="uk-margin">
                <label for="comment-name" class="uk-form-label">{'ticket_comment_name' | lexicon}</label>
                <div class="uk-form-controls">
                    <input type="text" name="name" value="{$name}" id="comment-name" class="uk-input" placeholder="Автор"/>
                    <span class="error"></span>
                </div>
            </div>

            <div class="uk-margin">
                <label for="comment-email" class="uk-form-label">{'ticket_comment_email' | lexicon}</label>
                <div class="uk-form-controls">
                    <input type="text" name="email" value="{$email}" id="comment-email" class="uk-input" placeholder="mail@mail.com"/>
                    <span class="error"></span>
                </div>
            </div>

            <div class="uk-margin">
                <label for="comment-editor" class="uk-form-label">{'ticket_comment_text' | lexicon}</label>
                <div class="uk-form-controls">
                    <textarea name="text" id="comment-editor" cols="30" rows="6" class="uk-textarea" placeholder="Текст комментария"></textarea>
                </div>
            </div>

            {if $captcha}
                <div class="uk-margin">
                    <label for="comment-captcha" id="comment-captcha" class="uk-form-label">{$captcha}</label>
                    <input type="text" name="captcha" value="" id="comment-captcha" class="uk-input" />
                    <span class="error"></span>
                </div>
            {/if}

            <div class="form-actions">
                <button type="submit" class="uk-button button-gray uk-margin-small-right submit" title="Ctrl + Shift + Enter">{'ticket_comment_save' | lexicon}<span class="button-arrow"></span></button>
                <input type="button" class="uk-button uk-button-text preview" value="{'ticket_comment_preview' | lexicon}" title="Ctrl + Enter"/>
                <span class="time"></span>
            </div>
        </form>
    </div>
</div>