<article class="masterclass-item uk-grid uk-grid-collapse uk-child-width-1-2">
    <div class="masterclass-item__promo" style="background-image: url({$image ?: 'assets/template/img/event.jpg'})">
        <div class="masterclass-item__date">
            {set $datetime = $date | strtotime}
            <div class="masterclass-item__date-first">{$datetime | date_format : '%d'}</div>
            <div class="masterclass-item__date-last">{$datetime | date_format : '%B `%y'}</div>
        </div>
        <div class="masterclass-item__places">
            Мест:
            <span>{$places}</span>
        </div>
        <div class="masterclass-item__hours">
            Длительность обучения:
            <span>{$duration} {$duration | units : 'час|часа|часов'}</span>
        </div>
        <div class="masterclass-item__price">
            Цена:
            <span>{$price | number_format : 0 : ',' : ' '} ₽</span>
        </div>
        <a href="#" class="masterclass-item__invite">Пригласить друга</a>
    </div>
    <div class="masterclass-item__description">
        {set $expert = $description | split : '|'}
        <div class="master-class-item__expert uk-flex">
            <div class="masterclass-item__photo" style="background-image: url({$expert[1] ?: 'assets/template/img/master.png'})"></div>
            <div>
                <div class="masterclass-item__status">
                    Эксперт мастер-класса
                </div>
                <div class="masterclass-item__name">
                    {$expert[0]}
                </div>
            </div>
        </div>
        <div class="masterclass-item__title">
            {$pagetitle}
        </div>
        <div class="masterclass-item__announcement">
            {$introtext}
        </div>
        <a href="{$uri}" class="masterclass-item__more">Читать больше</a>
    </div>
</article>