<template>
    <div class="calendar">
        <div class="calendar-header">
            <div class="calendar-header__left" @click="prevMonth"></div>
            <div class="calendar-header__title">
                {{curYearMonth}}
            </div>
            <div class="calendar-header__right" @click="nextMonth"></div>
        </div>
        <div class="calendar-grid uk-clearfix">
            <div v-for="date in dayList"
            :class="[{
                'calendar-grid__item': true,
                'calendar-grid__item--events': date.events,
                'calendar-grid__item--inactive': !date.status,
                'calendar-grid__item--active': date.status,
                'calendar-grid__item--today': (date.date == today)
            }]"
            :key="date.date"
            @click="loadEvents(date)"
            >
                {{ date.day }}
            </div>
        </div>
    </div>
</template>

<script>
    import moment from 'moment'
    import queryString from 'query-string'

	module.exports = {
		props: ['initialEvents', 'initialDate'],

		data () {
			return {
                events: this.initialEvents?JSON.parse(this.initialEvents):[],
                weekStartOn: 1,
                curYear: new Date().getFullYear(),
                curMonth: new Date().getMonth(),
                curDate: new Date().getDate(),
			}
		},

		mounted () {
            if(this.initialDate) {
                this.setCurrentDate(moment(this.initialDate))
            }
		},

		computed: {
            dayList () {
                let dateObj = new Date()
                let firstDay = new Date(this.curYear, this.curMonth, 1)
                let dayOfWeek = firstDay.getDay()
                // Calculate the offset based on the current date
                if (this.weekStartOn > dayOfWeek) {
                    dayOfWeek = dayOfWeek - this.weekStartOn + 7
                } else if (this.weekStartOn < dayOfWeek) {
                    dayOfWeek = dayOfWeek - this.weekStartOn
                } else {
                    dayOfWeek = dayOfWeek - 1;
                }
                let startDate = new Date(firstDay)
                startDate.setDate(firstDay.getDate() - dayOfWeek)
                let item, days = [], tmpItem
                for (let i = 0;  i < 42;  i++) {
                    item = new Date(startDate)
                    item.setDate(startDate.getDate() + i)
                    tmpItem = {
                        date: this.dateFormat(item),
                        day: item.getDate(),
                        status: this.curMonth === item.getMonth()
                    }
                    for(var index in this.events) { 
                        if(tmpItem.date == index) {
                            tmpItem.events = this.events[index]
                        }
                    }
                    days.push(tmpItem)
                }
                return days
            },

            today () {
                return this.dateFormat(new Date())
            },

            curYearMonth () {
                moment.locale('ru')
                return moment(this.getCurrentDate()).format("MMMM YYYY")
            }
		},

		methods: {
            dateFormat (dateObj) {
                return moment(dateObj).format("YYYY-MM-DD")
            },

            getCurrentDate () {
                return new Date(this.curYear, this.curMonth, this.curDate)
            },

            setCurrentDate (date) {
                let arr = date.format("YYYY/MM/D").split('/')
                this.curYear = arr[0]
                this.curMonth = arr[1] - 1
                this.curDate = arr[2]
            },

            prevMonth () {
                this.setCurrentDate(moment(this.getCurrentDate()).subtract(1, 'months'))
            },

            nextMonth () {
                this.setCurrentDate(moment(this.getCurrentDate()).add(1, 'months'))
            },

            loadEvents (date) {
                if(date.events) {
                    let parsed = queryString.parse(location.search)
                    parsed.date = date.date
                    // parsed.resources = date.events.join(',')
                    location.search = queryString.stringify(parsed)
                }
            }
		}
	}
</script>

<style lang="sass">
.calendar
    background-color: #3a3a39
    padding: 10px
    box-sizing: border-box
    margin: 20px 0
    @media (min-width: 1750px) and (min-height: 600px)
        width: 200px
        position: fixed
        left: 50px
        top: 50%
        transform: translateY(-50%)
        margin-top: 200px


.calendar-grid
    margin-right: -7px

.calendar-grid__item
    box-sizing: border-box
    float: left
    width: 14.2857%
    color: #999999
    font-family: Rubik
    font-size: 14px
    font-weight: 400
    text-align: center
    line-height: 1.36
    letter-spacing: 0.07px
    border: 1px solid #636362
    margin: -1px -1px 0 0;
    cursor: pointer
    &:hover
        color: #999999
        background-color: rgba(0,0,0,.2)
    &--today
        background-color: rgba(0,0,0,.8)
    &--inactive
        color: #666666
    &--events
        color: #000000
        background-color: #d29155


.calendar-grid__item:nth-child(7n+1)
    clear: both

.calendar-header
    overflow: hidden
    position: relative
    margin-bottom: 10px

.calendar-header__left
    width: 26px
    height: 22px
    background: url('../../img/icon-arrow-left.svg') no-repeat 50% 50%
    background-size: 100% 100%
    position: absolute
    left: 0
    top: 50%
    transform: translateY(-50%)
    cursor: pointer

.calendar-header__title
    color: #fefefe
    font-family: Rubik
    font-size: 16px
    font-weight: 400
    letter-spacing: 0.08px
    text-align: center

.calendar-header__right
    width: 26px
    height: 22px
    background: url('../../img/icon-arrow-right.svg') no-repeat 50% 50%
    background-size: 100% 100%
    position: absolute
    right: 0
    top: 50%
    transform: translateY(-50%)
    cursor: pointer
</style>