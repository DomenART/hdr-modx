<h4 id="comment-new-link">
    <a href="#" class="btn btn-default">[[%ticket_comment_create]]</a>
</h4>
<div class="comment-form-container">
    <div id="comment-form-placeholder" class="comment-form">
        <div class="comment-form__header">
            Добавить комментарий
        </div>
        <form id="comment-form" action="" method="post" class="well">
            <div id="comment-preview-placeholder"></div>
            <input type="hidden" name="thread" value="[[+thread]]"/>
            <input type="hidden" name="parent" value="0"/>
            <input type="hidden" name="id" value="0"/>

            <div class="form-group">
                <div>
                    <label for="comment-name">[[%ticket_comment_name]]</label>
                </div>
                <input type="text" name="name" value="[[+name]]" id="comment-name" class="form-control" placeholder="Автор"/>
                <span class="error"></span>
            </div>

            <div class="form-group">
                <div>
                    <label for="comment-email">[[%ticket_comment_email]]</label>
                </div>
                <input type="text" name="email" value="[[+email]]" id="comment-email" class="form-control" placeholder="mail@mail.com"/>
                <span class="error"></span>
            </div>

            <div class="form-group">
                <div>
                  <label for="comment-editor"></label>
                </div>
                <textarea name="text" id="comment-editor" cols="30" rows="6" class="form-control" placeholder="Текст комментария"></textarea>
            </div>

            [[+captcha]]

            <div class="form-actions">
                <button type="submit" class="btn btn-primary submit comment-send"
                       title="Ctrl + Shift + Enter">[[%ticket_comment_save]]<span uk-icon="icon: arrow-right"></span></button>
                <input type="button" class="btn preview comment-preview" value="[[%ticket_comment_preview]]"
                 title="Ctrl + Enter"/>
                <span class="time"></span>
            </div>
        </form>
    </div>
</div>
<!--tickets_captcha
<div class="form-group">
    <label for="comment-captcha" id="comment-captcha">[[+captcha]]</label>
    <input type="text" name="captcha" value="" id="comment-captcha" class="form-control" />
    <span class="error"></span>
</div>
-->