{var $links = $description | split : "\n"}
<div class="feedback-item">
    <div class="feedback-item__title">
        {$pagetitle}
        {foreach $links as $link}
            {if $link | match : '*vk.com*'}
                <a href="{$link}" target="_blank">
                    <i class="icon-vk"></i>
                </a>
            {elseif $link | match : '*twitter.com*'}
                <a href="{$link}" target="_blank">
                    <i class="icon-twitter"></i>
                </a>
            {elseif $link | match : '*youtube.com*'}
                <a href="{$link}" target="_blank">
                    <i class="icon-youtube"></i>
                </a>
            {elseif $link | match : '*instagram.com*'}
                <a href="{$link}" target="_blank">
                    <i class="icon-instagram"></i>
                </a>
            {else}
                <a href="{$link}" target="_blank">{$link}</a>
            {/if}
        {/foreach}
    </div>
    <div class="feedback-item__text">
        {$content}
    </div>
</div>