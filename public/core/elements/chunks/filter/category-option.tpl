{foreach $_modx->resource.categories | split : "\n" as $row}
    {if $row | translit === $value}
        <option value="{$value}" {$selected} {$disabled} class="{$disabled}">{$row}</option>
    {/if}
{/foreach}