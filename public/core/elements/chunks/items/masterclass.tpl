<article class="masterclass-item uk-grid uk-grid-collapse uk-child-width-1-2">
            <div class="masterclass-item__promo" style="background-image: url('assets/template/img/event.jpg')">
                <div class="masterclass-item__date">
                    {set $datetime = $date[0] | strtotime}
                    <div class="masterclass-item__date-first">{$datetime | date_format : '%m'}</div>
                    <div class="masterclass-item__date-last">{$datetime | date_format : '%B `%y'}</div>
                </div>
                <div class="masterclass-item__places">
                    Мест: <span>{$places[0]}</span>
                </div>
                <div class="masterclass-item__hours">
                    Длительность обучения: <span>{$duration[0]} {$duration[0] | units : 'час|часа|часов'}</span>
                </div>
                <div class="masterclass-item__price">
                    Цена: <span>{$price} ₽</span>
                </div>  
                <a href="#" class="masterclass-item__invite">Пригласить друга</a>
            </div>
            <div class="masterclass-item__description">   
                {set $expertinfo = $expert[0] | split : '|'}
                <div class="master-class-item__expert uk-flex">
                    <div class="masterclass-item__photo" style="background-image: url({$expertinfo[1] ?: 'assets/template/img/master.png'})"></div>
                    <div>
                        <div class="masterclass-item__status">
                            Эксперт мастер-класса
                        </div>
                        <div class="masterclass-item__name">
                            {$expertinfo[0]}
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